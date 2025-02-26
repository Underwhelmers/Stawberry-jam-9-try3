function ECS_SystemInstance(_required_components, _execution_args): ECS_EntityTracker(_required_components) constructor {
    required = _required_components;
	execute_args = _execution_args;
	execute_logic = global.empty_func_1param;
    
    static update = function() {
		var _registered = ds_map_keys_to_array(entities);
        for (var i = 0, count = array_length(_registered); i < count; i++) {
            execute_logic(_registered[i],execute_args);
        }
    }
}