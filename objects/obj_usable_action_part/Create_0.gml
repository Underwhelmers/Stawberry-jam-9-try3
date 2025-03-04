showntext = node.mytext;

if (!string_ends_with(showntext, "-") && showntext != "") showntext += " ...";

draw_set_font(fnt_default_button);
var w = string_width(showntext) + 16;
var h = string_height(showntext) + 16;
draw_set_font(fnt_default);
image_scale_to(w, h);
	
drawer = new SpriteDelayedDrawer(id, 0.2);

