function NpcInteractionSystems_setup_031_StartBangingWith() {
   NpcInteractionSystems.StartBangingWith = ecs_setup_system_player_npc_interaction(
        "start banging with {name}",
        ["interested_sexualy", "is_aroused", "relationship_with_pc", "traits", "!is_banging", "!banging_state"],
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            
			if (npc.check_all(undefined,60,60,60,60)) {
				StateComponents.banging_state.add_to(entity);
				
		        scr_chat(entity.name, "start_banging_with_positive");
			} else {
				scr_chat(entity.name, "start_banging_with_negative");
			}
        }
    );
	
    new_word_variant("start_banging_with_positive", ["Ready| for this?", "Yes|, let's start!", "All set |now|?"]);
    new_word_variant("start_banging_with_negative", ["Let's get warmed up first.", "Not |now|, slow down.", "Wait, not yet."]);
}