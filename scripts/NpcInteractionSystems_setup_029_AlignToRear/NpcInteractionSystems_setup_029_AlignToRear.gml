function NpcInteractionSystems_setup_029_AlignToRear() {
    NpcInteractionSystems.AlignToRear = ecs_setup_system_player_npc_interaction(
        "align to front of",
        ["npc_is_ready_for_intimacy", "banging_state", "is_aroused", "relationship_with_pc", "traits", "!is_banging"],
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            var banging = entity.banging_state;
			
            banging.cavity = "rear"; // Default to "front", can be set via UI
            scr_chat(entity.name, global.chat_texts[? "align_to_rear_response"]);
        }
    );
}