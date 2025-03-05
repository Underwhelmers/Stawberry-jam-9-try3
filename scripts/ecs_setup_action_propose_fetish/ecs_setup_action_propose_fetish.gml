function ecs_setup_action_propose_fetish() {
    ecs_setup_system_player_action(
        "propose {fetish} with {name}",
        ["is_npc", "identity", "fetish", "relationship"],
        function(entity) {
            var fetish = args.fetish; // Player specifies fetish, e.g., "roleplay"
            var intimacy = entity.relationship.intimacy;
            var matches = entity.fetish.matches_preference(entity, fetish);

            if (intimacy < 0.5) {
                scr_chat((entity.name), "I don’t know you well enough for that!");
                entity.relationship.intimacy = max(0, intimacy - 0.1);
            } else if (matches) {
                scr_chat((entity.name), "Oh, I’ve always wanted to try that... Let’s do it.");
                entity.relationship.intimacy = min(1, intimacy + 0.3);
                // Potentially trigger a "scene" or event
            } else {
                scr_chat((entity.name), "Uh, that’s not really my thing...");
                entity.relationship.intimacy = max(0, intimacy - 0.1);
            }

            // Log the interaction
            if (struct_exists(entity, "intimacy_history")) {
                entity.intimacy_history.add_event(entity, global.player_entity, "fetish_proposal", matches ? "positive" : "negative");
            }
        }
    );
}