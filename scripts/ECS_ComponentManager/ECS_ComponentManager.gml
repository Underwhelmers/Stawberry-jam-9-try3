function ECS_ComponentManager(_system_manager) constructor {
    system_manager = _system_manager;
    
    static add_component = function(entity, component_name, data) {
		if (struct_exists(entity, component_name)) {
			if (data != entity[$ component_name]) {
				entity[$ component_name] = data;
				system_manager.update_registration(entity);
			}
		} else {
			entity[$ component_name] = data;
			system_manager.update_registration(entity);
		}
    }
    
    static remove_component = function(entity, component_name) {
		if (struct_exists(entity, component_name)) {
			struct_remove(entity, component_name);
			system_manager.update_registration(entity);
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
