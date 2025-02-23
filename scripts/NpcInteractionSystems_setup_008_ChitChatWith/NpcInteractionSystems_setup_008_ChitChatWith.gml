function NpcInteractionSystems_setup_008_ChitChatWith() {
	NpcInteractionSystems.ChitChatWith = ecs_setup_system_player_action(
        "tell lots of nothing to",
        ["already_introduced", "name_is_known", "in_conversation", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var resp = scr_apply_traits(entity, "on_interaction", { behaviour_is_overriten: false });
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
			
            entity.relationship_with_pc.interact(5);
			
            scr_chat(entity.name, "Mhm, mhm.");
        }
    );
}