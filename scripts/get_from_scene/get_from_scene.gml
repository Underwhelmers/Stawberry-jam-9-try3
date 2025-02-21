function get_from_scene(_noun) {
	// Check if the object is in the current room
    for (var i = 0; i < array_length(global.current_room.items); i++) {
        if (global.current_room.items[i].name == _noun) {
            return global.current_room.items[i]; // Return the item in the room
        }
    }

    // If not found in the room, check the player's inventory
    for (var j = 0; j < array_length(global.player.inventory); j++) {
        if (global.player.inventory[j].name == _noun) {
            return global.player.inventory[j]; // Return the item in the player's inventory
        }
    }

    // Return null if the object is not found
    return undefined;
}