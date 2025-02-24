function NpcInteractionSystems_setup_029_AlignToFront() {
    NpcInteractionSystems.AlignToFront = ecs_setup_system_player_npc_interaction(
        "align to front of {name}",
        ["interested_sexualy", "banging_state", "is_aroused", "relationship_with_pc", "traits", "!is_banging"],
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            var banging = entity.banging_state;
			
            banging.cavity = "front"; // Default to "front", can be set via UI
            scr_chat(entity.name, "align_to_front_response");
        }
    );
	
    new_word_variant("align_to_front_response", ["Alright, front it is.", "Facing you, |yes|.", "My front's set."]);
}