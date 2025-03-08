function ecs_setup_action005_use_on() {
    ecs_setup_system_multiplayer_action(
        "use {name1} on {name2}",
        [["is_item", "in_inventory"], ["is_npc"]],
        function(entities) {
            var char = entities[0];
            var bodypart = entities[1];
            scr_inform("You look at {0}'s {1}.", (char.name), bodypart.name);
            scr_chat((char.name), "*Stands oblivious*");
        },
    );
	
	ecs_setup_system_multiplayer_action(
        "use {name1} on self",
        [["is_item", "in_inventory"]],
        function(entities) {
            var char = entities[0];
            var bodypart = entities[1];
            scr_inform("You look at {0}'s {1}.", (char.name), bodypart.name);
            scr_chat((char.name), "*Stands oblivious*");
        },
    );
}