function make_new_room(room_data, items) {
    var room_name = room_data[1];
    var room_desc = room_data[2];
        
    // Create the room
    var location = obj_ecs_manager.entity_manager.create_entity();
	Components.types.identity.add_to(location, room_name, room_desc);
	Components.types.add_all(location, ["is_location"]);
	
    // Add random items (2-4 per room)
    var item_count = irandom_range(2, array_length(items)); // Random subset of items
    var shuffled_items = array_shuffle(items);
    var room_items = [location]; // Include room itself as per your original
        
    for (var j = 0; j < item_count; j++) {
        var item_data = shuffled_items[j];
        var item = make_new_item(item_data[0], item_data[1]);
            
        // Apply optional components (like fragility, checks)
        if (array_length(item_data) > 2) {
            for (var k = 2; k < array_length(item_data); k++) {
                var comps = item_data[k];
				switch (array_length(comps)) {
					case 1: Components.types[$ comps[0]].add_to(item);
					case 2: Components.types[$ comps[0]].add_to(item,comps[1]);
					case 3: Components.types[$ comps[0]].add_to(item,comps[1],comps[2]);
					case 4: Components.types[$ comps[0]].add_to(item,comps[1],comps[2],comps[3]);
					case 5: Components.types[$ comps[0]].add_to(item,comps[1],comps[2],comps[3],comps[4]);
				}
            }
        }
        array_push(room_items, item);
    }
        
    place_in_room(location, room_items);
	
	return location;
}