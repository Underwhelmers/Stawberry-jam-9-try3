function array_attach(_array, _extention) {
	array_copy(_array,array_length(_array), _extention,0,array_length(_extention));
}