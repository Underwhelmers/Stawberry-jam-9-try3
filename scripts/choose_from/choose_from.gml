function choose_from(_array) {
	if (array_length(_array) == 0)
		return noone;
	return _array[irandom(array_length(_array)-1)];
}