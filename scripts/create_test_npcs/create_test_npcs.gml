function create_test_npcs(_locations) {
    var npcs = [];
    
    // Village Square NPCs
    npcs[array_length(npcs)] = create_test_npc("Ella", "villagers", _locations[0]);
    npcs[array_length(npcs)] = create_test_npc("Finn", "villagers", _locations[0]);
    npcs[array_length(npcs)] = create_test_npc("Gara", "merchants", _locations[0]);

    // Bandit Camp NPCs
    npcs[array_length(npcs)] = create_test_npc("Ruk", "bandits", _locations[1]);
    npcs[array_length(npcs)] = create_test_npc("Syl", "bandits", _locations[1]);
    npcs[array_length(npcs)] = create_test_npc("Taz", "bandits", _locations[1]);

    // Bathhouse NPCs
    npcs[array_length(npcs)] = create_test_npc("Mira", "merchants", _locations[2]);
    npcs[array_length(npcs)] = create_test_npc("Lior", "merchants", _locations[2]);

    return npcs;
}