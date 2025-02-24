function NpcInteractionSystems_setup_030_AlignToRear() {
    NpcInteractionSystems.AlignToRear = ecs_setup_system_player_npc_interaction(
        "align to rear of {name}",
        ["interested_sexualy", "banging_state", "is_aroused", "relationship_with_pc", "traits", "!is_banging"],
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            var banging = entity.banging_state;
			
            banging.cavity = "rear"; // Default to "front", can be set via UI
            scr_chat(entity.name, "align_to_rear_response");
        }
    );
	
    new_word_variant("align_to_rear_response", ["Rear's all yours.", "Back turned, good.", "Behind's ready."]);
}