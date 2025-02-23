function scr_generate_new_npc(_truename) {
	var entity = obj_ecs_manager.entity_manager.create_entity(_truename);
	scr_setup_entity_as_npc(entity);
	return entity;
}