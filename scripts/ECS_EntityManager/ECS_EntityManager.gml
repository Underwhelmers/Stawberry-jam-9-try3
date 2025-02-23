function ECS_EntityManager(_system_manager) constructor {
    static next_entity_id = 0;
    entities = ds_map_create();
	system_manager = _system_manager;
    
    static create_entity = function(_name) {
        var entity_id = next_entity_id++;
		var inst = {
			entity_id: entity_id,
			name: _name,
		}
        ds_map_add(entities, entity_id, inst);
        return inst;
    }
    
    static destroy_entity = function(entity) {
		system_manager.remove_entity(entity);
        ds_map_delete(entities, entity.entity_id);
    }
	
	static destroy_by_id = function(entity_id) {
		if (ds_map_exists(entities, entity_id)) {
			var entity = entities[? entity_id];
			system_manager.remove_entity(entity);
			ds_map_delete(entities, entity_id);
		}
	}
	
	static get_by_id = function(entity_id) {
        return entities[? entity_id];
	}
}

