/// @function array_remove(_array, _value)
/// @description Returns a new array with all elements equal to _value removed.
/// @param _array The source array.
/// @param _value The value to remove from the array.
function array_remove(_array, _value) {
	if (array_length(_array) == 0) return;
	
	var _splitpoint = array_get_index(_array, _value);
	if (_splitpoint < 0) return;
	
	if (_splitpoint == 0) 
		return array_subgroup(_array, 1);
		
	if (_splitpoint == array_length(_array)-1) 
		return array_subgroup(_array, 0, array_length(_array)-1);
	
	return array_concat(
		array_subgroup(_array, 0, _splitpoint-1),
		array_subgroup(_array, _splitpoint+1)
	);
}