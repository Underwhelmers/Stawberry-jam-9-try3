function ecs_setup_system_faction_reputation_update() {
    var executer = new ECS_SystemInstance(["faction"], {});
	executer.action_log = [];
    executer.add_action_log = method(executer, function(_actor, _target, _action_type, _impact) {
        array_push(action_log, { actor: _actor, target: _target, action_type: _action_type, impact: _impact });
    });
    executer.execute_logic = method(executer, function(entity, args) {
        for (var i = 0; i < array_length(action_log); i++) {
            var log = action_log[i];
            if (log.target == entity || (struct_exists(log.target, "faction") && log.target.faction.faction_name == entity.faction.faction_name)) {
                var rep_change = 0;
                switch (log.action_type) {
                    case "attack": rep_change = -0.3; break;
                    case "help": rep_change = 0.2; break;
                    case "trade": rep_change = 0.1; break;
                }
                rep_change *= log.impact;

                var target_key = struct_exists(log.actor, "is_player") ? "player" : log.actor.faction.faction_name;
                var current_rep = entity.faction.get_reputation(entity, target_key);
                entity.faction.set_reputation(entity, target_key, current_rep + rep_change);
            }
        }
        action_log = []; // Clear after processing
    });
    obj_ecs_manager.system_manager.register_system(executer);
}