function NpcInteractionSystems_setup_004_AskAboutTraitTo() {
	NpcInteractionSystems.AskAboutTraitTo = ecs_setup_system_player_npc_interaction(
        "ask about trait to {name}", 
        ["in_conversation", "relationship_with_pc", "name_is_known", "traits"], 
        function(entity, args) {
            scr_chat(entity.name, "ask_about_trait_to_response", ds_list_choose(entity.traits).name);
        }
    );
	
	new_word_variant("ask_about_trait_to_response", [
		"I am '{0}'.", 
		"People say I'm '{0}'.", 
	]);
}