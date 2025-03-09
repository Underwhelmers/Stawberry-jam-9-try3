function ecs_setup_action007_pickup() {
    ecs_setup_system_player_action(
        "pickup {name}",
        ["is_item", "is_in_reach"],
        function(item) {
			Components.types.in_inventory.add_to(item);
			
            scr_inform("You picked the {0}.", item.name);
        },
    );	
}