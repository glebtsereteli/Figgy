
function Figgy() {
	#region __private
	
	static __current = undefined;
	static __default = undefined;
	static __lastSave = undefined;
	
	static __setup = {
		__scope: undefined,
		__section: undefined,
	};
	static __validation = {
		__used: false,
		
		__run: function(_default, _new) {
			__remove(_default, _new);
			__add(_default, _new);
			return __used;
		},
		__remove: function(_default, _new) {
			var _keys = struct_get_names(_new);
			var _i = 0; repeat (array_length(_keys)) {
				var _key = _keys[_i];
				var _defaultValue = _default[$ _key]
				var _newValue = _new[$ _key];
				
				if ((_defaultValue == undefined) or (typeof(_defaultValue) != typeof(_newValue))) {
					struct_remove(_new, _key);
					__figgyLog($"VALIDATION: removed unused variable \"{_key}\"");
					__used = true;
				}
				else if (is_struct(_newValue)) {
					__remove(_defaultValue, _newValue);
				}
				
				_i++;
			}
		},
		__add: function(_default, _new) {
			var _keys = struct_get_names(_default);
			var _i = 0; repeat (array_length(_keys)) {
				var _key = _keys[_i];
				var _defaultValue = _default[$ _key];
				var _newValue = _new[$ _key];
				
				if (_newValue == undefined) {
					__figgyLog($"VALIDATION: added missing variable \"{_key}\"");
					__used = true;
					if (is_struct(_defaultValue)) {
						_new[$ _key] = {};
						__add(_defaultValue, _new[$ _key]);
					}
					else {
						_new[$ _key] = _defaultValue;
					}
				}
				else if (is_struct(_defaultValue)) {
					__add(_defaultValue, _newValue);
				}
				
				_i++;
			}
		},
	};
	static __debugString = {
		__value: (FIGGY_DEBUG_STRING ? "" : undefined),
		__sectioned: false,
		__grouped: false,
	};
	static __t = undefined;
	
	static __init = function(_callback) {
		static _controls = function() {
			dbg_section(FIGGY_CONTROLS_NAME, FIGGY_CONTROLS_OPEN);
			dbg_button("Save", function() {
				save();
			}, 60, 20);
			dbg_same_line();
			dbg_button("Reset To Default", function() {
				resetToDefault();
			}, 150, 20);
			dbg_same_line();
			dbg_button("Reset To Last Save", function() {
				resetToLastSave();
			}, 150, 20);
		};
		
		__current = {};
		__setup.__scope = __current;
		__setup.__section = __current;
		
		__FIGGY_BENCH_START;
		dbg_view(FIGGY_WINDOW_NAME, FIGGY_WINDOW_START_VISIBLE, FIGGY_WINDOW_X, FIGGY_WINDOW_Y, FIGGY_WINDOW_WIDTH, FIGGY_WINDOW_HEIGHT);
		_controls();
		_callback();
		__default = variable_clone(__current);
		__figgyLogTimed("SETUP: completed");
		
		__load();
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
	static __load = function() {
		try {
			__FIGGY_BENCH_START;
			
			var _buffer = buffer_load(__FIGGY_PATH);
			var _string = buffer_read(_buffer, buffer_text);
			buffer_delete(_buffer);
			var _data = json_parse(_string);
			
			if (__validation.__run(__default, _data)) {
				save(false);
				__figgyLog($"VALIDATION: used. File re-saved");
			}
			
			__move(_data, __current);
			
			__figgyLogTimed($"LOAD: success at \"{__FIGGY_PATH}\"");
		} 
		catch (_) {
			save(false);
			__figgyLog($"LOAD: fail at \"{__FIGGY_PATH}\". Initialized to Default");
		}
	};
	static __refreshLastSave = function() {
		__lastSave = variable_clone(__current);
	};
	
	#endregion
	
	#region widgets: scope
	
	/// @param {String} name The section name.
	/// @param {Bool} open=[FIGGY_SECTION_DEFAULT_OPEN] Whether the section starts open (true) or not (false).
	static section = function(_name, _open = FIGGY_SECTION_DEFAULT_OPEN) {
		__FIGGY_RAWNAME
		dbg_section(_name, _open);
		__setup.__section = {};
		__setup.__scope[$ _name] = __setup.__section;
		__setup.__scope = __setup.__section;
		
		if (FIGGY_DEBUG_STRING) {
			__debugString.__value += $"- {_name}:\n";
			__debugString.__sectioned = true;
		}
		
		return self;
	};
	
	/// @param {String} name The group name.
	/// @param {Enum.FIGGY_GROUP_ALIGN} align=[FIGGY_GROUP_DEFAULT_ALIGN] The group name alignment.
	static group = function(_name, _align = FIGGY_GROUP_DEFAULT_ALIGN) {
		__FIGGY_RAWNAME;
		dbg_text_separator(_name, _align);
		__setup.__scope = {};
		__setup.__section[$ _name] = __setup.__scope;
		
		if (FIGGY_DEBUG_STRING) {
			__debugString.__value += $"{string_repeat(" ", __debugString.__sectioned * 4)}- {_name}:\n";
			__debugString.__grouped = true;
		}
		
		return self;
	};
	
	/// @param {Bool} separate=[false] Whether to add a separator after the current (if any) group (true) or not (false).
	static ungroup = function(_separate = FIGGY_UNGROUP_DEFAULT_SEPARATE) {
		if (_separate) {
			dbg_text_separator("");
		}
		__setup.__scope = __setup.__section;
		
		if (FIGGY_DEBUG_STRING) {
			__debugString.__grouped = false;
		}
		
		return self;
	};
	
	#endregion
	#region widgets: non-scope
	
	/// @param {String} name The variable name.
	/// @param {Real.Int} default The default value.
	/// @param {Real.Int} min The minimum value.
	/// @param {Real.Int} min The maximum value.
	/// @param {Real.Int} step=[FIGGY_INT_DEFAULT_STEP] Step value.
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
	static float = function(_name, _default, _from, _to, _step = FIGGY_FLOAT_DEFAULT_STEP) {
		__FIGGY_WIDGET;
		dbg_slider(_ref, _from, _to, _name, _step);
		
		return self;
	};
	
	/// @param {String} name The variable name.
	/// @param {Bool} default The default value.
	static boolean = function(_name, _default) {
		__FIGGY_WIDGET;
		dbg_checkbox(_ref, _name);
		
		return self;
	};
	
	/// @param {String} name The variable name.
	/// @param {String} default The default value.
	static text = function(_name, _default) {
		__FIGGY_WIDGET;
		dbg_text_input(_ref, _name);
		
		return self;
	};
	
	/// @param {String} name The dropdown name.
	/// @param {Any} default The default value.
	/// @param {Array<Any>} values The array of option values.
	/// @param {Array<String>} names=[values] The array of option names.
	static multi = function(_name, _default, _values, _names = _values) {
		__FIGGY_WIDGET;
		dbg_drop_down(_ref, _values, _names, _name);
		
		return self;
	};
	
	#endregion
	#region widgets: decor
	
	/// @param {String} name The button name.
	/// @param {Func} callback The callback to trigger on press.
	/// @param {Real} width=[auto dbg default] The button width.
	/// @param {Real} height=[auto dbg default] The button height.
	static button = function(_name, _callback, _w = undefined, _h = undefined) {
		dbg_button(_name, _callback, _w, _h);
		
		return self;
	};
	
	/// @param {String} string The comment string.
	static comment = function(_string) {
		dbg_text(" " + _string);
		
		return self;
	};
	
	static separator = function() {
		dbg_text_separator("");
		
		return self;
	};
	
	#endregion
	#region actions
	
	/// @param {Bool} log=[true] When FIGGY_DEBUG is true, whether to print a debug message in Output (true) or not (false).
	static save = function(_log = true) {
		if (_log) {
			__FIGGY_BENCH_START;
		}
		
		var _string = json_stringify(__current, true);
		var _buffer = buffer_create(string_byte_length(_string), buffer_fixed, 1);
		buffer_write(_buffer, buffer_text, _string);
		buffer_save(_buffer, __FIGGY_PATH);
		buffer_delete(_buffer);
		
		__refreshLastSave();
		
		if (_log) {
			__figgyLogTimed($"SAVE: success at \"{__FIGGY_PATH}\"");
		}
		
		return self;
	};
	
	static resetToDefault = function() {
		__FIGGY_BENCH_START;
		__move(__default, __current);
		__figgyLogTimed("RESET TO DEFAULT: completed");
	};
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
	
	static getCurrent = function() {
		return __current;
	};
	static getDebugString = function() {
		return __debugString.__value;
	};
	
	#endregion
}
