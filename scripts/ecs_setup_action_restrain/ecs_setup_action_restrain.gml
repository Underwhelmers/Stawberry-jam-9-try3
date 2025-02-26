function ecs_setup_action_restrain() {
    ecs_setup_system_multiplayer_action(
        "restrain {name1} with {name2}",
        [["is_present", "has_talked", "!is_bound"], ["is_rope", "is_in_inventory"]],
        function(entities) {
            var char = entities[0];
            var rope = entities[1];
            scr_inform("You restrain {0} with {1}.", (char.name), rope.name);
            StateComponents.types[$ "is_bound"].add_to(char);
            StateComponents.types[$ "used_in_bound"].add_to(rope);
            StateComponents.types[$ "is_in_inventory"].remove_from(rope);
			
            if (StateComponents.types[$ "has_fetish_bondage"].exists_on(char)) {
                char.arousal_level += 40;
                scr_chat((char.name), "*Thrills at the restraint*");
            } else {
                scr_chat((char.name), "*Tenses slightly*");
            }
        }
    );
}