function ecs_setup_action_flirt() {
    ecs_setup_system_player_action(
        "flirt with {name}",
        ["is_npc", "identity", "mood", "relationship"],
        function(entity) {
            var desire = entity.mood.desire;
            var affinity = entity.relationship.affinity;
            var intimacy = entity.relationship.intimacy;
            var faction_norms = struct_exists(entity, "faction") ? entity.faction.cultural_norms : "neutral";

            // Base reaction influenced by affinity and desire
            if (affinity < -0.3) {
                scr_chat((entity.name), "Not interested. Leave me alone.");
                entity.mood.desire = "repulsed";
                entity.relationship.intimacy = max(0, intimacy - 0.1);
            } else if (affinity > 0.5 && desire != "repulsed") {
                scr_chat((entity.name), "Oh, you’re sweet. Keep talking...");
                entity.mood.desire = "aroused";
                entity.relationship.intimacy = min(1, intimacy + 0.2);
            } else {
                scr_chat((entity.name), "Hmm, maybe... but not right now.");
            }

            // Faction reaction if conservative
            if (faction_norms == "conservative") {
                var rep_system = obj_ecs_manager.system_manager.get_system("faction_reputation_update");
                rep_system.add_action_log(global.player_entity, entity, "social_misstep", 0.3);
                scr_chat((entity.name), "People around here don’t take kindly to flirting in public.");
            }

            // Log the interaction
            if (struct_exists(entity, "intimacy_history")) {
                entity.intimacy_history.add_event(entity, global.player_entity, "flirt", affinity > 0 ? "positive" : "negative");
            }
        }
    );
}