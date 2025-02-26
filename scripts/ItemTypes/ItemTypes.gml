function ItemTypes() constructor {
	
	
	static default_make_new = function() {
		var entity = obj_ecs_manager.entity_manager.create_entity();
		StateComponents.types.is_item.add_to(entity);
	};
	
}