/// @feather ignore all

function Figgy() {
	#region __private
	
	static __scope = undefined;
	static __rootScope = undefined;
	static __section = undefined;
	static __windowed = false;
	static __windowSectioned = false;
	static __t = undefined;
	
	static __current = undefined;
	static __default = undefined;
	static __lastSave = undefined;
	
	static __init = function(_callback) {
		__current = {};
		__scope = __current;
		__rootScope = __current;
		__section = undefined;
		
		var _overlayOpen = is_debug_overlay_open();
		
		__FIGGY_BENCH_START;
		_callback();
		__default = variable_clone(__current);
		__figgyLogTimed("SETUP: completed");
		
		if (not _overlayOpen and not FIGGY_WINDOW_DEFAULT_START_VISIBLE) {
			show_debug_overlay(false);
		}
		
		__load();
	};
	static __initControls = function() {
		dbg_section(FIGGY_CONTROLS_NAME, FIGGY_CONTROLS_OPEN);
		if (__FIGGY_IN_IDE) {
			dbg_button("Save", function() {
				__save();
			}, 55, 20);
			dbg_same_line();
		}
		dbg_button("Import", function() {
			import();
		}, 65, 20);
		dbg_same_line();
		dbg_button("Export", function() {
			export();
		}, 65, 20);
		dbg_same_line();
		dbg_button("Default", function() {
			resetToDefault();
		}, 75, 20);
		if (__FIGGY_IN_IDE) {
			dbg_same_line();
			dbg_button("Last Save", function() {
				resetToLastSave();
			}, 85, 20);
		}
	};
	
	static __move = function(_a, _b) {
		var _keys = struct_get_names(_a);
		var _i = 0; repeat (array_length(_keys)) {
			var _key = _keys[_i];
			var _value = _a[$ _key];
			if (is_struct(_value)) {
				__move(_value, _b[$ _key]);
			}
			else {
				_b[$ _key] = _value;
			}
			_i++;
		}
	};
	
	static __saveDelta = function(_current, _default) {
        var _names = struct_get_names(_current);
        var _i = 0; repeat (array_length(_names)) {
            var _name = _names[_i];
            var _currentValue = _current[$ _name];
            var _defaultValue = _default[$ _name];
            if (is_struct(_currentValue)) {
                __saveDelta(_currentValue, _defaultValue);
                if (struct_names_count(_currentValue) == 0) {
                    struct_remove(_current, _name);
                }
            }
            else if (_currentValue == _defaultValue) {
                struct_remove(_current, _name);
            }
            _i++;
        }
    };
    static __saveRaw = function(_path) {
		var _data = __current;
		if (FIGGY_FILE_DELTA) {
			_data = variable_clone(_data);
			__saveDelta(_data, __default);
		}
        
        var _string = json_stringify(_data, FIGGY_FILE_PRETTIFY);
        var _saveBuffer = undefined;
        
        if (FIGGY_FILE_OBFUSCATE) {
            var _stringEncoded = base64_encode(_string);
            var _size = string_byte_length(_stringEncoded);
            var _rawBuffer = buffer_create(_size, buffer_fixed, 1);
            buffer_write(_rawBuffer, buffer_text, _stringEncoded);
            _saveBuffer = buffer_compress(_rawBuffer, 0, _size);
            buffer_delete(_rawBuffer);
        }
        else {
            var _size = string_byte_length(_string);
            var _saveBuffer = buffer_create(_size, buffer_fixed, 1);
            buffer_write(_saveBuffer, buffer_text, _string);
        }
        
        buffer_save(_saveBuffer, _path);
        buffer_delete(_saveBuffer);
    };
    static __save = function(_log = true) {
        if (_log) {
            __FIGGY_BENCH_START;
        }
        
        var _path = __FIGGY_FILE_PATH;
        __saveRaw(_path);
        __refreshLastSave();
        
        if (_log) {
            __figgyLogTimed($"SAVE: success at \"{_path}\"");
        }
        
        return self;
    };
	
	static __loadProcess = function(_new, _current) {
        var _names = struct_get_names(_new);
        var _i = 0; repeat (array_length(_names)) {
            var _name = _names[_i];
            var _newValue = _new[$ _name];
            var _currentValue = _current[$ _name];
            if (typeof(_newValue) == typeof(_currentValue)) {
                if (is_struct(_newValue)) {
                    __loadProcess(_newValue, _currentValue);
                }
                else {
                    _current[$ _name] = _newValue;
                }
            }
            _i++;
        }
    };
    static __load = function(_path = __FIGGY_FILE_PATH, _mainLoad = true) {
        try {
            if (_mainLoad) {
                __FIGGY_BENCH_START;
            }
            
            var _buffer = buffer_load(_path);
            var _flippedObfuscate = false;
            try {
                var _bufferDecompressed = buffer_decompress(_buffer);
                var _string = buffer_read(_bufferDecompressed, buffer_text);
                var _stringDecoded = base64_decode(_string);
                
                buffer_delete(_bufferDecompressed);
                var _data = json_parse(_stringDecoded);
                
                if (not FIGGY_FILE_OBFUSCATE) {
                    _flippedObfuscate = true;
                    __figgyLog($"LOAD: obfuscation flipped, file deobfuscated");
                }
            }
            catch (_) {
                var _string = buffer_read(_buffer, buffer_text);
                var _data = json_parse(_string);
                
                if (FIGGY_FILE_OBFUSCATE) {
                    _flippedObfuscate = true;
                    __figgyLog($"LOAD: obfuscation flipped, file obfuscated");
                }
            }
            buffer_delete(_buffer);
            
            __loadProcess(_data, __current);
            
            if (__FIGGY_IN_IDE and _mainLoad and _flippedObfuscate) {
                __save(false);
                __figgyLog("LOAD: file re-saved");
            }
            
            if (_mainLoad) {
                __figgyLogTimed($"LOAD: success at \"{_path}\"");
            }
        } 
        catch (_) {
            if (__FIGGY_IN_IDE) {
                __save(false);
                __figgyLog($"LOAD: fail at \"{_path}\". Initialized to Default");
            }
        }
    };
	
	static __refreshLastSave = function() {
		__lastSave = variable_clone(__current);
	};
	
	#endregion
	
	#region widgets: scope
	
	/// @param {String} name The window name.
	/// @param {Bool} visible=[FIGGY_WINDOW_DEFAULT_START_VISIBLE] Whether the window should start visible (true) or not (false).
	/// @param {Real} x=[FIGGY_WINDOW_DEFAULT_X] The x position of the window.
	/// @param {Real} y=[FIGGY_WINDOW_DEFAULT_Y] The y position of the window.
	/// @param {Real} width=[FIGGY_WINDOW_DEFAULT_WIDTH] The width of the window.
	/// @param {Real} height=[FIGGY_WINDOW_DEFAULT_HEIGHT] The height of the window.
	/// @desc Scope Widget: creates a struct at the Root level, represented as a DBG View.
	/// Once called, the Root scope becomes inaccessible. All following Widgets will be created in the context of the current Window.
	/// Call this method again to switch the scope to another Window.
	static window = function(_name, _visible = FIGGY_WINDOW_DEFAULT_START_VISIBLE, _x = FIGGY_WINDOW_DEFAULT_X, _y = FIGGY_WINDOW_DEFAULT_Y, _w = FIGGY_WINDOW_DEFAULT_WIDTH, _h = FIGGY_WINDOW_DEFAULT_HEIGHT) {
		__FIGGY_RAWNAME;
		dbg_view($"{FIGGY_WINDOW_DEFAULT_NAME}: {_name}", _visible, _x, _y, _w, _h);
		__rootScope = __current;
		__windowSectioned = false;
		__FIGGY_SECTION;
		__initControls();
		__windowed = true;
		
		return self;
	};
	
	/// @param {String} name The section name.
	/// @param {Bool} open=[FIGGY_SECTION_DEFAULT_OPEN] Whether the section starts open (true) or not (false).
	/// @desc Scope Widget: creates a struct at the current scope (Root/Window), represented as a DBG Section.
	/// Once called, the previous non-Section scope (Root or Window) becomes inaccessible. All following Widgets will be created in the context of the current Section.
	/// Call this method again to switch the scope to another Section.
	static section = function(_name, _open = FIGGY_SECTION_DEFAULT_OPEN) {
		__FIGGY_CATCH_WINDOW;
		__FIGGY_RAWNAME;
		dbg_section(_name, _open);
		__FIGGY_SECTION;
		__windowSectioned = true;
		
		return self;
	};
	
	/// @param {String} name The group name.
	/// @param {Enum.FIGGY_GROUP_ALIGN} align=[FIGGY_GROUP_DEFAULT_ALIGN] The group name alignment.
	/// @desc Scope Widget: creates a struct at the current scope (Root, Window or Section), represented as a DBG Text Separator.
	/// Once called, all following Widgets will be created in the context of the current Group.
	/// Call Figgy.ungroup() to return to the previous scope (Root, Window or Section).
	static group = function(_name, _align = FIGGY_GROUP_DEFAULT_ALIGN) {
		__FIGGY_CATCH_WINDOW;
		__FIGGY_RAWNAME;
		dbg_text_separator($"{FIGGY_GROUP_DEFAULT_NAME_PREFIX}{_name}", _align);
		var _group = {};
		__section[$ _name] = _group;
		__scope = _group;
		
		return self;
	};
	
	/// @param {Bool} separate=[false] Whether to add a separator after the current (if any) group (true) or not (false).
	/// @desc Moves the scope one step back, landing on the previous scope (Root, Window or Section).
	static ungroup = function() {
		separator();
		__scope = __section;
		
		return self;
	};
	
	#endregion
	#region widgets: value
	
	/// @param {String} name The variable name.
	/// @param {Real.Int} default The default value.
	/// @param {Real.Int} min The minimum value.
	/// @param {Real.Int} min The maximum value.
	/// @param {Real.Int} step=[FIGGY_INT_DEFAULT_STEP] Step value.
	/// @desc Value Widget: creates a Real value in the current scope (Root, Window, Section or Group), represented as a DBG Slider.
	static int = function(_name, _default, _min, _max, _step = FIGGY_INT_DEFAULT_STEP) {
		__FIGGY_WIDGET;
		dbg_slider_int(_ref, _min, _max, _name, _step);
		
		return self;
	};
	
	/// @param {String} name The variable name.
	/// @param {Real} default The default value.
	/// @param {Real} min The minimum value.
	/// @param {Real} min The maximum value.
	/// @param {Real} step=[FIGGY_FLOAT_DEFAULT_STEP] Step value.
	/// @desc Value Widget: creates a real value in the current scope (Root, Window, Section or Group), represented as a DBG Float Slider.
	static float = function(_name, _default, _from, _to, _step = FIGGY_FLOAT_DEFAULT_STEP) {
		__FIGGY_WIDGET;
		dbg_slider(_ref, _from, _to, _name, _step);
		
		return self;
	};
	
	/// @param {String} name The variable name.
	/// @param {Bool} default The default value.
	/// @desc Value Widget: creates a boolean value in the current scope (Root, Window, Section or Group), represented as a DBG Checkbox.
	static boolean = function(_name, _default) {
		__FIGGY_WIDGET;
		dbg_checkbox(_ref, _name);
		
		return self;
	};
	
	/// @param {String} name The variable name.
	/// @param {String} default The default value.
	/// @desc Value Widget: creates a string value in the current scope (Root, Window, Section or Group), represented as a DBG Text Input.
	static text = function(_name, _default) {
		__FIGGY_WIDGET;
		dbg_text_input(_ref, _name);
		
		return self;
	};
	
	/// @param {String} name The dropdown name.
	/// @param {Any} default The default value.
	/// @param {Array<Any>} values The array of option values.
	/// @param {Array<String>} names=[values] The array of option names.
	/// @desc Value Widget: creates a <Any> value in the current scope (Root, Window, Section or Group), represented as a DBG Dropdown.
	static multi = function(_name, _default, _values, _names = _values) {
		__FIGGY_WIDGET;
		dbg_drop_down(_ref, _values, _names, _name);
		
		return self;
	};
	
	/// @param {String} name The variable name.
	/// @param {Real,Constant.Color} default The default value.
	/// @desc Value Widget: creates a color value in the current scope (Root, Window, Section or Group), represented as a DBG Color Picker.
	static color = function(_name, _default) {
		__FIGGY_WIDGET;
		dbg_colour(_ref, _name);
		
		return self;
	};
	
	#endregion
	#region widgets: decor
	
	/// @param {String} name The button name.
	/// @param {Func} callback The callback to trigger on press.
	/// @param {Real} width=[auto dbg default] The button width.
	/// @param {Real} height=[auto dbg default] The button height.
	/// @desc Decor Widget: creates a button, represented by DBG Button.
	static button = function(_name, _callback, _w = undefined, _h = undefined) {
		dbg_button(_name, _callback, _w, _h);
		
		return self;
	};
	
	/// @param {String} string The comment string.
	/// @desc Decor Widget: creates a text comment, represented by DBG Text.
	static comment = function(_string) {
		dbg_text(" " + _string);
		
		return self;
	};
	
	/// @param {String} name=[] The separator name.
	/// @param {Enum.FIGGY_GROUP_ALIGN} align=[FIGGY_GROUP_DEFAULT_ALIGN] The separator name alignment.
	/// @desc Decor Widget: creates a separator, represented by DBG Separator with an optional name.
	static separator = function(_name = "", _align = FIGGY_SEPARATOR_DEFAULT_ALIGN) {
		dbg_text_separator(_name, _align);
		
		return self;
	};
	
	#endregion
	#region input/output
	
	/// @param {String} path=[prompt] The path to import the config file from.
	/// @returns {Struct.Figgy}
	static import = function(_path = undefined) {
		_path ??= get_open_filename_ext(__FIGGY_FILE_FILTER, __FIGGY_FILE_NAME, "", "Figgy: Import Config");
		if (_path == "") {
			__figgyLog("IMPORT: canceled");
			return undefined;
		}
		
		__FIGGY_BENCH_START;
		__load(_path, false);
		__figgyLogTimed($"IMPORT: success at \"{_path}\"");
		
		return self;
	};
	
	/// @param {String} path=[prompt] The path to import the config file to.
	/// @returns {Struct.Figgy}
	static export = function(_path = undefined) {
		_path ??= get_save_filename_ext(__FIGGY_FILE_FILTER, __FIGGY_FILE_NAME, "", "Figgy: Export Config");
		if (_path == "") {
			__figgyLog("EXPORT: canceled");
			return;
		}
		
		__FIGGY_BENCH_START;
		__saveRaw(_path);
		__figgyLogTimed($"EXPORT: success at \"{_path}\"");
		
		return self;
	};
	
	#endregion
	#region reset
	
	/// @desc Resets the current config to the default.
	static resetToDefault = function() {
		__FIGGY_BENCH_START;
		__move(__default, __current);
		__figgyLogTimed("RESET TO DEFAULT: completed");
	};
	
	/// @desc Resets the current config to the last save.
	static resetToLastSave = function() {
		__FIGGY_BENCH_START;
		if (__lastSave == undefined) {
			__refreshLastSave();
		}
		__move(__lastSave, __current);
		__figgyLogTimed("RESET TO LAST SAVE: completed");
	};
	
	#endregion
	#region getters
	
	/// @returns {Struct}
	/// @desc Returns the current config.
	static getCurrent = function() {
		return __current;
	};
	
	#endregion
}
