function initialize_test_setup() {
    // Initialize faction manager
    initialize_test_faction_manager();

    // Create locations
    var locations = create_test_locations();

    // Create player (starting in Village Square)
    var player = create_test_player(locations[0]);

    // Create NPCs
    var npcs = create_test_npcs(locations);

    // Return all entities for reference
    return {
        player: player,
        npcs: npcs,
        locations: locations
    };
}


