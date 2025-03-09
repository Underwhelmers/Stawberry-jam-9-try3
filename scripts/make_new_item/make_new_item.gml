function make_new_item(_name, _description) {
	var entity = obj_ecs_manager.entity_manager.create_entity();
	Components.types.identity.add_to(entity, _name, _description);
	Components.types.add_all(entity, ["is_item"]);
	
	return entity;
}