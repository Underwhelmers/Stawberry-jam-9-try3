function ecs_setup_system_npc_knowledge_sharing() {
    var executer = new ECS_SystemInstance(["is_npc", "knowledge", "position"], {});
    executer.execute_logic = method(executer, function(entity, args) {
        var nearby_npcs = ds_list_create();
		
        for (var i = 0; i < ds_list_size(entity.position.location.contents); i++) {
            var _other = entity.position.location.contents[| i];
            if (struct_exists(_other, "is_npc") && _other != entity) {
                ds_list_add(nearby_npcs, _other);
            }
        }
        
        if (!ds_list_empty(nearby_npcs) && !ds_list_empty(entity.knowledge.contents)) {
            var fact = entity.knowledge.contents[| 0];
            var target = nearby_npcs[| 0];
            if (struct_exists(target, "knowledge")) {
                target.knowledge.add_fact(target, fact);
                scr_chat((entity.name), "Hey {0}, did you know {1}?", target.name, fact);
            }
        }
    });
    obj_ecs_manager.system_manager.register_system(executer);
}