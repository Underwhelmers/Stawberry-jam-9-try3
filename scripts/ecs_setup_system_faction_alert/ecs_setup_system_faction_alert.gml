function ecs_setup_system_faction_alert() {
    var executer = new ECS_SystemInstance(["is_npc", "faction", "position"],{});
	executer.events = [];
    executer.add_event = method(executer, function(_source, _event_type, _target) {
        array_push(events, { source: _source, event_type: _event_type, target: _target });
    });
    executer.execute_logic = method(executer, function(entity, args) {
        for (var i = 0; i < array_length(events); i++) {
            var evt = events[i];
            if (evt.source != entity && struct_exists(evt.source, "faction") && evt.source.faction.faction_name == entity.faction.faction_name) {
                if (entity.position.location == evt.source.position.location) {
                    if (evt.event_type == "attacked") {
                        if (struct_exists(entity, "mood")) {
                            entity.mood.state = "angry";
                            entity.mood.intensity = 0.8;
                        }
                        scr_chat((entity.name), "Hey, they’re attacking {0}! Get ‘em!", evt.source.name);
                    }
                }
            }
        }
        events = []; // Clear after processing
    });
    obj_ecs_manager.system_manager.register_system(executer);
}