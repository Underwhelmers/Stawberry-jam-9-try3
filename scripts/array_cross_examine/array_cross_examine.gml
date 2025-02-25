function array_cross_examine(_array1,_array2, _transfer_data, _apply_function) {
	for (var i = 0; i < array_length(_array1); i++) {
        var item1 = _array1[i];
		for (var j = 0; j < array_length(_array2); j++) {
			var item2 = _array2[j];
			_apply_function(item1, item2, _transfer_data);
		}
	}
}

function array_cross_examine_self(_array, _transfer_data, _apply_function) {
	for (var i = 0; i < array_length(_array); i++) {
        var item1 = _array[i];
		for (var j = i + 1; j < array_length(_array); j++) {
			var item2 = _array[j];
			_apply_function(item1,item2,_transfer_data);
		}
	}
}