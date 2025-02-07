function SpriteTransform(_img, _col, _rot, _xoff, _yoff, _xscale = 1) constructor {
	ang = _rot;
	image = _img;
	xoff = _xoff;
	yoff = _yoff;
	color = _col;
	xscale = _xscale;
	img_index = -1;
}

function draw_transform_concated(_x,_y,_scale) {
	var _xrot = _x;
	var _yrot = _y;
	var _totrot = 90;
	var _transform = argument[3];
	
	for (var _dtc_idx = 3; _dtc_idx < argument_count; _dtc_idx++) {
		_transform = argument[_dtc_idx];
		_xrot += (-_transform.yoff*dcos(_totrot) + _transform.xoff*dsin(_totrot)) * _scale;
		_yrot += (+_transform.xoff*dcos(_totrot) + _transform.yoff*dsin(_totrot)) * _scale;
		_totrot += _transform.ang;
	}
	
	draw_sprite_ext(_transform.image, _transform.img_index, _xrot, _yrot, _scale*_transform.xscale, _scale, _totrot-90, _transform.color, 1);
}