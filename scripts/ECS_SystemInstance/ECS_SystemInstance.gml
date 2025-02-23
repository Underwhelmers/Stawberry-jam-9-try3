function ECS_SystemInstance(_required_components, _execution_args) constructor {
    entities = ds_map_create();
    required = _required_components;
	execute_args = _execution_args;
	execute_logic = global.empty_func_1param;
    
    static check_entity = function(entity) {
        for (var i = 0; i < array_length(required); i++) {
            var compo = required[i];
			if (string_char_at(compo,0) == "!") {
				compo = string_copy(compo,2,string_length(compo)-1);
				if (struct_exists(entity, compo)) {
	                return false;
	            }
			} else if (!struct_exists(entity, compo)) {
                return false;
            }
        }
        return true;
    }
    
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
    
    static update = function() {
		var _registered = ds_map_keys_to_array(entities);
        for (var i = 0, count = array_length(_registered); i < count; i++) {
            execute_logic(_registered[i],execute_args);
        }
    }
}