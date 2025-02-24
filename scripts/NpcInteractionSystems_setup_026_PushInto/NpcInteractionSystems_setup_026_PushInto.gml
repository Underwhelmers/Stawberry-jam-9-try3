function NpcInteractionSystems_setup_026_PushInto() {
    NpcInteractionSystems.PushInto = ecs_setup_system_player_npc_interaction(
        "push into",
        ["npc_is_ready_for_intimacy", "is_aroused", "relationship_with_pc", "traits", "banging_state"],
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            var banging = entity.banging_state;
            if (banging.position == "inside") return; // Already inside
			
			if (banging.cavity == "none") {
				scr_chat(entity.name, global.chat_texts[? "push_into_choose_cavity_first"]);
			}
			
			
            if (npc.check_all(undefined, 50, 70, 40)) {
                banging.position = "inside";
                npc.stimulation += 20;
                npc.desire += 10;
                banging.intensity = min(banging.intensity + 15, 100);
                scr_chat(entity.name, global.chat_texts[? "push_into_" + banging.cavity + "_positive"]);
				ecs_change_state_with_comps(entity,[],["is_banging"]);
            } else {
                scr_chat(entity.name, global.chat_texts[? "push_into_negative"]);
                npc.interact(-10);
            }
        }
    );
}