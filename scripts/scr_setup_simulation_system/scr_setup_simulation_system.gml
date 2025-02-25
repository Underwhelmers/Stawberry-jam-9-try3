function scr_setup_simulation_system() {
	ECS_SystemInstance.npc_initiative = new ECS_SystemInstance(
        ["is_npc", "relationship_with_pc", "traits", "!waiting_player_response",],
        { tick_rate: 60, cooldown: 60 }
    );
    
    ECS_SystemInstance.npc_initiative.execute_logic = function(entity, args) {
        var npc = entity.relationship_with_pc;
        
        if (random(100) < 20 && args.cooldown-- < 0) {
            args.cooldown = args.tick_rate;
			var alone_with_pc = StateComponents.types.alone_with_pc.exists_on(entity);
			var is_banging = StateComponents.types.is_banging.exists_on(entity);
			
			
            if (npc.desire > 60 && ecs_entity_fulfills(entity, ["alone_with_pc","is_banging"]) && success(0.125)) {
                scr_npc_initiate_intimacy(entity); // Example NPC action
            } else if (npc.attraction > 50 && success(0.125)) {
				scr_npc_flirt(entity);
            }
        }
    };
    
    obj_ecs_manager.system_manager.register_system(ECS_SystemInstance.npc_initiative);
	
	new_word_variant("npc_flirt_positive", [
        "|Yes|, you're looking |good| today!",
        "Oh, I can't stop |wanting| you!",
        "|Mmm|, come closer, |please|!"
    ]);
    
    new_word_variant("npc_initiate_intimacy_positive", [
        "|Mmm|, I'm |pushing| against you |now|!",
        "Oh, |yes|, let's get |tight|!",
        "|Want| you inside me |now|!"
    ]);
}