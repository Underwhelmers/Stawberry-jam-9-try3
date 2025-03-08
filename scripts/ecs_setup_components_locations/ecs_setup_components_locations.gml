function ecs_setup_components_locations() {
    Components.types.is_location = new Components("is_location");
	
	Components.types.position = new Components(
		"position", undefined,
		function(entity, _location = {}) {
			//_location.contents.add(entity);
			
            default_add(entity, {
				location: _location
			});
        }
	);
	
	Components.types.sharing_room = new Components("sharing_room");
	Components.types.sharing_room.update = method(
		Components.types.sharing_room,
		function() {
			ds_list_foreach(current_entities, function(item) {
				self.remove_from(item);
			});
			
			ds_list_foreach(Components.types.position.current_entities, function(item) {
				if (item.position.location == global.player.position.location) {
					self.add_to(item);
				}
			});
		}
	);
	
	Components.types.is_in_reach = new Components("is_in_reach", Components.types.sharing_room);
}