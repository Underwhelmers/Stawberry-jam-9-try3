function equidistant_points_in_line(_width, _points_amount){
	var _sep = _width / (_points_amount+1);
	var _result = array_create(_points_amount);
	for (var _idx = 0; _idx < _points_amount; _idx++)
		_result = (_idx+1) * _sep;
	
	return {
		points: _result,
		separation: _sep,
	};
}
