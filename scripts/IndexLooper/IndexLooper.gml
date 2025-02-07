function IndexLooper(_size, _initial = 0) constructor {
	size = _size;
	current = _initial;
	
	next = function() {
		current ++;
		if (current >= size)
			current -= size;
		return current;
	}
}