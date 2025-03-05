function create_faction_example() {
    var location = { contents: new List() };
    var bandit = { id: get_new_entity_id() };
    StateComponents.types.is_npc.add_to(bandit);
    StateComponents.types.identity.add_to(bandit, "Gruff Bandit", "A rough-looking outlaw.");
    StateComponents.types.position.add_to(bandit, location);
    StateComponents.types.faction.add_to(bandit, "bandits", "member");

    var villager = { id: get_new_entity_id() };
    StateComponents.types.is_npc.add_to(villager);
    StateComponents.types.identity.add_to(villager, "Timid Villager", "A nervous farmer.");
    StateComponents.types.position.add_to(villager, location);
    StateComponents.types.faction.add_to(villager, "villagers", "member");
}