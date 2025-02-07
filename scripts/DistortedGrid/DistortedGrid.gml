function TransformedGrid(_vector_left, _vector_up, _xoffset = 0, _yoffset = 0) constructor {
	unitary_up = _vector_up;
	unitary_left = _vector_left;
	xoffset = _xoffset;
	yoffset = _yoffset;
	
	determinant = unitary_left.x * unitary_up.y - unitary_left.y * unitary_up.x;
    if (determinant == 0) {
        throw ("Transform grid basis vectors are degenerate.");
    }
	
	static transform_point = function(_point) {
		return new Point2d(
			xoffset + unitary_up.x * _point.y +  unitary_left.x * _point.x,
			yoffset + unitary_up.y * _point.y +  unitary_left.y * _point.x
		);
	}
	static transform_pos = function(_x, _y, _output = new Point2d()) {
		_output.Set(
			xoffset + unitary_up.x * _y +  unitary_left.x * _x,
			yoffset + unitary_up.y * _y +  unitary_left.y * _x
		);
		return _output;
	}
	static invert_point = function(_point, _output = new Point2d()) {
		_point.x -= xoffset;
		_point.y -= yoffset;
		_output.Set(
			(_point.x *   unitary_up.y - _point.y *   unitary_up.x) / determinant,
			(_point.y * unitary_left.x - _point.x * unitary_left.y) / determinant
		);
		return _output;
	}
	static invert_pos = function(_x, _y, _output = new Point2d()) {
		_x -= xoffset;
		_y -= yoffset;
		_output.Set(
			(_x *   unitary_up.y - _y *   unitary_up.x) / determinant,
			(_y * unitary_left.x - _x * unitary_left.y) / determinant
		);
		return _output;
	}
}