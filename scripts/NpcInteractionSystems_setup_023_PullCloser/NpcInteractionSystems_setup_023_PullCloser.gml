function NpcInteractionSystems_setup_023_PullCloser(){
	NpcInteractionSystems.PullCloser = ecs_setup_system_player_npc_interaction(
        "pull closer {name}", 
        ["interested_sexualy", "is_aroused", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            if (npc.check_all(undefined, 50, 70, 40)) { // Requires desire
                npc.attraction += 10;
                npc.trust += 5;
                npc.stimulation += 15;
                scr_chat(entity.name, "pull_closer_positive");
            } else {
                scr_chat(entity.name, "pull_closer_negative");
                npc.interact(-10);
            }
        }
    );
	
    new_word_variant("pull_closer_positive", ["|Yes|, don't let go!", "Oh, |hold| me |tight|!", "|yes|, stay close!"]);
    new_word_variant("pull_closer_negative", ["Too close!", "Back off a bit!", "Not that |tight|!"]);
}