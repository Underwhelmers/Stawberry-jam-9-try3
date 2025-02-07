function points_in_circle(_amount, _ang_offset) {
	var _result = {
		values: array_create(_amount)
	};
	
	var _delta = 360/(_amount);
	
	for (var _i = 0; _i < _amount; _i++) {
		_result.values[_i] = new Point(
			dcos(_ang_offset+_delta*_i),
			-dsin(_ang_offset+_delta*_i)
		);
	}
	
	return _result;
}