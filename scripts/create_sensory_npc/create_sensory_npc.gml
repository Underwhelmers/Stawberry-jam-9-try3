function create_sensory_npc(_name, _location, _faction) {
    var npc = { id: get_new_entity_id() };
    StateComponents.types.is_npc.add_to(npc);
    StateComponents.types.identity.add_to(npc, _name, "A musky wanderer.");
    StateComponents.types.position.add_to(npc, _location);
    StateComponents.types.mood.add_to(npc, "happy", 0.7, "aroused", 0.5, 0);
    StateComponents.types.relationship.add_to(npc, global.player_entity, 0.5, 0.3, 0.8);
    StateComponents.types.faction.add_to(npc, _faction, "member", "libertine", 0.8);
    StateComponents.types.fetish.add_to(npc, ["roleplay"]);
    StateComponents.types.intimacy_history.add_to(npc);
    initialize_sensory_profile_for_npc(npc);
    return npc;
}