global.chat.draw(0,SCREEN_H);


draw_set_color(c_white);
draw_set_font(fnt_default_button);
if (input_active) {
    draw_text(SCREEN_W/2, SCREEN_H-64, input_string + "|");
} else {
    draw_text(SCREEN_W/2, SCREEN_H-64, "_Enter_");
}
draw_set_font(fnt_default);