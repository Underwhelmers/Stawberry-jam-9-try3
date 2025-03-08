function ecs_setup_action004_push_in() {
    ecs_setup_system_multiplayer_action(
        "push your {name1} in their {name2}",
        [["is_bodypart", "is_phallus"], ["is_bodypart", "is_cavity"], ["is_player", "aligned"]],
        function(entities) {
            var phallus = entities[0];
            var cavity = entities[1];
			var char = entities[2].aligned[$ phallus.name].of;
			
			char.body[$ cavity.name].is_penetrated = true;
            scr_chat((char.name), "*Squirms as your {0} enters their {1}*", phallus.name, cavity.name);
        },
		function(entities) {
			var phallus = entities[0];
            var cavity = entities[1];
			var player = entities[2];
			
			return struct_exists(player.body, phallus.name) && 
				struct_exists(player.aligned, phallus.name) &&
				player.aligned[$ phallus.name].to = cavity &&
				!player.aligned[$ phallus.name].of.body[$ cavity.name].is_penetrated
				;
		}
    );
	
    ecs_setup_system_multiplayer_action(
        "push their {name1} in your {name2}",
        [["is_bodypart", "is_phallus"], ["is_bodypart", "is_cavity"], ["is_player", "aligned"]],
        function(entities) {
			var phallus = entities[0];
            var cavity = entities[1];
			var player = entities[2];
			var char = entities[2].aligned[$ cavity.name].of;
			
			player.body[$ cavity.name].is_penetrated = true;
            scr_chat((char.name), "*Holds their breath as his {0} enters your {1}*", phallus.name, cavity.name);
        },
		function(entities) {
			var phallus = entities[0];
            var cavity = entities[1];
			var player = entities[2];
			
			return struct_exists(player.body, cavity.name) && 
				struct_exists(player.aligned, cavity.name) &&
				player.aligned[$ cavity.name].to = phallus &&
				!player.body[$ cavity.name].is_penetrated
				;
		}
    );
}