function ecs_setup_action_release() {
    ecs_setup_system_multiplayer_action(
        "release {name1} from {name2}",
        [["is_present", "is_bound"], ["is_rope","used_in_bond"]],
        function(entities) {
            var char = entities[0];
            var rope = entities[1];
            scr_inform("You release {0} from {1}.", (char.name), rope.name);
            StateComponents.types[$ "is_bound"].remove_from(char);
            StateComponents.types[$ "used_in_bond"].remove_from(rope);
            StateComponents.types[$ "is_in_inventory"].add_to(rope);
            scr_chat((char.name), "*Sighs in relief*");
        }
    );
}