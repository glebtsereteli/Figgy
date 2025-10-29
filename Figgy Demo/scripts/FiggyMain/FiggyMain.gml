/// feather ignore all

function Figgy() {
	#region __private
	
	static __inIDE = (GM_build_type == "run");
	static __onDesktop = ((os_type == os_windows) or (os_type == os_macosx) or (os_type == os_linux));
	static __ioEnabled = (__inIDE and __onDesktop);
	
	static __scope = undefined;
	static __window = undefined;
	static __windowed = false;
	static __windowSectioned = false;
	static __section = undefined;
	
	static __changes = new __FiggyChanges();
	static __onChange = FIGGY_CHANGES_DEFAULT_CALLBACK;
	
	static __current = undefined;
	static __default = undefined;
	static __lastSave = undefined;
	
	static __Init = function() {
		__current = {};
		__scope = __current;
		__window = __scope;
		
		var _overlayOpen = is_debug_overlay_open();
		
		__FIGGY_BENCH_START;
		FiggySetup();
		__default = variable_clone(__current);
		__FiggyLogTimed("SETUP: completed");
		
		if (not _overlayOpen and not FIGGY_WINDOW_DEFAULT_START_VISIBLE) {
			show_debug_overlay(false);
		}
		
		__Load();
		__changes.__Init();
	};
	static __InitControls = function() {
		dbg_section(FIGGY_CONTROLS_NAME, FIGGY_CONTROLS_OPEN);
		if (Figgy.__ioEnabled) {
			dbg_button("Save", function() {
				__Save();
			}, 55, 20);
			dbg_same_line();
		}
		dbg_button("Import", function() {
			Import();
		}, 65, 20);
		dbg_same_line();
		dbg_button("Export", function() {
			Export();
		}, 65, 20);
		dbg_same_line();
		dbg_button("Default", function() {
			ResetToDefault();
		}, 75, 20);
		if (Figgy.__ioEnabled) {
			dbg_same_line();
			dbg_button("Last Save", function() {
				ResetToLastSave();
			}, 85, 20);
		}
	};
	
	static __Move = function(_a, _b) {
		var _keys = struct_get_names(_a);
		var _i = 0; repeat (array_length(_keys)) {
			var _key = _keys[_i];
			var _value = _a[$ _key];
			if (is_struct(_value)) {
				__Move(_value, _b[$ _key]);
			}
			else {
				_b[$ _key] = _value;
			}
			_i++;
		}
	};
	
	static __SaveDelta = function(_current, _default) {
        var _names = struct_get_names(_current);
        var _i = 0; repeat (array_length(_names)) {
            var _name = _names[_i];
            var _currentValue = _current[$ _name];
            var _defaultValue = _default[$ _name];
            if (is_struct(_currentValue)) {
                __SaveDelta(_currentValue, _defaultValue);
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
    static __SaveRaw = function(_path) {
		var _data = __current;
		if (FIGGY_FILE_DELTA) {
			_data = variable_clone(_data);
			__SaveDelta(_data, __default);
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
    static __Save = function(_log = true) {
        if (_log) {
            __FIGGY_BENCH_START;
        }
        
        var _path = __FIGGY_FILE_PATH;
        __SaveRaw(_path);
        __RefreshLastSave();
        
        if (_log) {
            __FiggyLogTimed($"SAVE: success at \"{_path}\"");
        }
        
        return self;
    };
	
	static __LoadProcess = function(_new, _current) {
        var _names = struct_get_names(_new);
        var _i = 0; repeat (array_length(_names)) {
            var _name = _names[_i];
            var _newValue = _new[$ _name];
            var _currentValue = _current[$ _name];
            if (typeof(_newValue) == typeof(_currentValue)) {
                if (is_struct(_newValue)) {
                    __LoadProcess(_newValue, _currentValue);
                }
                else {
                    _current[$ _name] = _newValue;
                }
            }
            _i++;
        }
    };
    static __Load = function(_path = __FIGGY_FILE_PATH, _mainLoad = true) {
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
                    __FiggyLog($"LOAD: obfuscation flipped, file deobfuscated");
                }
            }
            catch (_) {
                var _string = buffer_read(_buffer, buffer_text);
                var _data = json_parse(_string);
                
                if (FIGGY_FILE_OBFUSCATE) {
                    _flippedObfuscate = true;
                    __FiggyLog($"LOAD: obfuscation flipped, file obfuscated");
                }
            }
            buffer_delete(_buffer);
            
            __LoadProcess(_data, __current);
            
            if (Figgy.__ioEnabled and _mainLoad and _flippedObfuscate) {
                __Save(false);
                __FiggyLog("LOAD: file re-saved");
            }
            
            if (_mainLoad) {
                __FiggyLogTimed($"LOAD: success at \"{_path}\"");
            }
        } 
        catch (_) {
            if (Figgy.__ioEnabled) {
                __Save(false);
                __FiggyLog($"LOAD: fail at \"{_path}\". Initialized to Default");
            }
        }
    };
	
	static __RefreshLastSave = function() {
		__lastSave = variable_clone(__current);
	};
	
	#endregion
	
	#region Setup: Scope Widgets
	
	/// @param {String} name The window name.
	/// @param {Bool} visible Whether the window should start visible (true) or not (false). [Default: FIGGY_WINDOW_DEFAULT_START_VISIBLE]
	/// @param {Real} x The x position of the window. [Default: FIGGY_WINDOW_DEFAULT_X]
	/// @param {Real} y The y position of the window. [Default: FIGGY_WINDOW_DEFAULT_Y]
	/// @param {Real} width The width of the window. [Default: FIGGY_WINDOW_DEFAULT_WIDTH]
	/// @param {Real} height The height of the window. [Default: FIGGY_WINDOW_DEFAULT_HEIGHT]
	/// @returns {Struct.Figgy}
	/// @desc Scope Widget. Creates a struct at the Root level, represented as a DBG View.
	/// Once called, the Root scope becomes inaccessible. All following Widgets will be created in the context of the current Window.
	/// Call this method again to switch the scope to another Window.
	static Window = function(_name, _visible = FIGGY_WINDOW_DEFAULT_START_VISIBLE, _x = FIGGY_WINDOW_DEFAULT_X, _y = FIGGY_WINDOW_DEFAULT_Y, _w = FIGGY_WINDOW_DEFAULT_WIDTH, _h = FIGGY_WINDOW_DEFAULT_HEIGHT) {
		__FIGGY_RAWNAME;
		dbg_view($"{FIGGY_WINDOW_NAME}: {_name}", _visible, _x, _y, _w, _h);
		
		__section = undefined;
		__window = {};
		__scope = __window;
		__current[$ _rawName] = __window;
		__windowed = true;
		__windowSectioned = false;
		__InitControls();
		
		return self;
	};
	
	/// @param {String} name The section name.
	/// @param {Bool} scoped Whether the section creates a new scope (true) or not (false). [Default: true]
	/// @param {Bool} open Whether the section starts open (true) or not (false). [Default: FIGGY_SECTION_DEFAULT_OPEN]
	/// @returns {Struct.Figgy}
	/// @desc Scope Widget. IF SCOPED, creates a struct at the current scope (Root/Window), represented as a DBG Section.
	/// Once called, the previous non-Section scope (Root or Window) becomes inaccessible. All following Widgets will be created in the context of the current Section.
	/// Call this method again to switch the scope to another Section.
	/// IF NOT SCOPED, acts as a purely visual DBG Section.
	static Section = function(_name, _scoped = true, _open = FIGGY_SECTION_DEFAULT_OPEN) {
		__FIGGY_CATCH_WINDOW;
		__FIGGY_RAWNAME;
		dbg_section(__FIGGY_SCOPEDNAME, _open);
		if (_scoped) {
			__section = {};
			__window[$ _rawName] = __section;
			__scope = __section;
		}
		__windowSectioned = true;
		
		return self;
	};
	
	/// @param {String} name The group name.
	/// @param {Bool} scoped Whether the section creates a new scope (true) or not (false). [Default: true]
	/// @param {Enum.FIGGY_GROUP_ALIGN} align The group name alignment. [Default: FIGGY_GROUP_DEFAULT_ALIGN]
	/// @returns {Struct.Figgy}
	/// @desc Scope Widget. IF SCOPED: creates a struct at the current scope (Root, Window or Section), represented as a DBG Text Separator.
	/// Once called, all following Value Widgets will be created in the context of the current Group.
	/// IF NOT SCOPED, acts as a purely visual DBG Text Separator.
	static Group = function(_name, _scoped = true, _align = FIGGY_GROUP_DEFAULT_ALIGN) {
		__FIGGY_CATCH_WINDOW;
		__FIGGY_CATCH_FIRST_WINDOW_SECTION;
		__FIGGY_RAWNAME;
		dbg_text_separator(__FIGGY_SCOPEDNAME, _align);
		if (_scoped) {
			var _group = {};
			var _scope = __section ?? __window;
			_scope[$ _rawName] = _group;
			__scope = _group;
		}
		
		return self;
	};
	
	#endregion
	#region Setup: Value Widgets
	
	/// @param {String} name The variable name.
	/// @param {Real.Int} default The default value.
	/// @param {Real.Int} min The minimum value.
	/// @param {Real.Int} max The maximum value.
	/// @param {Real.Int} step Step value. [Default: FIGGY_INT_DEFAULT_STEP]
	/// @param {Func} onChange The function to call when the value is changed. [Default: current onChange callback if set, or FIGGY_CHANGES_DEFAULT_CALLBACK]
	/// @returns {Struct.Figgy}
	/// @desc Value Widget: creates a Real value in the current scope (Root, Window, Section or Group), represented as a DBG Slider.
	/// The onChange callback function receives 3 arguments: (new value, old value, variable name).
	static Int = function(_name, _default, _min, _max, _step = FIGGY_INT_DEFAULT_STEP, _onChange = __onChange) {
		__FIGGY_WIDGET;
		dbg_slider_int(_ref, _min, _max, _name, _step);
		
		return self;
	};
	
	/// @param {String} name The variable name.
	/// @param {Real} default The default value.
	/// @param {Real} min The minimum value.
	/// @param {Real} max The maximum value.
	/// @param {Real} step Step value. [Default: FIGGY_FLOAT_DEFAULT_STEP)
	/// @param {Func} onChange The function to call when the value is changed. [Default: current onChange callback if set, or FIGGY_CHANGES_DEFAULT_CALLBACK]
	/// @returns {Struct.Figgy}
	/// @desc Value Widget: creates a Real value in the current scope (Root, Window, Section or Group), represented as a DBG Float Slider.
	/// The onChange callback function receives 3 arguments: (new value, old value, variable name).
	static Float = function(_name, _default, _min, _max, _step = FIGGY_FLOAT_DEFAULT_STEP, _onChange = __onChange) {
		__FIGGY_WIDGET;
		dbg_slider(_ref, _min, _max, _name, _step);
		
		return self;
	};
	
	/// @param {String} name The variable name.
	/// @param {Bool} default The default value.
	/// @param {Func} onChange The function to call when the value is changed. [Default: current onChange callback if set, or FIGGY_CHANGES_DEFAULT_CALLBACK]
	/// @returns {Struct.Figgy}
	/// @desc Value Widget: creates a Boolean value in the current scope (Root, Window, Section or Group), represented as a DBG Checkbox.
	/// The onChange callback function receives 3 arguments: (new value, old value, variable name).
	static Bool = function(_name, _default, _onChange = __onChange) {
		__FIGGY_WIDGET;
		dbg_checkbox(_ref, _name);
		
		return self;
	};
	
	/// @param {String} name The variable name.
	/// @param {String} default The default value.
	/// @param {Func} onChange The function to call when the value is changed. [Default: current onChange callback if set, or FIGGY_CHANGES_DEFAULT_CALLBACK]
	/// @returns {Struct.Figgy}
	/// @desc Value Widget: creates a String value in the current scope (Root, Window, Section or Group), represented as a DBG Text Input.
	/// The onChange callback function receives 3 arguments: (new value, old value, variable name).
	static Text = function(_name, _default, _onChange = __onChange) {
		__FIGGY_WIDGET;
		dbg_text_input(_ref, _name);
		
		return self;
	};
	
	/// @param {String} name The variable name.
	/// @param {Real,Constant.Color} default The default value.
	/// @param {Func} onChange The function to call when the value is changed. [Default: current onChange callback if set, or FIGGY_CHANGES_DEFAULT_CALLBACK]
	/// @returns {Struct.Figgy}
	/// @desc Value Widget: creates a color value in the current scope (Root, Window, Section or Group), represented as a DBG Color Picker.
	/// The onChange callback function receives 3 arguments: (new value, old value, variable name).
	static Color = function(_name, _default, _onChange = __onChange) {
		__FIGGY_WIDGET;
		dbg_colour(_ref, _name);
		
		return self;
	};
	
	/// @param {String} name The dropdown name.
	/// @param {Any} default The default value.
	/// @param {Array<Any>} values The array of option values.
	/// @param {Array<String>} names The array of option names. [Default: values)
	/// @param {Func} onChange The function to call when the value is changed. [Default: current onChange callback if set, or FIGGY_CHANGES_DEFAULT_CALLBACK]
	/// @returns {Struct.Figgy}
	/// @desc Value Widget: creates an <Any> value in the current scope (Root, Window, Section or Group), represented as a DBG Dropdown.
	/// The onChange callback function receives 3 arguments: (new value, old value, variable name).
	static Multi = function(_name, _default, _values, _names = _values, _onChange = __onChange) {
		__FIGGY_WIDGET;
		dbg_drop_down(_ref, _values, _names, _name);
		
		with ({}) {
			__scope = other.__scope;
			__name = _rawName;
			__values = _values;
			
			dbg_same_line();
			dbg_button("-", function() {
				var _n = array_length(__values);
				var _index = (array_get_index(__values, __scope[$ __name]) - 1 + _n) mod _n;
				__scope[$ __name] = __values[_index];
			}, 20, 20);
			dbg_same_line();
			dbg_button("+", function() {
				var _index = (array_get_index(__values, __scope[$ __name]) + 1) mod array_length(__values);
				__scope[$ __name] = __values[_index];
			}, 20, 20);
		}
		
		return self;
	};
	
	#endregion
	#region Setup: Decor Widgets
	
	/// @param {String} name The button name.
	/// @param {Func} callback The function to trigger on press.
	/// @param {Real} width The button width. [Default: auto dbg default]
	/// @param {Real} height The button height. [Default: auto dbg default]
	/// @param {Bool} sameLine? Whether the button should be on the same line with the last element (true) or not (false). [Default: false]
	/// @returns {Struct.Figgy}
	/// @desc Decor Widget: creates a button, represented by DBG Button.
	static Button = function(_name, _callback, _w = undefined, _h = undefined, _sameLine = false) {
		if (_sameLine) {
			dbg_same_line();
		}
		dbg_button(_name, _callback, _w, _h);
		
		return self;
	};
	
	/// @param {String} string The comment string.
	/// @param {Bool} sameLine? Whether the comment should be on the same line with the last element (true) or not (false). [Default: false]
	/// @returns {Struct.Figgy}
	/// @desc Decor Widget: creates a text comment, represented by DBG Text.
	static Comment = function(_string, _sameLine = false) {
		if (_sameLine) {
			dbg_same_line();
		}
		dbg_text(_string);
		
		return self;
	};
	
	/// @param {String} name The separator name. [Default: empty]
	/// @param {Enum.FIGGY_GROUP_ALIGN} align The separator name alignment. [Default: FIGGY_GROUP_DEFAULT_ALIGN]
	/// @returns {Struct.Figgy}
	/// @desc Decor Widget: creates a separator, represented by DBG Separator with an optional name.
	static Separator = function(_name = "", _align = FIGGY_SEPARATOR_DEFAULT_ALIGN) {
		dbg_text_separator(_name, _align);
		
		return self;
	};
	
	#endregion
	#region Setup: OnChange
	
	/// @param {Func} callback The function to trigger on value change.
	/// @returns {Struct.Figgy}
	/// @desc Sets the default onChange callback for all following Value Widgets.
	/// The callback function receives 3 arguments: (new value, old value, variable name).
	/// Call Figgy.OnChangeReset() to reset it.
	static OnChangeSet = function(_callback) {
		__onChange = _callback;
		
		return self;
	};
	
	/// @returns {Struct.Figgy}
	/// @desc Resets the default onChange callback back to FIGGY_CHANGES_DEFAULT_CALLBACK.
	static OnChangeReset = function() {
		__onChange = FIGGY_CHANGES_DEFAULT_CALLBACK;
		
		return self;
	};
	
	#endregion
	
	#region Getters
	
	/// @returns {Struct}
	/// @desc Returns the current config.
	static GetCurrent = function() {
		return __current;
	};
	
	/// @returns {Struct}
	/// @desc Returns the default config.
	static GetDefault = function() {
		return __current;
	};
	
	/// @returns {Struct}
	/// @desc Returns the last saved config.
	static GetLastSave = function() {
		return __lastSave;
	};
	
	#endregion
	#region Reset
	
	/// @returns {Struct.Figgy}
	/// @desc Resets the current config to the default.
	static ResetToDefault = function() {
		__FIGGY_BENCH_START;
		__Move(__default, __current);
		__changes.__Refresh();
		__FiggyLogTimed("RESET TO DEFAULT: completed");
		
		return self;
	};
	
	/// @returns {Struct.Figgy}
	/// @desc Resets the current config to the last save.
	static ResetToLastSave = function() {
		__FIGGY_BENCH_START;
		if (__lastSave == undefined) {
			__RefreshLastSave();
		}
		__Move(__lastSave, __current);
		__changes.__Refresh();
		__FiggyLogTimed("RESET TO LAST SAVE: completed");
		
		return self;
	};
	
	#endregion
	#region Input/Output
	
	/// @param {String} path The path to import the config file from. [Default: undefined, prompt popup]
	/// @returns {Struct.Figgy}
	/// @desc Imports an external config file from the given path.
	static Import = function(_path = undefined) {
		_path ??= get_open_filename_ext(__FIGGY_FILE_FILTER, __FIGGY_FILE_NAME, "", "Figgy: Import Config");
		if (_path == "") {
			__FiggyLog("IMPORT: canceled");
			return self;
		}
		
		__FIGGY_BENCH_START;
		__Load(_path, false);
		__FiggyLogTimed($"IMPORT: success at \"{_path}\"");
		
		return self;
	};
	
	/// @param {String} path The path to import the config file to. [Default: undefined, prompt popup]
	/// @returns {Struct.Figgy}
	/// @desc Exports the current configs into a file at the given path.
	static Export = function(_path = undefined) {
		_path ??= get_save_filename_ext(__FIGGY_FILE_FILTER, __FIGGY_FILE_NAME, "", "Figgy: Export Config");
		if (_path == "") {
			__FiggyLog("EXPORT: canceled");
			return self;
		}
		
		__FIGGY_BENCH_START;
		__SaveRaw(_path);
		__FiggyLogTimed($"EXPORT: success at \"{_path}\"");
		
		return self;
	};
	
	#endregion
}
