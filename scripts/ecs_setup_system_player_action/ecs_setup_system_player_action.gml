function ecs_setup_system_player_action(_action_verb, _requirements, _effect) {
    var action_attr = string_replace_all(string_replace_all(_action_verb," {name}",""), " ", "_");
    var inst = new ECS_SystemInstance(["player_used_" + action_attr], {
        real_effect: _effect,
        action_attr: action_attr,
        system_event: _action_verb
    });
    inst.execute_logic = function(entity, args) {
        args.real_effect(entity, args);
        obj_ecs_manager.component_manager.remove_component(entity, "player_used_" + args.action_attr);
        obj_usable_action_manager.require_update = true; // Trigger refresh via method
    };
    inst.system_event = _action_verb;

    var seeker = new ECS_SystemInstance(_requirements, {
        action_verb: _action_verb,
        action_attr: action_attr
    });
    seeker.execute_logic = function(entity, args) {
        // Store action for tree building, no direct spawning
        if (!obj_usable_action_manager.updating) return;
		
        array_push(obj_usable_action_manager.pending_actions, {
            entity: entity,
            action_attr: args.action_attr,
            text: string_replace_all(args.action_verb, "{name}", entity.name)
        });
    };

    obj_ecs_manager.system_manager.register_system(seeker);
    obj_ecs_manager.system_manager.register_system(inst);
    return inst;
}