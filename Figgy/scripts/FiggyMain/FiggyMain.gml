
function Figgy() {
	#region __private
	
	static __default = undefined;
	static __current = undefined;
	static __view = false;
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
					__figgyLog($"Validation: removed unused variable \"{_key}\"");
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
					__figgyLog($"Validation: added missing variable \"{_key}\"");
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
	
	static __clone = function(_a, _b) {
		var _keys = struct_get_names(_a);
		var _i = 0; repeat (array_length(_keys)) {
			var _key = _keys[_i];
			var _value = _a[$ _key];
			if (is_struct(_value)) {
				__clone(_value, {});
			}
			else {
				_b[$ _key] = _value;
			}
			_i++;
		}
	};
	
	static __save = function() {
		var _string = json_stringify(__current, true);
		var _buffer = buffer_create(string_byte_length(_string), buffer_fixed, 1);
		buffer_write(_buffer, buffer_text, _string);
		buffer_save(_buffer, __FIGGY_PATH);
		buffer_delete(_buffer);
		
		return self;
	};
	static __load = function() {
		try {
			var _buffer = buffer_load(__FIGGY_PATH);
			var _string = buffer_read(_buffer, buffer_text);
			buffer_delete(_buffer);
			var _data = json_parse(_string);
			
			__figgyLog($"Load: success at \"{__FIGGY_PATH}\"");
			
			if (__validation.__run(__default, _data)) {
				__save();
				__figgyLog($"Validation: used. File re-saved: \"{__FIGGY_PATH}\"");
			}
		} 
		catch (_) {
			__save();
			__figgyLog($"Load: fail at \"{__FIGGY_PATH}\". Initialized to Default");
		}
	};
	
	#endregion
	#region setup
	
	/// @param {Func} callback The callback to execute on setup. Set up your interface here.
	static setup = function(_callback) {
		__current = {};
		__setup.__scope = __current;
		__setup.__section = __current;
		
		__view = dbg_view(FIGGY_WINDOW_NAME, FIGGY_WINDOW_START_VISIBLE, FIGGY_WINDOW_X, FIGGY_WINDOW_Y, FIGGY_WINDOW_WIDTH, FIGGY_WINDOW_HEIGHT);
		
		dbg_section("[CONTROLS]");
		dbg_button("Save", function() {
			__save();
		}, 80, 20);
		
		_callback();
		
		__default = variable_clone(__current);
		
		__load();
	};
	
	/// @param {String} name Section name.
	/// @param {Bool} open=[FIGGY_SECTION_DEFAULT_OPEN] Whether the section starts open (true) or not (false).
	static section = function(_name, _open = FIGGY_SECTION_DEFAULT_OPEN) {
		__FIGGY_RAWNAME
		dbg_section(_name, _open);
		__setup.__section = {};
		__setup.__scope[$ _name] = __setup.__section;
		__setup.__scope = __setup.__section;
		
		return self;
	};
	
	/// @param {String} name The group name.
	/// @param {Bool} selfScope=[FIGGY_GROUP_DEFAULT_SELFSCOPE] Whether the group should have its own scope (true) or not (false).
	/// @param {Enum.FIGGY_GROUP_ALIGN} align=[FIGGY_GROUP_DEFAULT_ALIGN] The group name alignment.
	static group = function(_name, _selfScope = FIGGY_GROUP_DEFAULT_SELFSCOPE, _align = FIGGY_GROUP_DEFAULT_ALIGN) {
		__FIGGY_RAWNAME
		dbg_text_separator(_name, _align);
		if (_selfScope) {
			__setup.__scope = {};
			__setup.__section[$ _name] = __setup.__scope;
		}
		else {
			__setup.__scope = __setup.__section;
		}
		
		return self;
	};
	
	/// @param {Bool} separate=[false] Whether to add a separator after the current (if any) group (true) or not (false).
	static ungroup = function(_separate = FIGGY_UNGROUP_DEFAULT_SEPARATE) {
		if (_separate) {
			dbg_text_separator("");
		}
		__setup.__scope = __setup.__section;
		
		return self;
	};
	
	/// @param {String} name Variable name.
	/// @param {Real.Int} default Default value.
	/// @param {Real.Int} min Minimum value.
	/// @param {Real.Int} min Maximum value.
	/// @param {Real.Int} step=[FIGGY_INT_DEFAULT_STEP] Step value.
	static int = function(_name, _default, _min, _max, _step = FIGGY_INT_DEFAULT_STEP) {
		__FIGGY_RAWNAME
		__setup.__scope[$ _rawName] = _default;
		
		dbg_slider_int(ref_create(__setup.__scope, _rawName), _min, _max, _name, _step);
		
		return self;
	};
	
	/// @param {String} name Variable name.
	/// @param {Real} default Default value.
	/// @param {Real} min Minimum value.
	/// @param {Real} min Maximum value.
	/// @param {Real} step=[FIGGY_FLOAT_DEFAULT_STEP] Step value.
	static float = function(_name, _default, _from, _to, _step = FIGGY_FLOAT_DEFAULT_STEP) {
		__FIGGY_RAWNAME
		__setup.__scope[$ _rawName] = _default;
		dbg_slider(ref_create(__setup.__scope, _rawName), _from, _to, _name, _step);
		
		return self;
	};
	
	/// @param {String} name Variable name.
	/// @param {Bool} default Default value.
	static boolean = function(_name, _default) {
		__FIGGY_RAWNAME;
		__setup.__scope[$ _rawName] = _default;
		dbg_checkbox(ref_create(__setup.__scope, _rawName), _name);
		
		return self;
	};
	
	#endregion
	#region actions
	
	static resetToDefault = function() {
		
	};
	
	#endregion
	#region getters
	
	static getCurrent = function() {
		return __current;
	};
	
	#endregion
}
Figgy();
