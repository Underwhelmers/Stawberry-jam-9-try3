function ecs_setup_action009_cross_portal() {
    ecs_setup_system_player_action(
        "cross {name}",
        ["portal", "is_in_reach"],
        function(portal) {
            
			global.player.position.location = portal.portal.other_side;
			Components.types.sharing_room.update();
			
			scr_inform("*You entered the {0}*", portal.portal.other_side.name);
			var list = Components.types.sharing_room.current_entities;
			var assets = "*You see: ";
			for (var i = 0, count = ds_list_size(list); i < count; i++) {
				var curr = list[|i];
				if (curr != global.player && !struct_exists(curr,"is_location")) {
					assets += curr.name + ", ";
				}
			}
			assets += ".*";
			scr_inform(assets);
        },
    );	
}