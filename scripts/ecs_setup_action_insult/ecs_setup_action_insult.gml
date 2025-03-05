function ecs_setup_action_insult() {
    ecs_setup_system_player_action(
        "insult {name}",
        ["is_npc", "identity"],
        function(entity) {
            if (struct_exists(entity, "mood")) {
                entity.mood.state = "angry";
                entity.mood.intensity = 0.8;
            }
            if (struct_exists(entity, "relationship")) {
                entity.relationship.affinity = max(-1, entity.relationship.affinity - 0.3);
            }
            if (struct_exists(entity, "faction")) {
                var rep_system = obj_ecs_manager.system_manager.get_system("faction_reputation_update");
                rep_system.add_action_log(global.player_entity, entity, "attack", 0.5);
            }
            scr_chat((entity.name), "How dare you! You’ll regret that!");
        }
    );
}