function ECS_SystemManager() constructor {
    systems = [];
    
    static register_system = function(system) {
        array_push(systems, system);
    }
	
    static unregister_system = function(system) {
        array_remove(systems, system);
    }
    
    static update_registration = function(entity) {
        for (var i = 0, count = array_length(systems); i < count; i++) {
            var sys = systems[i];
            if (sys.check_entity(entity)) {
                sys.add_entity(entity);
            } else {
                sys.remove_entity(entity);
            }
        }
    }
	
	static remove_entity = function(entity) {
		for (var i = 0, count = array_length(systems); i < count; i++) {
            systems[i].remove_entity(entity);
        }
	}
	
	static update_systems = function() {
		for (var i = 0, count = array_length(systems); i < count; i++) {
            with(systems[i]) update();
		}
	}
}
