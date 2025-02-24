function NpcInteractionSystems_setup_019_Compliment(){
	NpcInteractionSystems.Compliment = ecs_setup_system_player_npc_interaction(
        "give compliment to {name}", 
        ["already_introduced", "in_conversation", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            npc.trust += 5;
            npc.attraction += 3;
            npc.interact(5);
            scr_chat(entity.name, "give_compliment_to_response");
        }
    );
	
    new_word_variant("give_compliment_to_response", ["Thanks, that's sweet.", "Aw, nice of you.", "Thank you, so kind!"]);
}