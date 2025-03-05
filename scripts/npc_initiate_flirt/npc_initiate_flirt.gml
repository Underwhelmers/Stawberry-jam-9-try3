function npc_initiate_flirt(_npc) {
    // Log the flirt event in the NPC’s intimacy history
    if (struct_exists(_npc, "intimacy_history")) {
        _npc.intimacy_history.add_event(_npc, global.player_entity, "flirt_initiated", "pending");
    }

    // Add a player response option (could be via UI or command)
    var flirt_response = {
        action_verb: "respond to {name}'s flirt",
        multientity: false,
        tracker: new ECS_EntityTracker(["is_player"]),
        get_text: function(entity) { return "-Accept or reject {0}'s flirt-"; },
        on_accept: function() {
            scr_chat("You", "I’d like that...");
            _npc.relationship.intimacy = min(1, _npc.relationship.intimacy + 0.2);
            _npc.mood.desire = "aroused";
            if (struct_exists(_npc, "intimacy_history")) {
                _npc.intimacy_history.add_event(_npc, global.player_entity, "flirt", "positive");
            }
        },
        on_reject: function() {
            scr_chat("You", "Not really my vibe.");
            _npc.mood.desire = "repulsed";
            _npc.relationship.intimacy = max(0, _npc.relationship.intimacy - 0.1);
            if (struct_exists(_npc, "intimacy_history")) {
                _npc.intimacy_history.add_event(_npc, global.player_entity, "flirt", "negative");
            }
        }
    };
    array_push(obj_usable_action_manager.player_actions, flirt_response);
}