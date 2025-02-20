draw_self();
draw_set_attributes(fa_center, fa_middle, fnt_default_button, #7a133f);
draw_text_transformed(x-sprite_xoffset+sprite_width/2,y-sprite_yoffset+sprite_height/2,text, 1,1,0);
draw_set_attributes(fa_left, fa_top, fnt_dialog, c_white);

if (image_index == hover_index && tooltip != "")
	draw_tooltip(x + tooltip_offset.x, y + tooltip_offset.y, tooltip);