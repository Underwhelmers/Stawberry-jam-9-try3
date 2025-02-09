function array_clone(_original) {
	var _size = array_length(_original);
	var _result = array_create(_size);
	array_copy(_result,0,_original,0,_size);
	return _result;
}