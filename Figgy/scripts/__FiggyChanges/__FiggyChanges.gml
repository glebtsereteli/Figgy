
function __FiggyChanges() constructor {
	__pool = [];
	
	static __init = function() {
		if (not FIGGY_CHANGES_ENABLED) return;
		if (array_length(__pool) == 0) return;
		
		call_later(1, time_source_units_frames, function() {
			array_foreach(__pool, function(_change) {
				_change.__update();
			});
		}, true);
	};
	static __add = function(_scope, _name, _callback) {
		var _change = new __FiggyChange(_scope, _name, _callback);
		array_push(__pool, _change);
	};
	static __refresh = function() {
		if (not FIGGY_CHANGES_ENABLED) return;
		
		array_foreach(__pool, function(_change) {
			_change.__refresh();
		});
	};
}
function __FiggyChange(_scope, _name, _callback) constructor {
	__scope = _scope;
	__name = _name;
	__callback = _callback;
	__value = __get();
	
	static __update = function() {
		var _new = __get();
		if (_new == __value) return;
		
		__callback(_new, __value, __name);
		__value = _new;
	};
	static __refresh = function() {
		__value = __get();
	};
	
	static __get = function() {
		return __scope[$ __name];
	};
}
