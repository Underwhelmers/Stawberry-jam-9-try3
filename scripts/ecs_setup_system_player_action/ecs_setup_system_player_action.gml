function ecs_setup_system_player_action(_action_verb, _requirements, _effect) {
	var executer = new ECS_SystemInstance([ecs_action_verb_to_used_field(_action_verb)],{});
	executer.true_effect = method(executer, _effect);
	executer.execute_logic = method(executer, function(entity, args) {
		true_effect(entity);
		obj_ecs_manager.component_manager.remove_component(entity, required[0]);
		obj_usable_action_manager.require_update = true;
	});
	
	
	var _action = {
		tracker: new ECS_EntityTracker(_requirements),
		action_verb: _action_verb,
		get_text: function(entity) {
			var text = string_replace_all(action_verb,"{name}",entity.name);
			return "-"+text+"-";
		}
	}
	
	obj_ecs_manager.system_manager.register_system(executer);
	array_push(obj_usable_action_manager.player_actions, _action);
    return executer;
}