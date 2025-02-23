function NpcInteractionSystems_setup_010_AskToSitTogetherWith() {
	NpcInteractionSystems.AskToSitTogetherWith = ecs_setup_system_player_action(
        "ask to sit together with", 
        ["already_introduced", "!sitting_together", "in_conversation", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var resp = scr_apply_traits(entity, "on_interaction", { behaviour_is_overriten: false });
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
            var npc = entity.relationship_with_pc;
            if (npc.check_trust(10)) {
                ecs_change_state_with_comps(entity, [], ["sitting_together"]);
                scr_chat(entity.name, "Come here :D.");
            } else {
                scr_chat(entity.name, "Nope...");
            }
        }
    );
}