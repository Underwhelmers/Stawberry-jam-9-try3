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

function array_cross_examine_ext(_array_of_arrays, _transfer_data, _apply_function) {
    // Check if there are arrays to process
    if (array_length(_array_of_arrays) == 0) {
        return;
    }

    // Initialize indices array to track positions in each sub-array
    var array_count = array_length(_array_of_arrays);
    var indices = array_create(array_count, 0);
    var lengths = array_create(array_count, 0);
    for (var i = 0; i < array_count; i++) {
        lengths[i] = array_length(_array_of_arrays[i]);
		
		if (lengths[i] == 0)
			return; // If one is emtpy there is nothing to cross.
    }

    // Generate all combinations using a counter-like approach
	var composite = [];
    while (true) {
        // Build the composite array for the current combination
        for (var i = 0; i < array_count; i++) {
            composite[i] = _array_of_arrays[i][indices[i]];
        }
        // Apply the function to the composite
        _apply_function(composite, _transfer_data);

        // Increment indices to get the next combination
        var carry = 1;
        for (var i = array_count - 1; i >= 0; i--) {
            if (carry == 0) break;
            indices[i] += carry;
            if (indices[i] >= lengths[i]) {
                indices[i] = 0;
                carry = 1;
            } else {
                carry = 0;
            }
        }
        // If carry is still 1 after all indices, we've exhausted combinations
        if (carry == 1) break;
    }
}