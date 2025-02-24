function NpcInteractionSystems_setup_011_MakeDirtyProposalTo() {
	NpcInteractionSystems.MakeDirtyProposalTo = ecs_setup_system_player_npc_interaction(
        "make dirty proposal to {name}", 
        ["already_introduced", "sitting_together", "relationship_with_pc", "traits", "!interested_sexualy"], 
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            if (npc.check_all(undefined, 20, 30)) {
				StateComponents[$ "interested_sexualy"].add_to(entity);
                npc.desire += 10; // Proposal heightens desire
                scr_chat(entity.name, "make_dirty_proposal_to_positive");
            } else {
                scr_chat(entity.name, "make_dirty_proposal_to_negative");
            }
        }
    );
	
    new_word_variant("make_dirty_proposal_to_positive", ["When?", "|now|?", "How soon?"]);
    new_word_variant("make_dirty_proposal_to_negative", ["|Nope|...", "Not interested.", "Pass."]);
}