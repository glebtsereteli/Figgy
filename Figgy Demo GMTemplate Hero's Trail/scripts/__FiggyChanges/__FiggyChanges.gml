
function __FiggyChanges() constructor {
	__pool = [];
	__callback = FIGGY_CHANGES_DEFAULT_CALLBACK;
	
	static __Init = function() {
		if (not FIGGY_CHANGES_ENABLED) return;
		if (array_length(__pool) == 0) return;
		
		__Refresh();
		call_later(1, time_source_units_frames, function() {
			array_foreach(__pool, function(_change) {
				_change.__Update();
			});
		}, true);
	};
	static __Add = function(_scope, _name, _callback) {
		var _change = new __FiggyChange(_scope, _name, _callback);
		array_push(__pool, _change);
	};
	static __Refresh = function() {
		if (not FIGGY_CHANGES_ENABLED) return;
		
		array_foreach(__pool, function(_change) {
			_change.__Refresh();
		});
	};
}
function __FiggyChange(_scope, _name, _callback) constructor {
	__scope = _scope;
	__name = _name;
	__callback = _callback;
	__value = __Get();
	
	static __Update = function() {
		var _new = __Get();
		if (_new == __value) return;
		
		__callback(_new, __value, __name);
		__value = _new;
	};
	static __Refresh = function() {
		__value = __Get();
	};
	
	static __Get = function() {
		return __scope[$ __name];
	};
}
