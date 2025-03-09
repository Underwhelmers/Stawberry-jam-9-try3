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
			while (!ds_list_empty(current_entities)) {
				var item = current_entities[|0];
				self.remove_from(item);
			}
			
			var candidates = Components.types.position.current_entities;
			for (var i = 0, count = ds_list_size(candidates); i < count; i++) {
				var item = candidates[|i]
				if (item.position.location == global.player.position.location) {
					self.add_to(item);
				}
			}
		}
	);
	
	Components.types.is_in_reach = new Components("is_in_reach", Components.types.sharing_room);
	Components.types.proximity = new Components(
		"proximity",undefined,
		function(entity, old_proximity = undefined) {
			if (struct_exists(entity,"proximity")) {
				remove_from(entity);
			}
			
			if (old_proximity != undefined) {
				
			} else {
				default_add(entity, {
					everything: [],
					include: function(newentity) {
						Components.types.proximity.add_to(entity, self);
					}
				});
			}
			
			if (old_proximity != undefined) {
				
				entity.proximity = old_proximity;
				entity.proximity.include(entity);
			}
		}
	);
	Components.types.proximity.remove_from = method(
		Components.types.proximity,
		function(entity) {
			array_remove(entity.proximity.everything, entity);
		}
	)
	
	
	Components.types.portal = new Components(
		"portal", undefined,
		function(entity, otherside) {
			default_add(entity, {
				other_side: otherside
			});
		}
	);
	
	new_word_variant("portal", ["door", "hallway", "arch", "opening", "gate", "corridor"]);
	new_word_variant("intricate", ["intricate", "ornate", "well crafted", "beutieful"]);
}