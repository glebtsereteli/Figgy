
DrawConfig = function(_struct, _x, _y, _indent = 0) {
	var _lineHeight = 18;
	var _indentWidth = 20;
	
	var _names = struct_get_names(_struct);
	array_sort(_names, true);
	
	var _i = 0; repeat (array_length(_names)) {
		var _name = _names[_i];
		var _value = _struct[$ _name];
		var _xx = _x + (_indent * _indentWidth);
		
		if (is_struct(_value)) {
			draw_text(_xx, _y, $"{_name}:");
			_y += _lineHeight;
			_y = DrawConfig(_value, _x, _y, _indent + 1);
		}
		else {
			draw_text(_xx, _y, $"{_name}: {_value}");
			_y += _lineHeight;
		}
		_i++;
	}
	
	return _y;
}
