function scr_setup_entity_as_npc(_entity) {
	var manager = obj_ecs_manager.component_manager;
	
	var true_components = [
		"not_ready_for_intimacy",
		"neutral_opinion", 
		"name_is_unknown", 
		"not_intimating",
		"out_of_reach",
		"is_stranger", 
		"is_standing",
		"is_dressed",
		"is_npc", 
	];
	for(var i = 0, count = array_length(true_components); i < count; i++)
		manager.add_component(_entity, true_components[i], true);	
	
	
	
	manager.add_component(_entity, "truename", _entity.name);
	manager.add_component(_entity, "name", "stranger");
	
	var traits = ds_list_create();
	manager.add_component(_entity, "traits", traits);
	ds_list_add(traits, PersonalityTrait.all_instances_vb.get());
	//scr_inform("NPC IS {0}", traits[|0].name);
	
	ecs_setup_component_relationship_with_pc(manager, _entity);
}
