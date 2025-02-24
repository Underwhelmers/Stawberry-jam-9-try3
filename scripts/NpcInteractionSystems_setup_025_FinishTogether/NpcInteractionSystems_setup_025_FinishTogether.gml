function NpcInteractionSystems_setup_025_FinishTogether() {
    NpcInteractionSystems.FinishTogether = ecs_setup_system_player_npc_interaction(
        "finish together with {name}",
        ["interested_sexualy", "is_aroused", "banging_state", "relationship_with_pc", "traits"],
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            var banging = entity.banging_state;
            if (npc.check_all(undefined, 70, 90, 60, 80)) {
                if (banging.position == "inside") {
                    scr_chat(entity.name, "finish_together_inside_" + banging.cavity);
                } else {
                    scr_chat(entity.name, "finish_together_outside");
                }
				
				StateComponents.types[$ "is_banging"].remove_from(entity);
				StateComponents.types[$ "reached_climax"].add_to(entity);
				
                npc.attraction = 30;
                npc.desire = 20;
                npc.stimulation = 0;
                npc.trust += 15;
				
                banging.position = "outside";
                banging.cavity = "none";
                banging.intensity = 0;
            } else {
                scr_chat(entity.name, "finish_together_negative");
                npc.interact(-5);
            }
        }
    );
	
    new_word_variant("finish_together_inside_front", ["|Yes|, fill me |now|!", "|Now|, deep in front!", "Oh, |yes| inside me!"]);
    new_word_variant("finish_together_inside_rear", ["|Now|-deep inside!", "|Yes|, fill my back!", "Oh, |tight| finish!"]);
    new_word_variant("finish_together_outside", ["Oh, |yes|-together!", "|Now|, side by side!", "|Yes|, with me!"]);
    new_word_variant("finish_together_negative", ["I'm not there yet.", "Not |now|, wait!", "Hold on, almost!"]);
}