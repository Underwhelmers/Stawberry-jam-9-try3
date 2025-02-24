function NpcInteractionSystems_setup_026_PushInto() {
    NpcInteractionSystems.PushInto = ecs_setup_system_player_npc_interaction(
        "push into {name}",
        ["interested_sexualy", "is_aroused", "relationship_with_pc", "traits", "banging_state"],
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            var banging = entity.banging_state;
            if (banging.position == "inside") return; // Already inside
			
			if (banging.cavity == "none") {
				scr_chat(entity.name, "push_into_choose_cavity_first");
				return;
			}
			
			
            if (npc.check_all(undefined, 50, 70, 40)) {
                banging.position = "inside";
                npc.stimulation += 20;
                npc.desire += 10;
                banging.intensity = min(banging.intensity + 15, 100);
                scr_chat(entity.name, "push_into_" + banging.cavity + "_positive");
				
				StateComponents[$ "is_banging"].add_to(entity);
            } else {
                scr_chat(entity.name, "push_into_negative");
                npc.interact(-10);
            }
        }
    );
	
    new_word_variant("push_into_front_positive", ["Oh, |yes|-there!", "|Mmm|, right in front!", "Oh, good spot!"]);
    new_word_variant("push_into_rear_positive", ["Oh, that's |tight|!", "|Yes|, so snug!", "Oh, |tight| back there!"]);
    new_word_variant("push_into_negative", ["Not yet.", "Wait please.", "|No|, not |now|."]);
    new_word_variant("push_into_choose_cavity_first", ["|Where|?", "Which spot?", "Pick one!"]);
}