function ecs_setup_action_insert_into() {
    ecs_setup_system_multiplayer_action(
        "insert {name1} into {name2}'s {name3}",
        [["is_phallic"], ["is_present", "is_naked"], ["is_cavity"]],
        function(entities) {
			var phallus = entities[0];
            var char = entities[1];
            var bodypart = entities[2];
            scr_inform("You insert your {2} into {0}'s {1}.", (char.name), bodypart.name, phallus.name);
            StateComponents.types[$ "is_penetrated"].add_to(char);
            char.arousal_level += 40;
            scr_chat((char.name), "*Cries out in pleasure*");
        }
    );
}