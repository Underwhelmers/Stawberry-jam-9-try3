function draw_tooltip(_x, _y, _text) {
    var _padding = 4; // Padding around the text
	draw_set_font(fnt_gui_text);
    var _width = string_width(_text) + (_padding * 2);
    var _height = string_height(_text) + (_padding * 2);
    
    // Draw background box
    draw_set_color(c_black);
    draw_rectangle(_x, _y, _x + _width, _y + _height, false);
    
    // Draw border
    draw_set_color(c_gray);
    draw_rectangle(_x, _y, _x + _width, _y + _height, true);
    
    // Draw text
    draw_set_color(c_white);
    draw_text(_x + _padding, _y + _padding, _text);
	draw_set_font(fnt_default);
}
