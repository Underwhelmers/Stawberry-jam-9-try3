function NpcInteractionSystems_setup_023_PullCloser(){
	NpcInteractionSystems.PullCloser = ecs_setup_system_player_npc_interaction(
        "pull closer", 
        ["npc_is_ready_for_intimacy", "is_aroused", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            if (npc.check_all(undefined, 50, 70, 40)) { // Requires desire
                npc.attraction += 10;
                npc.trust += 5;
                npc.stimulation += 15;
                scr_chat(entity.name, global.chat_texts[? "pull_closer_positive"]);
            } else {
                scr_chat(entity.name, global.chat_texts[? "pull_closer_negative"]);
                npc.interact(-10);
            }
        }
    );
}