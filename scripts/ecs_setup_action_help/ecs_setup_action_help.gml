function ecs_setup_action_help() {
    ecs_setup_system_player_action(
        "help {name}",
        ["is_npc", "identity"],
        function(entity) {
            if (struct_exists(entity, "mood")) {
                entity.mood.state = "happy";
                entity.mood.intensity = 0.7;
            }
            if (struct_exists(entity, "relationship")) {
                entity.relationship.affinity = min(1, entity.relationship.affinity + 0.2);
            }
            if (struct_exists(entity, "faction")) {
                var rep_system = obj_ecs_manager.system_manager.get_system("faction_reputation_update");
                rep_system.add_action_log(global.player_entity, entity, "help", 0.5);
            }
            scr_chat((entity.name), "Thanks for the help! I won’t forget this.");
        }
    );
}