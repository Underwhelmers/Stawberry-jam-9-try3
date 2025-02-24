function ds_list_choose(_array){
	return _array[| irandom(ds_list_size(_array)-1)];
}