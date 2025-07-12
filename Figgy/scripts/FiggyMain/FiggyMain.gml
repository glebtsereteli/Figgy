
function Figgy() {
	#region private
	
	static __current = undefined;
	static __default = undefined;
	static __view = false;
	
	static __setupCurrentScope = undefined;
	static __setupCurrentSection = undefined;
	static __setupCallback = undefined;
	
	static __setup = function(_callback) {
		__on_setup = _callback;
		
		__default = {};
		__setupCurrentScope = __default;
		
		__view = dbg_view(FIGGY_WINDOW_NAME, FIGGY_WINDOW_START_VISIBLE, FIGGY_WINDOW_X, FIGGY_WINDOW_Y, FIGGY_WINDOW_WIDTH, FIGGY_WINDOW_HEIGHT);
		
		__on_setup();
		resetToDefault();
		
		show_message(__current)
	};
	static resetToDefault = function() {
		__current = variable_clone(__default);
	};
	
	#endregion
	#region setup
	
	static section = function(_name, _open = true) {
		dbg_section(_name, _open);
		__setupCurrentSection = {};
		__setupCurrentScope[$ _name] = __setupCurrentSection;
		__setupCurrentScope = __setupCurrentSection;
		
		return self;
	};
	
	/// @param {String} name The group name.
	/// @param {Enum.FIGGY_GROUP_ALIGN} align=[FIGGY_GROUP_DEFAULT_ALIGN] The group name alignment.
	static group = function(_name, _align = 1) {
		dbg_text_separator(_name, _align);
		var _scope = {};
		__setupCurrentSection[$ _name] = _scope;
		__setupCurrentScope = _scope;
		
		return self;
	};
	static ungroup = function(_separate = true) {
		if (_separate) {
			dbg_text_separator("");
		}
		__setupCurrentScope = __setupCurrentSection;
		
		return self;
	};
	static int = function(_name, _default, _from, _to, _step = FIGFY_SLIDER_INT_STEP) {
		__FIGGY_NAME
		__setupCurrentScope[$ _rawName] = _default;
		dbg_slider_int(ref_create(__setupCurrentScope, _rawName), _from, _to, _name, _step);
		
		return self;
	};
	static float = function(_name, _default, _from, _to, _step = FIGFY_SLIDER_FLOAT_STEP) {
		__FIGGY_NAME
		__setupCurrentScope[$ _rawName] = _default;
		dbg_slider(ref_create(__setupCurrentScope, _rawName), _from, _to, _name, _step);
		
		return self;
	};
	static boolean = function(_name, _default) {
		__FIGGY_NAME;
		__setupCurrentScope[$ _rawName] = _default;
		dbg_checkbox(ref_create(__setupCurrentScope, _rawName), _name);
		
		return self;
	};
	
	#endregion
}
Figgy();
