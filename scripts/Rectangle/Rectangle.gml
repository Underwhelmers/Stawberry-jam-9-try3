function Rectangle(_x1 = 0,_y1 = 0, _x2 = 0, _y2 = 0) constructor {
	x1 = _x1;
	y1 = _y1;
	
	x2 = _x2;
	y2 = _y2;
	
	if (x1 < x2) {
		xleft = x1;
		xright = x2;
	} else {
		xleft = x2;
		xright = x1;
	}
		
	if (y1 < y2) {
		ytop = y1;
		ybot = y2;
	} else {
		ytop = y2;
		ybot = y1;
	}
		
	xcenter = (x1+x2)/2;
	ycenter = (y1+y2)/2;
	
	width = xright-xleft;
	height = ybot-ytop;
		
	half_width = width/2;
	half_height = height/2;
	
	
	static move_pos = function(_deltax, _deltay) {
		x1 += _deltax;
		x2 += _deltax;
		xleft += _deltax;
		xright += _deltax;
		xcenter += _deltax;
		
		y1 += _deltay;
		y2 += _deltay;
		ytop += _deltay;
		ybot += _deltay;
		ycenter += _deltay;
	}
	
	static check_collision = function(_other) {
		return xleft  <= _other.xright 
			&& xright >= _other.xleft 
			&& ytop   <= _other.ybot 
			&& ybot   >= _other.ytop;
	}
	
	static make_from_text = function(_xleft,_ytop,_text,_font = fnt_default) {
		draw_set_font(_font);
		var _rect = new Rectangle(_xleft, _ytop, _xleft+string_width(_text), _ytop+string_height(_text));
		draw_set_font(fnt_default);
		return _rect;
	}
}
