function NpcInteractionSystems_setup_005_FlirtWith() {
	NpcInteractionSystems.FlirtWith = ecs_setup_system_player_action(
        "flirt with", 
        ["already_introduced", "in_conversation", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var resp = scr_apply_traits(entity, "on_interaction", {
				behaviour_is_overriten: false,
				final_chat: "Yes?... what else?",
			});
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
            var npc = entity.relationship_with_pc;
            if (npc.check_opinion(20)) {
                npc.attraction += 5;
                npc.desire += 3; // Flirting sparks desire
                npc.interact(10);
                scr_chat(entity.name, resp.final_chat);
            } else {
                scr_chat(entity.name, "Stay back please.");
                npc.interact(-5);
            }
        }
    );
}