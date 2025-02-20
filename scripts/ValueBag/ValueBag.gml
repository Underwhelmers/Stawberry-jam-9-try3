function ValueBag(_values) constructor {
	realvalues = _values;
	remaining = ds_list_create();
	previous = 0;
	
	static get = function() {
		if (array_length(realvalues) == 1)
			return realvalues[0];
		
		if (ds_list_size(remaining) == 0) {
			for (var _idx = 0; _idx < array_length(realvalues); _idx++)
				ds_list_add(remaining, _idx);
		}
		
		var _pulled = ds_list_pull_random(remaining);
		if (_pulled == previous)
			_pulled = ds_list_pull_random(remaining);
		previous = _pulled;
		return realvalues[_pulled];
	}
	
	static from_raw_get = function(_number) {
		return array_choose_unique(realvalues,_number);
	}
}
