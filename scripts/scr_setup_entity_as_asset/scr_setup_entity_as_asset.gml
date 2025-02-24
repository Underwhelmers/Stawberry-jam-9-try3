function scr_setup_entity_as_asset(entity) {
	var manager = obj_ecs_manager.component_manager;
	
	StateComponents.types[$ "on_the_floor"        ].add_to(entity);
	StateComponents.types[$ "out_of_reach"        ].add_to(entity);
	StateComponents.types[$ "is_object"           ].add_to(entity);
	StateComponents.types[$ "storable_in_backpack"].add_to(entity);
}
