function create_example_npc_with_fetish(_name, _location, _faction) {
    var npc = { id: get_new_entity_id() };
    StateComponents.types.is_npc.add_to(npc);
    StateComponents.types.identity.add_to(npc, _name, "A curious wanderer.");
    StateComponents.types.position.add_to(npc, _location);
    StateComponents.types.mood.add_to(npc, "neutral", 0.5, "neutral");
    StateComponents.types.relationship.add_to(npc, global.player_entity, random_range(-0.2, 0.2));
    StateComponents.types.faction.add_to(npc, _faction, "member", (_faction == "villagers") ? "conservative" : "libertine");
    StateComponents.types.fetish.add_to(npc, ["roleplay"]);
    StateComponents.types.intimacy_history.add_to(npc);
    return npc;
}