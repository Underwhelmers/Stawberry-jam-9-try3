function scr_initialize_game() {
	
	scr_initialize_scene_descriptions();
	scr_initialize_character_descriptions();
	scr_initialize_sex_actions();
	scr_initialize_body_part_interactions();
	
    // Create player
    global.player = {
        name: "You",
        arousal: 0,  // 0-100, tracks player's excitement
        body: {
            hands: { free: true },
            mouth: { free: true },
            genitals: { free: true, aroused: false }
        }
    };
    player = global.player;
    
    // Create a starting scene
    var start_scene = {
        name: "Dimly Lit Bedroom",
        base_description: scr_generate_scene_description(),
        details: [
            "The air carries a faint musk of incense and desire.",
            "A velvet curtain sways gently, teasing glimpses of the night beyond.",
            "The bed creaks softly, inviting touch."
        ],
        characters: ds_list_create()
    };
	
	// Create a character
    var character = {
        name: "Sylva",
		eye_color: choose("blue_eyes", "green_eyes", "brown_eyes"),
		mood: choose("calm_mood", "nervous_mood", "cheerful_mood"),
		
        arousal: 0,
        body: {
            hands: { free: true },
            mouth: { free: true },
            genitals: { free: true, aroused: false },
            breasts: { exposed: false },
            skin: { tone: "pale", flushed: false }
        },
        description: {
            base: scr_generate_character_description("Sylva"),
            variants: [
                "Her lips part slightly, a promise of warmth.",
                "She shifts, her curves catching the candlelight.",
                "A subtle smirk plays on her face, daring you closer."
            ]
        }
    };
    ds_list_add(start_scene.characters, character);
    ds_map_add(characters, string_lower(character.name), character);
    ds_map_add(scenes, "bedroom", start_scene);
    current_scene = start_scene;
    
    player_action_look_around(current_scene); // Show the scene on start
	
	
	scr_setup_command_synonyms();
	scr_register_targets();
}