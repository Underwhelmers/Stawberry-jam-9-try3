function NpcInteractionSystems_setup_006_GiveGiftTo() {
	NpcInteractionSystems.GiveGiftTo = ecs_setup_system_player_action(
        "give gift to", 
        ["already_introduced", "in_conversation", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var resp = scr_apply_traits(entity, "on_interaction", { behaviour_is_overriten: false });
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
            var npc = entity.relationship_with_pc;
            if (random(100) < 75) {
                npc.trust += 5;
                npc.interact(15);
                scr_chat(entity.name, "Thanks <3");
            } else {
                npc.interact(5);
                scr_inform("Miss.");
                scr_chat(entity.name, "Thanks? ._.");
            }
        }
    );
}