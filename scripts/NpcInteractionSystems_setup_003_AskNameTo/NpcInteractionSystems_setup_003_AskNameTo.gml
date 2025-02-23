function NpcInteractionSystems_setup_003_AskNameTo() {
	NpcInteractionSystems.AskNameTo = ecs_setup_system_player_action(
        "ask name to", 
        ["in_conversation", "relationship_with_pc", "traits", "!name_is_known"], 
        function(entity, args) {
            // Trigger traits modifications for action
			var resp = scr_apply_traits(entity, "on_interaction", { behaviour_is_overriten: false });
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
			
			// Effect: Name is revealed.
            entity.name = entity.truename;
			entity.relationship_with_pc.interact(3);
            ecs_change_state_with_comps(entity, [], ["name_is_known"]);
			
			// Give feedback to player
            scr_chat(entity.name, string("My name? It's {0}.", entity.name));
        }
    );
}