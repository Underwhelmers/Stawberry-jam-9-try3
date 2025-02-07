// Draw the full slider background
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

// Draw the knob
draw_sprite_ext(sprite_index, 1, knob_x+x, knob_y+y, 1, image_yscale, image_angle, image_blend, image_alpha);

draw_sprite_ext(sprite_index, 2, x, y, draw_fill, image_yscale, image_angle, image_blend, image_alpha);

// Draw the value text if needed
if (draw_number) {
    draw_text(knob_x+x, knob_y+y - 16 - sprite_yoffset, string(value));
}