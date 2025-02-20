function draw_set_align(_horizontal, _vertical) {
	draw_set_halign(_horizontal);
	draw_set_valign(_vertical);
}

function draw_set_attributes(_halign, _valign, _font, _color = c_white) {
	draw_set_halign(_halign);
	draw_set_valign(_valign);
	draw_set_font(_font);
	draw_set_color(_color);
}