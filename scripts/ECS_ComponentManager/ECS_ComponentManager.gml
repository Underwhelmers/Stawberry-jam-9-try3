function ECS_ComponentManager(_system_manager) constructor {
    static add_component = function(entity, component_name, data) {
		if (struct_exists(entity, component_name)) {
			if (data != entity[$ component_name]) {
				entity[$ component_name] = data;
				ECS_EntityTracker.update_registration(entity);
			}
		} else {
			entity[$ component_name] = data;
			ECS_EntityTracker.update_registration(entity);
		}
    }
    
    static remove_component = function(entity, component_name) {
		if (struct_exists(entity, component_name)) {
			struct_remove(entity, component_name);
			ECS_EntityTracker.update_registration(entity);
		}
    }
    
    static get_component = function(entity, component_name) {
        if (struct_exists(entity, component_name)) {
            return entity[$ component_name];
        }
        return undefined;
    }
    
    static has_component = function(entity, component_name) {
		return struct_exists(entity, component_name);
    }
}
