function ecs_setup_system_jealousy_behavior() {
    var executer = new ECS_SystemInstance(["is_npc", "identity", "relationship", "mood"], {});
    executer.execute_logic = method(executer, function(entity, args) {
        if (entity.relationship.target != global.player_entity || entity.relationship.jealousy <= 0) return;

        var jealousy = entity.relationship.jealousy;
        var jealousy_intensity = entity.mood.jealousy_intensity;

        if (jealousy_intensity > 0.7) {
            // High jealousy: Confrontation or sabotage
            scr_chat((entity.identity.name), "I can’t believe you’d do this to me! Explain yourself!");
            entity.mood.state = "angry";
            entity.mood.intensity = 0.8;
            entity.relationship.affinity = max(-1, entity.relationship.affinity - 0.3);
            // Potentially trigger faction consequences if public
            if (struct_exists(entity, "faction")) {
                var rep_system = obj_ecs_manager.system_manager.get_system("faction_reputation_update");
                rep_system.add_action_log(global.player_entity, entity, "social_misstep", 0.5);
            }
            // Spread negative gossip
            if (struct_exists(entity, "knowledge")) {
                entity.knowledge.add_fact(entity, "{0} betrayed me with someone else", global.player_entity.identity.name);
            }
        } else if (jealousy_intensity > 0.4) {
            // Moderate jealousy: Sulking or passive-aggressiveness
            scr_chat((entity.identity.name), "Guess I’m not good enough for you anymore...");
            entity.mood.state = "sad";
            entity.mood.intensity = 0.6;
            entity.relationship.intimacy = max(0, entity.relationship.intimacy - 0.1);
        } else {
            // Low jealousy: Subtle hints
            scr_chat((entity.identity.name), "You’ve been spending a lot of time with others lately...");
        }

        // Gradually reduce jealousy over time if no new triggers
        entity.relationship.adjust_jealousy(global.player_entity, -0.05);
        entity.mood.jealousy_intensity = max(0, entity.mood.jealousy_intensity - 0.05);
    });
    obj_ecs_manager.system_manager.register_system(executer);
}