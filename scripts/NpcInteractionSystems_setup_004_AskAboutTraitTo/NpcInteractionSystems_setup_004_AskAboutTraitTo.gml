function NpcInteractionSystems_setup_004_AskAboutTraitTo() {
	NpcInteractionSystems.AskAboutTraitTo = ecs_setup_system_player_npc_interaction(
        "ask about trait to", 
        ["in_conversation", "relationship_with_pc", "name_is_known", "traits"], 
        function(entity, args) {
            scr_chat(entity.name, string(global.chat_texts[? "ask_about_trait_to_response"],ds_list_choose(entity.traits).name));
        }
    );
}