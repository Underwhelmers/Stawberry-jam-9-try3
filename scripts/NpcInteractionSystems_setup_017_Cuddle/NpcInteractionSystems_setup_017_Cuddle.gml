function NpcInteractionSystems_setup_017_Cuddle(){
	NpcInteractionSystems.Cuddle = ecs_setup_system_player_npc_interaction(
        "cuddle with", 
        ["alone_with_pc", "reached_climax", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            scr_chat(entity.name, global.chat_texts[? "cuddle_with_response"]);
            npc.trust += 20;
            npc.interact(10);
            ecs_change_state_with_comps(entity, ["reached_climax"], ["is_satisfied"]);
        }
    );
}