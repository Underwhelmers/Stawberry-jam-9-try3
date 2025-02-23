function scr_setup_simulation_system() {
    var sim_system1 = new ECS_SystemInstance(
        ["is_npc", "relationship_with_pc", "is_in_reach"], // Required components
        { tick_rate: 60, cooldown: 60 } // Executes every 60 steps (~1 sec at 60 FPS)
    );
    sim_system1.execute_logic = function(entity, args) {
        // Random chance to act each tick
		args.cooldown--;
		
        if (random(500) < 20 && args.cooldown == -1) { // 20% chance, throttled by alarm
	        var npc = entity.relationship_with_pc;
	        var manager = obj_ecs_manager.component_manager;
			
            args.cooldown = args.tick_rate; // Reset timer
            
            if (npc.attraction > 80 && manager.has_component(entity, "they_are_yours")) {
                // NPC initiates intimacy
                if (manager.has_component(entity, "is_naked")) {
                    scr_chat(entity.name, "Come closer, I need you now...");
                    manager.add_component(entity, "is_aroused", true);
                } else {
                    scr_chat(entity.name, "Let’s get these off...");
                    manager.add_component(entity, "is_naked", true);
                }
            } else if (npc.opinion < -20) {
                // NPC leaves if upset
                scr_chat(entity.name, "I’m done here.");
                ecs_change_state_with_comps(entity, 
					["is_in_reach","in_conversation","sitting_together","is_naked","npc_is_ready_for_intimacy"], 
					["out_of_reach","is_standing"]
				);
            } else if (npc.attraction > 40 && npc.trust > 30) {
                // NPC flirts back
                scr_chat(entity.name, "You’re kinda cute, you know?");
                npc.attraction += 5;
                npc.interact(5);
            } else {
                // Neutral idle behavior
                scr_chat(entity.name, "Just chilling here...");
            }
        }
    };
    obj_ecs_manager.system_manager.register_system(sim_system1);
	/*
	var sim_system2 = new ECS_SystemInstance(
        ["is_npc", "relationship_with_pc", "out_of_reach"], // Required components
        { tick_rate: 60, cooldown: 60 } // Executes every 60 steps (~1 sec at 60 FPS)
    );
    sim_system2.execute_logic = function(entity, args) {
        // Random chance to act each tick
		args.cooldown--;
		
        if (random(500) < 20 && args.cooldown == -1) { // 20% chance, throttled by alarm
	        var npc = entity.relationship_with_pc;
	        var manager = obj_ecs_manager.component_manager;
			
            args.cooldown = args.tick_rate; // Reset timer
            
			
        }
    };
    
    
	obj_ecs_manager.system_manager.register_system(sim_system2);
	*/
}