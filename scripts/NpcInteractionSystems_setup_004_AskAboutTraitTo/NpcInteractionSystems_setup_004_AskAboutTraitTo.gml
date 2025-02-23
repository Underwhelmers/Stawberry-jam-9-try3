function NpcInteractionSystems_setup_004_AskAboutTraitTo() {
	NpcInteractionSystems.AskAboutTraitTo = ecs_setup_system_player_action(
        "ask about trait to", 
        ["in_conversation", "relationship_with_pc", "name_is_known", "traits"], 
        function(entity, args) {
            var resp = scr_apply_traits(entity, "on_interaction", { behaviour_is_overriten: false });
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
			
            scr_chat(entity.name, string("I am '{0}'.",entity.traits[|0].name));
        }
    );
}