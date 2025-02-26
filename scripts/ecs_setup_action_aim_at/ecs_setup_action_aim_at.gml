function ecs_setup_action_aim_at() {
    ecs_setup_system_multiplayer_action(
        "aim {name3} at {name1}'s {name2}",
        [["is_present", "is_aroused"], ["is_body_part"], ["is_body_part"]],
        function(entities) {
            var char = entities[0];
            var bodypart = entities[1];
			var tool = entities[2];
            scr_inform("You your {2} aim at {0}'s {1}.", (char), bodypart.name, tool.name);
            char.arousal_level += 10;
            scr_chat((char.name), "*Watches intently*");
        }
    );
}