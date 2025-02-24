function scr_setup_entity_as_npc(_entity) {
	var manager = obj_ecs_manager.component_manager;
	
	StateComponents.is_npc.add_to(_entity);
	
	manager.add_component(_entity, "truename", _entity.name);
	manager.add_component(_entity, "name", "stranger");
	
	var traits = ds_list_create();
	manager.add_component(_entity, "traits", traits);
	ds_list_add(traits, PersonalityTrait.all_instances_vb.get());
	
	ecs_setup_component_relationship_with_pc(manager, _entity);
}
