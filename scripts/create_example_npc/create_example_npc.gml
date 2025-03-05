function create_example_npc(_name, _location) {
    var npc = { id: get_new_entity_id() };
    StateComponents.types.is_npc.add_to(npc);
    StateComponents.types.identity.add_to(npc, _name, "A curious wanderer.");
    StateComponents.types.position.add_to(npc, _location);
    StateComponents.types.mood.add_to(npc, "neutral", 0.5);
    StateComponents.types.relationship.add_to(npc, global.player_entity, random_range(-0.2, 0.2));
    StateComponents.types.knowledge.add_to(npc);
    npc.knowledge.add_fact(npc, "The forest is dangerous at night!");
    return npc;
}