function create_test_player(_starting_location) {
	var entities = obj_ecs_manager.entity_manager;
	
    var player = entities.create_entity();
    StateComponents.types.is_player.add_to(player);
    StateComponents.types.identity.add_to(player, "Player", "A wandering adventurer.");
    StateComponents.types.position.add_to(player, _starting_location);
    StateComponents.types.mood.add_to(player,
        random_mood_state(),
        random_range(0.3, 0.8),
        random_desire(),
        random_proactivity(),
        random_jealousy_intensity()
    );
    StateComponents.types.fetish.add_to(player, random_fetish());
    StateComponents.types.body_fluid.add_to(player, {
        "sweat": random_fluid_intensity(),
        "saliva": random_fluid_intensity(),
        "semen": random_fluid_intensity(),
        "precum": random_fluid_intensity(),
        "vaginal_lubrication": random_fluid_intensity()
    });
    StateComponents.types.sensory_profile.add_to(player,
        // Smell traits
        { "sweat": "salty, musky", "saliva": "neutral, faintly sweet", "semen": "bleachy, slightly metallic",
          "precum": "faint, musky", "vaginal_lubrication": "sweet, earthy" },
        // Taste traits
        { "sweat": "salty, slightly bitter", "saliva": "neutral, slightly sweet", "semen": "salty, mildly bitter",
          "precum": "salty, subtle", "vaginal_lubrication": "tangy, slightly sweet" },
        // Anal traits
        { smell: "earthy, musky", taste: "bitter, earthy" }
    );
    StateComponents.types.intimacy_history.add_to(player);
    StateComponents.types.knowledge.add_to(player);
    StateComponents.types.hygiene.add_to(player,
        random_cleanliness(),
        { "sweat": 0, "saliva": 0, "semen": 0, "precum": 0, "vaginal_lubrication": 0 },
        { "anal": 0 }
    );

    global.player_entity = player;
    return player;
}