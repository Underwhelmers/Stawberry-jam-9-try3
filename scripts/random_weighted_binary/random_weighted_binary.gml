function random_weighted_binary(_weights) {
    var size = array_length(_weights);

    if (size == 0) {
        return -1;  // Return -1 if no weights are provided
    }

    // Calculate cumulative weights (total weight for each index)
    var total_weight = 0;
    var weights = array_create(size);
	
    for (var i = 0; i < size; i++) {
        total_weight += _weights[i];
        weights[i] = total_weight;
    }

    // Generate a random number between 0 and total_weight
    var _res = random(total_weight);

    // Perform binary search to find the appropriate index
    var low = 0;
    var high = size - 1;

    while (low < high) {
        var mid = floor((low + high) / 2);
        if (_res < weights[mid]) {
            high = mid;  // Search the left side
        } else {
            low = mid + 1;  // Search the right side
        }
    }

    return low;
}
