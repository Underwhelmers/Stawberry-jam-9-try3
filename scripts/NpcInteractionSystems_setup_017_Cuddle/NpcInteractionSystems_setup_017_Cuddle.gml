function NpcInteractionSystems_setup_017_Cuddle(){
	NpcInteractionSystems.Cuddle = ecs_setup_system_player_npc_interaction(
        "cuddle with {name}", 
        ["alone_with_pc", "reached_climax", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            scr_chat(entity.name, "cuddle_with_response");
            npc.trust += 20;
            npc.interact(10);
			
			StateComponents.types[$ "reached_climax"].remove_from(entity);
			StateComponents.types[$ "is_satisfied"].add_to(entity);
        }
    );
	
    new_word_variant("cuddle_with_response", ["That was... wow. Hold me.", "Oh, good. Cuddle me.", "Amazing... Hold me."]);
}