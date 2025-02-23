drawer.update();
drawer.draw();

draw_set_attributes(fa_left, fa_middle, fnt_default_button);
draw_text(drawer.x + 8, drawer.y, showntext);
draw_set_attributes(fa_left, fa_top, fnt_default);