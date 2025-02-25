function scr_setup_global_game_state() {
	global.game_state = {
	    current_location: undefined,     // Current Location struct
	    characters: [],                  // Array of Character structs
	    items: [],                       // Array of Item structs
	    events: []                       // Array of NarrativeEvent structs
	};
	
	global.last_action = "";
	global.last_target = "";
	global.last_character = "";
}