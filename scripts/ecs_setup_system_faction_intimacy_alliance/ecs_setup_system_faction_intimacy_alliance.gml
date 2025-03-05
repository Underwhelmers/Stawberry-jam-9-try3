function ecs_setup_system_faction_intimacy_alliance() {
    var executer = new ECS_SystemInstance(["is_npc", "faction", "intimacy_history"], {});
    executer.execute_logic = method(executer, function(entity, args) {
        if (ds_list_empty(entity.intimacy_history.contents)) return;
        var last_event = entity.intimacy_history.contents[| ds_list_size(entity.intimacy_history.contents) - 1];
        if (last_event.outcome != "positive") return;

        var partner = last_event.partner;
        if (struct_exists(partner, "faction") && partner.faction.faction_name != entity.faction.faction_name) {
            var current_rep = global.faction_manager.get_faction_relation(entity.faction.faction_name, partner.faction.faction_name);
            global.faction_manager.set_faction_relation(
                entity.faction.faction_name,
                partner.faction.faction_name,
                min(1, current_rep + 0.2)
            );
            scr_chat((entity.name), "Maybe our people aren’t so different after all...");
        }
    });
    obj_ecs_manager.system_manager.register_system(executer);
}