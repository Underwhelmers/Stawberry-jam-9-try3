function npc_initiate_intercourse(_npc) {
    if (struct_exists(_npc, "intimacy_history")) {
        _npc.intimacy_history.add_event(_npc, global.player_entity, "intercourse_initiated", "pending");
    }

    // Check for player fluids before initiating
    if (struct_exists(global.player_entity, "body_fluid") && struct_exists(global.player_entity, "sensory_profile")) {
        var fluids = struct_get_names(global.player_entity.body_fluid.fluids);
        var strongest_fluid = "";
        var max_intensity = 0;
        for (var i = 0; i < array_length(fluids); i++) {
            var intensity = global.player_entity.body_fluid.fluids[$ fluids[i]];
            if (intensity > max_intensity) {
                max_intensity = intensity;
                strongest_fluid = fluids[i];
            }
        }
        if (max_intensity > 0.5) {
            var smell = global.player_entity.sensory_profile.smell_traits[$ strongest_fluid];
            scr_chat((_npc.name), "That {0} smell on you... I can’t resist it.", strongest_fluid);
        }
    }

    var intercourse_response = {
        action_verb: "respond to {name}'s intercourse proposal",
        multientity: false,
        tracker: new ECS_EntityTracker(["is_player"]),
        get_text: function(entity) { return "-Accept or reject {0}'s advance-"; },
        on_accept: function() {
            scr_chat("You", "Lead the way...");
            _npc.relationship.intimacy = min(1, _npc.relationship.intimacy + 0.2);
            _npc.mood.desire = "aroused";
            if (struct_exists(_npc, "body_fluid")) {
                _npc.body_fluid.add_fluid(_npc, "semen", 0.2);
                global.player_entity.body_fluid.add_fluid(global.player_entity, "semen", 0.1);
            }
            if (struct_exists(_npc, "intimacy_history")) {
                _npc.intimacy_history.add_event(_npc, global.player_entity, "intercourse", "positive", true);
            }
        },
        on_reject: function() {
            scr_chat("You", "Not feeling it right now.");
            _npc.mood.desire = "repulsed";
            _npc.relationship.intimacy = max(0, _npc.relationship.intimacy - 0.2);
            if (struct_exists(_npc, "intimacy_history")) {
                _npc.intimacy_history.add_event(_npc, global.player_entity, "intercourse", "negative");
            }
        }
    };
    array_push(obj_usable_action_manager.player_actions, intercourse_response);
}