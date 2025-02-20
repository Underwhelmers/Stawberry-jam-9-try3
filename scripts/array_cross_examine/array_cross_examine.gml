function array_cross_examine(_array, _transfer_data, _apply_function) {
	for (var i = 0; i < array_length(_array); i++) {
        var item1 = _array[i];
		for (var j = i + 1; j < array_length(_array); j++) {
			var item2 = _array[j];
			_apply_function(item1,item2,_transfer_data);
		}
	}
}
