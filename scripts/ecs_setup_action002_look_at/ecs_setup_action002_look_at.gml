function ecs_setup_action002_look_at() {
    ecs_setup_system_multiplayer_action(
        "look at {name1}'s {name2}",
        [["is_npc"], ["is_bodypart"]],
        function(entities) {
            var char = entities[0];
            var bodypart = entities[1];
            scr_inform("You look at {0}'s {1}.", (char.name), bodypart.name);
            scr_chat((char.name), "*Stands oblivious*");
        },
		validate_character_body_part_compatible
    );
}