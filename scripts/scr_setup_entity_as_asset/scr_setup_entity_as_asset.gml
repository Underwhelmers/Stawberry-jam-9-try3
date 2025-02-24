function scr_setup_entity_as_asset(entity) {
	var manager = obj_ecs_manager.component_manager;
	
	StateComponents.on_the_floor           .add_to(entity);
	StateComponents.out_of_reach           .add_to(entity);
	StateComponents.is_object              .add_to(entity);
	StateComponents.storable_in_backpack   .add_to(entity);
}
