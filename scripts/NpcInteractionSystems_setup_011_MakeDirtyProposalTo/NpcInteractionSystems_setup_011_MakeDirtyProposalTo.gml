function NpcInteractionSystems_setup_011_MakeDirtyProposalTo() {
	NpcInteractionSystems.MakeDirtyProposalTo = ecs_setup_system_player_npc_interaction(
        "make dirty proposal to", 
        ["already_introduced", "sitting_together", "relationship_with_pc", "traits", "!npc_is_ready_for_intimacy"], 
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            if (npc.check_all(undefined, 20, 30)) {
                ecs_change_state_with_comps(entity, [], ["npc_is_ready_for_intimacy"]);
                npc.desire += 10; // Proposal heightens desire
                scr_chat(entity.name, global.chat_texts[? "make_dirty_proposal_to_positive"]);
            } else {
                scr_chat(entity.name, global.chat_texts[? "make_dirty_proposal_to_negative"]);
            }
        }
    );
}