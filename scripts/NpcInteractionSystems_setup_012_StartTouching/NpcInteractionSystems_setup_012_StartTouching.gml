function NpcInteractionSystems_setup_012_StartTouching(){
    NpcInteractionSystems.StartTouching = ecs_setup_system_player_npc_interaction(
        "start touching {name}", 
        ["interested_sexualy", "relationship_with_pc", "traits"],
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            if (npc.check_all(undefined, 40, 60)) {
                npc.stimulation += 15; // Physical touch increases stimulation
				StateComponents.types[$ "is_aroused"].add_to(entity);
				
                scr_chat(entity.name, "start_touching_positive");
            } else {
                scr_chat(entity.name, "start_touching_negative");
            }
        }
    );
	
    new_word_variant("start_touching_positive", ["|Mmm| <3", "Oh, yes!", "|Mmm|, love it!"]);
    new_word_variant("start_touching_negative", ["Not yet ;D", "Hold off a bit.", "Wait, please."]);
}