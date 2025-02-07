function ArrayLooper(_array) constructor {
	values = _array;
	index = new IndexLooper(array_length(_array),-1);
	
	static next = function() {
		return values[index.next()];
	}
}