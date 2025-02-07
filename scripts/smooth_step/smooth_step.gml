function smooth_step(_from, _to, _amnt) {
	var _lambda = min(1,max(0,_amnt - _from/(_to-_from)));
	var _smooth = 3*_lambda*_lambda*_lambda - 2*_lambda*_lambda;
	
	return _smooth;
}