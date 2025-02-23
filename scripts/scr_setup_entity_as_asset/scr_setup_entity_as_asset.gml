function scr_setup_entity_as_asset(entity) {
	var manager = obj_ecs_manager.component_manager;
	var true_compoents = [
		"on_the_floor", "out_of_reach", "storable_in_backpack"
	];
	
	for(var i = 0, count = array_length(true_compoents); i < count; i++)
		manager.add_component(entity, true_compoents[i], true);	
}
