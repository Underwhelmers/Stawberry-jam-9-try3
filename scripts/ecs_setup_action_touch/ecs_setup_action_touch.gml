function ecs_setup_action_touch() {
	ecs_setup_system_player_action(
        "touch {name1} {name2}",
        [["shares_pc_location", "is_character"],["is_body_part"]], // Requires the character to be present
        function(entities) {
			var char = entities[0];
			var bodypart = entities[1];
			
			scr_inform("You touch {0}'s {1}.", char.name, bodypart.name);
        }
    );
}