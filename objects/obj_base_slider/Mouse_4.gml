moving = true;
max_width = abs(image_xscale) * sprite_get_width(sprite_index) - margin_h*3;

var _radians = degtorad(-image_angle);
proyection_x = cos(_radians);
proyection_y = sin(_radians);