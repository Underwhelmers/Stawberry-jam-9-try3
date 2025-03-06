function ECS_EntityTracker(_components) constructor {
	components = _components;
	entities = ds_map_create();	
	
    static add_entity = function(entity) {
        if (!ds_map_exists(entities, entity)) {
            ds_map_add(entities, entity, {});
        }
    }
    
    static remove_entity = function(entity) {
        if (ds_map_exists(entities, entity)) {
            ds_map_delete(entities, entity);
        }
    }
	
	static all_instances = [];
	array_push(all_instances, self);
	
	static register_entity = function(entity) {
		for (var i = 0, count = array_length(all_instances); i < count; i++) {
			if (ecs_entity_fulfills(entity, all_instances[i].components)) {
				all_instances[i].add_entity(entity);
			}
		}
	}
	static unregister_entity = function(entity) {
		for (var i = 0, count = array_length(all_instances); i < count; i++) {
			all_instances[i].remove_entity(entity)
		}
	}
	static update_registration = function(entity) {
		for (var i = 0, count = array_length(all_instances); i < count; i++) {
			if (ecs_entity_fulfills(entity, all_instances[i].components)) {
				all_instances[i].add_entity(entity);
			} else {
				all_instances[i].remove_entity(entity);
			}
		}
	}
	
	
	var candidates = ds_map_values_to_array(obj_ecs_manager.entity_manager.entities);
	for (var i = 0, count = array_length(candidates); i < count; i++) {
		var entity = candidates[i];
		if (ecs_entity_fulfills(entity, components)) {
            ds_map_add(entities, entity, {});
		}
	}
}