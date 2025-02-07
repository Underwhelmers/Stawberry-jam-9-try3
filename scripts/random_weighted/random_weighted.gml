function random_weighted(_weights, _total = 0) {
    var _count = array_length(_weights);
    
    // Calculate the total of all weights
	if (_total == 0) {
	    for (var _idx = 0; _idx < _count; _idx++) {
	        _total += _weights[_idx];
	    }
	}

    // Generate a random number between 0 and _tot
    var _rand = random(_total);

    // Determine which weight the random number falls into
    for (var _idx = 0; _idx < _count; _idx++) {
        _rand -= _weights[_idx];
        
		if (_rand <= 0) return _idx;
    }

    return -1; // Fallback in case of invalid weights
}

