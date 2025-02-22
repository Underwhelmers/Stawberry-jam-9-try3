function ecs_setup_system_player_action(_action_verb, _requirements, _effect) {
	var action_attr = string_replace_all(_action_verb, " ", "_");
	var inst = new ECS_SystemInstance(["player_used_" + action_attr], {
		real_effect: _effect,
		action_attr: action_attr,
		system_event: _action_verb
	});
	inst.execute_logic = function(entity, args) {
		args.real_effect(entity, args);
		obj_ecs_manager.component_manager.remove_component(entity, "player_used_" + args.action_attr);
		instance_destroy(obj_usable_action);
		obj_usable_action_manager.require_update = true;
	};
	inst.system_event = _action_verb;
	
	var seaker = new ECS_SystemInstance(_requirements, {
		action_verb: _action_verb,
		action_attr: action_attr,
		action_manager: obj_usable_action_manager.id,
	});
	seaker.execute_logic = function(entity, args) {
		if (!args.action_manager.updating) return;
		
		instance_create_depth(SCREEN_W * 0.75,SCREEN_H * 0.5, 0, obj_usable_action, {
			entity: entity,
			action_attr: args.action_attr,
			text: string("{0} {1}", args.action_verb, entity.name)
		});
	};
	
	obj_ecs_manager.system_manager.register_system(seaker);
	obj_ecs_manager.system_manager.register_system(inst);
	return inst;
}