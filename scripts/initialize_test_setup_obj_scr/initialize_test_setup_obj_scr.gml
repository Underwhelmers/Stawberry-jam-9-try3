function initialize_test_setup_obj_scr() {
	global.chat = new ChatBox(room_width/2,room_height, fnt_chat_msg);
	obj_usable_action_manager.require_update = true;

	initialize_test_faction_manager();
	ecs_setup_all_components();


	// Initialize the setup
	var setup = initialize_test_setup();

	// Access entities for debugging or manual interaction
	var player = setup.player;
	var npcs = setup.npcs;
	var locations = setup.locations;

	// Example: Print initial state of an NPC for debugging
	scr_inform("Initial state of NPC 0:");
	scr_inform("Name: " + npcs[0].identity.name);
	scr_inform("Mood: " + npcs[0].mood.state + ", Desire: " + npcs[0].mood.desire);
	scr_inform("Hygiene: " + string(npcs[0].hygiene.cleanliness));
	scr_inform("Sweat Intensity: " + string(npcs[0].body_fluid.fluids[$ "sweat"]));
	
	
	ecs_setup_all_player_actions();
	scr_setup_all_systems();
}