function ExpandingMap(_factory) constructor {
	data = ds_map_create();
	_new_instance = _factory;
	
	static get = function(_x, _y) {
		var _key = _generate_key(_x,_y);
		if (!ds_map_exists(data,_key)) {
			data[?_key] = _new_instance(_x,_y);
		}
		return data[?_key];
	};
	static set = function(_x, _y, _value) {
		data[? _generate_key(_x,_y)] = _value;
		return self;
	};
	static has_value = function(_x, _y) {
		return ds_map_exists(data,_generate_key(_x,_y));
	};
	static _generate_key = function(_x, _y) {
		return string("{0};{1}", round(_x), round(_y));
	}
	
	static get_all = function() {
		return ds_map_values_to_array(data);
	};
	
	static clear = function() {
		ds_map_clear(data);
	}
	
	static for_adyacent = function(_x,_y, _adyacency_type, _action) {
		var _directions;
		switch(_adyacency_type) {
			case AdyacencyMode.LATERALS:
				_directions = [
					[ 0, -1],[-1,  0],[ 1,  0],[ 0,  1]
				];
				break;
			case AdyacencyMode.LATERALS_AND_DIAGONALS:
				_directions = [
					[ 0, -1],[-1,  0],[ 1,  0],[ 0,  1],
					[-1, -1],[ 1, -1],[-1,  1],[ 1,  1]
				];
				break;
			default:
				_directions = [];
				break;
		}
		
		for (var i = 0; i < array_length(_directions); i++) {
            var _dx = _directions[i][0];
            var _dy = _directions[i][1];
            var _nx = _x + _dx;
            var _ny = _y + _dy;
            _action(_nx, _ny, get(_nx, _ny));
        }
	}
}
