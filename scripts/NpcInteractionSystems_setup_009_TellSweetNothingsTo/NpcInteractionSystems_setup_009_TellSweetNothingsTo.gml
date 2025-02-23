function NpcInteractionSystems_setup_009_TellSweetNothingsTo() {
	NpcInteractionSystems.TellSweetNothingsTo = ecs_setup_system_player_action(
        "tell sweet nothings to", 
        ["already_introduced", "name_is_known", "in_conversation", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var resp = scr_apply_traits(entity, "on_interaction", { behaviour_is_overriten: false });
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
            var npc = entity.relationship_with_pc;
            npc.attraction += 2;
            npc.desire += 1; // Subtle intimacy boost
            npc.interact(0);
            scr_chat(entity.name, "Aww <3");
        }
    );
}