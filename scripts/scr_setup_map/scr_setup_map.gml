function scr_setup_map() {
    // Player starts in public room
    global.player = obj_ecs_manager.entity_manager.create_entity("Anon");
	ds_map_delete(obj_ecs_manager.entity_manager.entities,global.player.entity_id);
	StateComponents.types[$ "location"].add_to(global.player);
	
    // Define room entities
    var public_room = obj_ecs_manager.entity_manager.create_entity("Main hall");
	StateComponents.types[$ "is_location"].add_to(public_room);
    
    var private_room = obj_ecs_manager.entity_manager.create_entity("Bedroom");
	StateComponents.types[$ "is_location"].add_to(private_room);
    
    // Define door entity
    var door_to_private = obj_ecs_manager.entity_manager.create_entity("door to private room");
	StateComponents.types[$ "location"].add_to(door_to_private);
	StateComponents.types[$ "door"].add_to(door_to_private);
	StateComponents.types[$ "shares_location_with_pc"].add_to(door_to_private);
	door_to_private.location = public_room;
	door_to_private.door.target_location = private_room;
	
    var door_to_public = obj_ecs_manager.entity_manager.create_entity("door to public room");
	StateComponents.types[$ "location"].add_to(door_to_public);
	StateComponents.types[$ "door"].add_to(door_to_public);
	door_to_public.location = private_room;
	door_to_public.door.target_location = public_room;
    
	global.player.location = public_room;
	
    // NPC example
	repeat(10) {
		var npc = obj_ecs_manager.entity_manager.create_entity(global.name_generators.for_kobolds.generate());
		StateComponents.types[$ "location"].add_to(npc);
		StateComponents.types[$ "shares_location_with_pc"].add_to(npc);
		npc.location = public_room;
		scr_setup_entity_as_npc(npc);
	}
}