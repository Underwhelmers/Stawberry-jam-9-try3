function draw_text_framed(_x, _y, _string, _out_colour = c_black, _in_colour = c_white) {
	var _old_colour = draw_get_color();
	
	draw_set_color(_out_colour);
	draw_text(_x+2, _y  , _string);
	draw_text(_x-2, _y  , _string);
	draw_text(_x  , _y+2, _string);
	draw_text(_x  , _y-2, _string);
	draw_text(_x+1, _y+1, _string);
	draw_text(_x-1, _y-1, _string);
	draw_text(_x-1, _y+1, _string);
	draw_text(_x+1, _y-1, _string);
	
	draw_set_color(_in_colour);
	draw_text(_x, _y, _string);
	
	draw_set_color(_old_colour);
}