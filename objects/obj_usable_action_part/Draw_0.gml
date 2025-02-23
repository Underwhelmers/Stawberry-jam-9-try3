drawer.update();
drawer.draw()

draw_set_attributes(fa_left, fa_middle, fnt_default_button);
draw_text(drawer.x+10,drawer.y,showntext);
draw_set_attributes(fa_left, fa_top, fnt_default);

//var posdiff = drawer.get_position_offset();
//draw_rectangle(bbox_left+posdiff.x,bbox_top+posdiff.y, bbox_right+posdiff.x, bbox_bottom+posdiff.y, true);