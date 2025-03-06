function initialize_setup() {
	var entities = obj_ecs_manager.entity_manager;
	
	global.player = make_new_character("Anon");
	Components.types.is_player.add_to(global.player);
	Components.types.is_npc.remove_from(global.player);
	
	
	var guest_count = 1;
	global.guests = array_create(guest_count);
	for(var i = 0; i < guest_count; i++) {
		global.guests[i] = make_new_character("Faly");
	}
}