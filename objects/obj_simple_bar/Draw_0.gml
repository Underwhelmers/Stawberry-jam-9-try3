draw_self();
if (draw_value + draw_add_speed <= act_value ) {
	draw_value = draw_add_speed;
} else if (draw_value - draw_remove_speed >= act_value ) {
	draw_value -= draw_remove_speed;
}
var _progress = draw_value / max_value;

draw_sprite_ext(sprite_index,1,x,y,img_progress_offset+(image_xscale-img_progress_offset)*_progress,image_yscale, image_angle, image_blend, image_alpha);

draw_text(x,y+text_yoffset,string(act_value)+"/"+string(max_value))