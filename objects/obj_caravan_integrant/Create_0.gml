base_x = x;
base_y = y;
forward_speed = 1;
backward_speed = 1;

max_height = 8;
time_elapsed = 0;
is_jumping = false;

jump_timer_rnd = new Randomizer(20,45);
jump_timer = jump_timer_rnd.inext();

small_jump_threshold = 16;