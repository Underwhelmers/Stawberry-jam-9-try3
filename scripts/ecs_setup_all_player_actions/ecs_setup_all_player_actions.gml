function ecs_setup_all_player_actions() {
	// Interaction 1: Greet a character
    ecs_setup_system_player_action(
        "greet {name}",
        ["is_present", "!in_conversation"], // Requires the character to be present
        function(entity) {
            var char = entity;
            scr_inform("You greet {0} warmly.",char.name);
            StateComponents.types[$ "has_talked"].add_to(entity); // Adds "has_talked" state
            StateComponents.types[$ "in_conversation"].add_to(entity); // Adds "has_talked" state
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
        ["is_present", "in_conversation"], // Requires prior greeting
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
        [["is_in_inventory"], ["is_present","in_conversation"]], // Oil in inventory, character present
        function(entities) {
            var item = entities[0];
            var target = entities[1];
            scr_inform("You {0}.", item.use_on(target));
        }
    );
	
	ecs_setup_system_player_action("strip {name}",
	    ["is_present", "in_conversation"],
	    function(entity) {
	        scr_inform("You gently strip {0}'s garments.", entity.name);
	        StateComponents.types[$ "is_naked"].add_to(entity);
	        StateComponents.types[$ "is_aroused"].add_to(entity);
	        entity.arousal_level += 20;
	        scr_chat(entity.name, "*Breathes faster as their skin is bared*");
	    }
	);
	
	ecs_setup_system_player_action("ask {name} about their culture",
	    ["is_present", "in_conversation"],
	    function(entity) {
	        scr_inform("You ask {0} about their culture.", entity.name);
	        StateComponents.types[$ "has_shared_ritual"].add_to(entity);
	        StateComponents.types[$ "cultural_affinity"].add_to(entity, entity.species + " Culture");
	        scr_chat(entity.name, "*Begins a slow, ceremonial gesture*");
	        StateComponents.types[$ "relationship_level"].add_to(entity, 5);
	    }
	);
}