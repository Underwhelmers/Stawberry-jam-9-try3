function List() constructor {
	values = ds_list_create();
	size = 0;
	
	static add = function() {
		for (var _i = 0; _i < argument_count; _i++)
			ds_list_add(values, argument[_i]);
		size = ds_list_size(values);
	}
	static remove = function() {
		for (var _i = 0; _i < argument_count; _i++)
			ds_list_remove(values, argument[_i]);
		size = ds_list_size(values);
	}
	static shuffle = function() {
		ds_list_shuffle(values);
	}
	
	static clear = function() {
		ds_list_clear(values);
	}
	static copy = function(_other) {
		ds_list_copy(_other.values, values);
	}
	static is_empty = function() {
		return size == 0;
	}
	static contains = function(_value) {
		return ds_list_find_index(values, _value) > 0;
	}
	static map = function(_mapper) {
		var _result = new List();
		
		for (var _i = 0, _count = size; _i < _count; _i++)
			_result.add(_mapper(get(_i),_i));
		
		return _result;
	}
	static get_array_values = function() {
		var _result = array_create(size);
		
		for (var _i = 0, _count = size; _i < _count; _i++)
			_result[_i] = values[|_i];
			
		return _result;
	}
	
	static get = function(_key) {
		if (_key >= 0 && _key < size)
            return ds_list_find_value(values, _key);
        return undefined;
	}
	static set = function(_key, _value) {
		values[|_key] = _value;
	}
	static clean = function() {
		ds_list_destroy(values);
	}
}