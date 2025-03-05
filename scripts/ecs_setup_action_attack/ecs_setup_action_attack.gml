function ecs_setup_action_attack() {
    ecs_setup_system_player_action(
        "attack {name}",
        ["is_npc", "identity"],
        function(entity) {
            if (struct_exists(entity, "mood")) {
                entity.mood.state = "angry";
                entity.mood.intensity = 1.0;
            }
            if (struct_exists(entity, "relationship")) {
                entity.relationship.affinity = max(-1, entity.relationship.affinity - 0.5);
            }
            if (struct_exists(entity, "faction")) {
                var rep_system = obj_ecs_manager.system_manager.get_system("faction_reputation_update");
                var alert_system = obj_ecs_manager.system_manager.get_system("faction_alert");
                var impact = (entity.faction.rank == "leader") ? 1.0 : 0.7;
                rep_system.add_action_log(global.player_entity, entity, "attack", impact);
                alert_system.add_event(entity, "attacked", global.player_entity);
            }
            scr_chat((entity.name), "You’ll pay for that!");
        }
    );
}