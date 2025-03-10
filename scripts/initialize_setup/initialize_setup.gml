function initialize_setup() {
    var entities = obj_ecs_manager.entity_manager;
    global.house = [];
    var ghindex = 0;

    var data = house_generation_data();
	var room_types = data[0];
	var item_pools = data[1];

    // Randomly generate rooms (e.g., pick 4-6 rooms)
    var room_count = irandom_range(4, 6); // Random number of rooms
    var selected_rooms = array_shuffle(room_types);
    for (var i = 0; i < room_count; i++) {
        global.house[ghindex++] = make_new_room(selected_rooms[0], item_pools[$ selected_rooms[0][0]]);
    }

    // Connect rooms (same as your original)
    global.house = array_shuffle(global.house);
    for (var i = 0; i < room_count - 1; i++) {
        make_new_room_connection(global.house[i], global.house[i + 1]);
    }

    // Player and guests (unchanged for now)
    global.player = make_new_character("Anon", global.house[0]);
    Components.types.is_player.add_to(global.player);
    Components.types.is_npc.remove_from(global.player);

    var guest_count = 1;
    global.guests = array_create(guest_count);
    for (var i = 0; i < guest_count; i++) {
        global.guests[i] = make_new_character("Faly", array_choose(global.house));
    }

    Components.types.sharing_room.update();
}