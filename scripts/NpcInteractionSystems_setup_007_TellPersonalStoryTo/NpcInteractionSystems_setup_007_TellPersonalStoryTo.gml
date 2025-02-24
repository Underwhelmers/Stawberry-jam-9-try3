function NpcInteractionSystems_setup_007_TellPersonalStoryTo() {
	NpcInteractionSystems.TellPersonalStoryTo = ecs_setup_system_player_npc_interaction(
        "tell personal story to {name}", 
        ["already_introduced", "name_is_known", "in_conversation", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            npc.trust += 5;
            npc.interact(0);
            scr_chat(entity.name, "tell_personal_story_to_response");
        }
    );
	
	new_word_variant("tell_personal_story_to_response", ["Ohh, really? :O", "Wow, no way!", "That's wild!"]);
}