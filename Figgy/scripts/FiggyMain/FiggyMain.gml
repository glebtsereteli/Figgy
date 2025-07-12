
function Figgy() {
	#region __private
	
	static __default = undefined;
	static __current = undefined;
	static __view = false;
	static __sections = [];
	
	static __setupCurrentScope = undefined;
	static __setupCurrentSection = undefined;
	static __setupCallback = undefined;
	
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
			__current = json_parse(_string);
			buffer_delete(_buffer);
		} catch (_) {
			
		}
		__save();
	};
	
	#endregion
	#region setup
	
	/// @param {Func} callback The callback to execute on setup. Set up your interface here.
	static setup = function(_callback) {
		__on_setup = _callback;
		
		__default = {};
		__setupCurrentScope = __default;
		__setupCurrentSection = __default;
		
		__view = dbg_view(FIGGY_WINDOW_NAME, FIGGY_WINDOW_START_VISIBLE, FIGGY_WINDOW_X, FIGGY_WINDOW_Y, FIGGY_WINDOW_WIDTH, FIGGY_WINDOW_HEIGHT);
		
		dbg_section("[CONTROLS]", false);
		dbg_button("Save", function() {
			__save();
		}, 80, 20);
		
		__on_setup();
		__current = variable_clone(__default);
		
		show_message(__current);
		
		__load();
	};
	
	/// @param {String} name Section name.
	/// @param {Bool} open=[FIGGY_SECTION_DEFAULT_OPEN] Whether the section starts open (true) or not (false).
	static section = function(_name, _open = FIGGY_SECTION_DEFAULT_OPEN) {
		__FIGGY_RAWNAME
		array_push(__sections, dbg_section(_name, _open));
		__setupCurrentSection = {};
		__setupCurrentScope[$ _name] = __setupCurrentSection;
		__setupCurrentScope = __setupCurrentSection;
		
		return self;
	};
	
	/// @param {String} name The group name.
	/// @param {Bool} selfScope=[FIGGY_GROUP_DEFAULT_SELFSCOPE] Whether the group should have its own scope (true) or not (false).
	/// @param {Enum.FIGGY_GROUP_ALIGN} align=[FIGGY_GROUP_DEFAULT_ALIGN] The group name alignment.
	static group = function(_name, _selfScope = FIGGY_GROUP_DEFAULT_SELFSCOPE, _align = FIGGY_GROUP_DEFAULT_ALIGN) {
		__FIGGY_RAWNAME
		dbg_text_separator(_name, _align);
		if (_selfScope) {
			__setupCurrentScope = {};
			__setupCurrentSection[$ _name] = __setupCurrentScope;
		}
		else {
			__setupCurrentScope = __setupCurrentSection;
		}
		
		return self;
	};
	
	/// @param {Bool} separate=[false] Whether to add a separator after the current (if any) group (true) or not (false).
	static ungroup = function(_separate = FIGGY_UNGROUP_DEFAULT_SEPARATE) {
		if (_separate) {
			dbg_text_separator("");
		}
		__setupCurrentScope = __setupCurrentSection;
		
		return self;
	};
	
	/// @param {String} name Variable name.
	/// @param {Real.Int} default Default value.
	/// @param {Real.Int} min Minimum value.
	/// @param {Real.Int} min Maximum value.
	/// @param {Real.Int} step=[FIGGY_INT_DEFAULT_STEP] Step value.
	static int = function(_name, _default, _min, _max, _step = FIGGY_INT_DEFAULT_STEP) {
		__FIGGY_RAWNAME
		__setupCurrentScope[$ _rawName] = _default;
		dbg_slider_int(ref_create(__setupCurrentScope, _rawName), _min, _max, _name, _step);
		
		return self;
	};
	
	/// @param {String} name Variable name.
	/// @param {Real} default Default value.
	/// @param {Real} min Minimum value.
	/// @param {Real} min Maximum value.
	/// @param {Real} step=[FIGGY_FLOAT_DEFAULT_STEP] Step value.
	static float = function(_name, _default, _from, _to, _step = FIGGY_FLOAT_DEFAULT_STEP) {
		__FIGGY_RAWNAME
		__setupCurrentScope[$ _rawName] = _default;
		dbg_slider(ref_create(__setupCurrentScope, _rawName), _from, _to, _name, _step);
		
		return self;
	};
	
	/// @param {String} name Variable name.
	/// @param {Bool} default Default value.
	static boolean = function(_name, _default) {
		__FIGGY_RAWNAME;
		__setupCurrentScope[$ _rawName] = _default;
		dbg_checkbox(ref_create(__setupCurrentScope, _rawName), _name);
		
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
