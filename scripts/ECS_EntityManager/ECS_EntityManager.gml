function ECS_EntityManager(_system_manager) constructor {
    static next_entity_id = 1;
    entities = ds_map_create();
	
    static create_entity = function() {
        var entity_id = next_entity_id++;
		var inst = {
			entity_id: entity_id
		}
        ds_map_add(entities, entity_id, inst);
		ECS_EntityTracker.register_entity(inst);
        return inst;
    }
    
    static destroy_entity = function(entity) {
		ECS_EntityTracker.unregister_entity(entity);
        ds_map_delete(entities, entity.entity_id);
    }
	
	static destroy_by_id = function(entity_id) {
		if (ds_map_exists(entities, entity_id)) {
			var entity = entities[? entity_id];
			ECS_EntityTracker.unregister_entity(entity);
			ds_map_delete(entities, entity_id);
		}
	}
	
	static get_by_id = function(entity_id) {
        return entities[? entity_id];
	}
}

