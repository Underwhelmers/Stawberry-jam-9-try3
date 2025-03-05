function ecs_setup_system_faction_leader_jealousy() {
    var executer = new ECS_SystemInstance(["is_npc", "faction", "relationship", "mood"], {});
    executer.execute_logic = method(executer, function(entity, args) {
        if (entity.faction.rank != "leader" || entity.relationship.target != global.player_entity) return;

        if (entity.relationship.jealousy > 0.7) {
            scr_chat((entity.name), "You’ve humiliated me in front of my people! This won’t stand.");
            var rep_system = obj_ecs_manager.system_manager.get_system("faction_reputation_update");
            rep_system.add_action_log(global.player_entity, entity, "social_misstep", 1.0);
            // Spread faction-wide discontent
            if (struct_exists(entity, "knowledge")) {
                entity.knowledge.add_fact(entity, "{0} disrespected our leader with their dalliances", global.player_entity.name);
            }
        }
    });
    obj_ecs_manager.system_manager.register_system(executer);
}