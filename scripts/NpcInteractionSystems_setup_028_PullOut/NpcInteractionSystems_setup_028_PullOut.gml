function NpcInteractionSystems_setup_028_PullOut() {
    NpcInteractionSystems.PullOut = ecs_setup_system_player_npc_interaction(
        "pull out of {name}",
        ["interested_sexualy", "is_aroused", "banging_state", "relationship_with_pc", "traits"],
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            if (npc.check_trust(50)) {
				StateComponents[$ "banging_state"].remove_from(entity);
				
                scr_chat(entity.name, "pull_out_positive");
            } else {
                scr_chat(entity.name, "pull_out_negative");
                npc.interact(-5);
            }
        }
    );
	
    new_word_variant("pull_out_positive", ["Oh, good timing!", "|Yes|, perfect |pull|!", "Nice move out!"]);
    new_word_variant("pull_out_negative", ["|No|, not yet!", "Stay, please!", "|No|, keep it in!"]);
}