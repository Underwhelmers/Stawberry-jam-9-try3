function scr_npc_initiate_intimacy(entity) {
    var npc = entity.relationship_with_pc;
    if (!entity.is_banging) {
        entity.banging_state.is_banging = true;
        entity.banging_state.position = "inside";
        entity.banging_state.cavity = choose("front", "rear");
        npc.stimulation += 20;
        scr_chat(entity.name, "npc_initiate_intimacy_positive");
		
		StateComponents.types[$ "is_banging"].add_to(entity);
    }
}