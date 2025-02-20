function WeightedIndexRandomizerBinary(_weights) {
	weights = array_clone(_weights);
	size = array_length(weights);
	total_weight = 0;
	for (var i = 0; i < size; i++) {
		total_weight += weights[i];
		weights[i] = total_weight;
	}
	
	static next = function() {
		var _res = random(total_weight);
		
		// Binary search for the weighted index
		var low = 0;
		var high = size - 1;
		
		while (low < high) {
			var mid = floor((low + high) / 2);
			if (_res < weights[mid]) {
				high = mid;
			} else {
				low = mid + 1;
			}
		}
		
		return low;
	}
}
