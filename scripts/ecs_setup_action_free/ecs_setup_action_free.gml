function ecs_setup_action_free() {
    ecs_setup_system_player_action(
        "free {name}",
        ["is_present", "is_bound"],
        function(entity) {
            scr_inform("You free {0} from their bonds.", (entity.name));
            
			var used = entity.is_bound;
			
			StateComponents.types[$ "is_bound"].remove_from(entity);
			StateComponents.types[$ "is_in_use"].remove_from(used);
			StateComponents.types[$ "is_in_inventory"].add_to(used);
			
			
            scr_chat((entity.name), "*Stretches with relief*");
            scr_inform("You recover {0}.", (used.name));
        }
    );
}