function npc_initiate_fetish_proposal(_npc, _fetish) {
    if (struct_exists(_npc, "intimacy_history")) {
        _npc.intimacy_history.add_event(_npc, global.player_entity, "fetish_proposal_initiated", "pending");
    }

    var fetish_response = {
        action_verb: "respond to {name}'s {fetish} proposal",
        multientity: false,
        tracker: new ECS_EntityTracker(["is_player"]),
        get_text: function(entity) { return "-Accept or reject {0}'s {1} proposal-"; },
        on_accept: function() {
            scr_chat("You", "Sounds... intriguing. Let’s try it.");
            _npc.relationship.intimacy = min(1, _npc.relationship.intimacy + 0.3);
            _npc.mood.desire = "aroused";
            if (struct_exists(_npc, "intimacy_history")) {
                _npc.intimacy_history.add_event(_npc, global.player_entity, "fetish_proposal", "positive");
            }
        },
        on_reject: function() {
            scr_chat("You", "Not my thing, sorry.");
            _npc.mood.desire = "repulsed";
            _npc.relationship.intimacy = max(0, _npc.relationship.intimacy - 0.1);
            if (struct_exists(_npc, "intimacy_history")) {
                _npc.intimacy_history.add_event(_npc, global.player_entity, "fetish_proposal", "negative");
            }
        }
    };
    array_push(obj_usable_action_manager.player_actions, fetish_response);
}