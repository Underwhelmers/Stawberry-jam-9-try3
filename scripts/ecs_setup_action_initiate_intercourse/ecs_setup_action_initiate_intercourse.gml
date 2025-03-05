function ecs_setup_action_initiate_intercourse() {
    ecs_setup_system_player_action(
        "initiate intercourse with {name}",
        ["is_npc", "identity", "mood", "relationship"],
        function(entity) {
            var desire = entity.mood.desire;
            var intimacy = entity.relationship.intimacy;
            var faction_norms = struct_exists(entity, "faction") ? entity.faction.cultural_norms : "neutral";

            if (intimacy < 0.7 || desire == "repulsed") {
                scr_chat((entity.name), "No way! I’m not in the mood for that.");
                entity.mood.desire = "repulsed";
                entity.relationship.intimacy = max(0, intimacy - 0.2);
                if (struct_exists(entity, "faction")) {
                    var rep_system = obj_ecs_manager.system_manager.get_system("faction_reputation_update");
                    rep_system.add_action_log(global.player_entity, entity, "social_misstep", 0.5);
                }
            } else if (intimacy >= 0.7 && desire == "aroused") {
                scr_chat((entity.name), "Let’s find somewhere private...");
                entity.relationship.intimacy = min(1, intimacy + 0.2);
                // Potentially trigger a "scene" or event here
                if (faction_norms == "taboo") {
                    var rep_system = obj_ecs_manager.system_manager.get_system("faction_reputation_update");
                    rep_system.add_action_log(global.player_entity, entity, "social_misstep", 0.7);
                    scr_chat("Nearby NPC", "Did I just see what I think I saw? Disgusting!");
                }
            } else {
                scr_chat((entity.name), "Maybe another time...");
            }

            // Log the interaction
            if (struct_exists(entity, "intimacy_history")) {
                var outcome = (intimacy >= 0.7 && desire == "aroused") ? "positive" : "negative";
                entity.intimacy_history.add_event(entity, global.player_entity, "intercourse", outcome);
            }
			
			if (struct_exists(entity, "faction") && entity.faction.rank == "leader") {
			    var rep_system = obj_ecs_manager.system_manager.get_system("faction_reputation_update");
			    var impact = (entity.faction.cultural_norms == "taboo") ? 1.0 : 0.8;
			    rep_system.add_action_log(global.player_entity, entity, (desire == "aroused") ? "social_benefit" : "social_misstep", impact);
			}
        }
    );
}