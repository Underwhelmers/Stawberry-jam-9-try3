function WeightedIndexRandomizerLinear(_weights) {
	weights = array_clone(_weights);
	size = array_length(weights);
	total_weight = 0;
	for (var i = 0; i < size; i++) {
		total_weight += weights[i];
	}
	
	static next = function() {
		var _res = random(total_weight);
		
		for (var i = 0; i < size-1; i++) {
			_res -= weights[i];
			if (_res <= 0) {
				return i;
			}
		}
		
		return size-1;
	}
}
