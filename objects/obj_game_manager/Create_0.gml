scenes = ds_map_create();       // Stores scene data
characters = ds_map_create();   // Stores character data
player = undefined;             // Player character
current_scene = undefined;      // Current scene the player is in
input_active = false;           // Tracks if we're waiting for input
input_string = "";              // Stores the player's typed input
scr_setup_all_actions();		// Setup actions
scr_initialize_game();          // Setup function
