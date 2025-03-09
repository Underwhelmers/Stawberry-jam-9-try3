function make_new_room_connection(location1, location2) {
	var name = generate_phrase_with_variants("|intricate| |portal|");
	var Name = string_capitalize(name);
	
	var entity1 = obj_ecs_manager.entity_manager.create_entity();
	Components.types.portal.add_to(entity1, location1);
	Components.types.position.add_to(entity1, location2);
	Components.types.identity.add_to(entity1, Name, 
		string("On the other side of the {0} you hear the {1}", name, location1.name)
	);
	
	var entity2 = obj_ecs_manager.entity_manager.create_entity();
	Components.types.portal.add_to(entity2, location2);
	Components.types.position.add_to(entity2, location1);
	Components.types.identity.add_to(entity2, Name, 
		string("On the other side of the {0} you hear the {1}", name, location2.name)
	);
}