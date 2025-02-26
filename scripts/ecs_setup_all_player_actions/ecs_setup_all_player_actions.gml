function ecs_setup_all_player_actions() {
	// Interaction 1: Greet a character
    ecs_setup_system_player_action(
        "greet {name}",
        ["is_present"], // Requires the character to be present
        function(entity) {
            var char = entity;
            scr_inform("You greet {0} warmly.",char.name);
            StateComponents.types[$ "has_talked"].add_to(entity); // Adds "has_talked" state
            if (char.personality == "shy") {
                scr_chat(char.name, "*Blushes and nods back*");
            } else {
                scr_chat(char.name, "*Returns a bold grin*");
            }
        }
    );

    // Interaction 2: Offer a dance (cultural exploration)
    ecs_setup_system_player_action(
        "offer to dance with {name}",
        ["is_present", "has_talked"], // Requires prior greeting
        function(entity) {
            var char = entity;
            scr_inform("You offer {0} a dance.", char.name);
            StateComponents.types[$ "has_danced"].add_to(entity);
			
            if (char.species == "Tentacled Beings") {
                scr_chat(char.name,"*Swirls their tentacles in a rhythmic dance*");
            } else {
                scr_chat(char.name,"*Steps gracefully with you*");
            }
        }
    );
	
	ecs_setup_system_multiplayer_action(
        "use {name1} on {name2}",
        [["is_in_inventory"], ["is_present","has_talked"]], // Oil in inventory, character present
        function(entities) {
            var oil = entities[0];
            var target = entities[1];
            scr_inform("You apply " + oil.name + " to " + target.name + "'s skin.");
            StateComponents.types[$ "is_oiled"].add_to(target);
            if (StateComponents.types[$ "has_fetish_sensory_play"].exists_on(target)) {
                target.arousal_level = min(target.arousal_level + 50, 100);
                scr_chat(target.name,"*Writhes in sensory delight*");
            } else {
                target.arousal_level += 20;
                scr_chat(target.name,"*Sighs at the warm touch*");
            }
        }
    );
}