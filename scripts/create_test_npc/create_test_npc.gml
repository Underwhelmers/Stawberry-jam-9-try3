function create_test_npc(_name, _faction, _location) {
	var entities = obj_ecs_manager.entity_manager;
    var npc = entities.create_entity();
    StateComponents.types.is_npc.add_to(npc);
    StateComponents.types.identity.add_to(npc, _name, "A unique individual.");
    StateComponents.types.position.add_to(npc, _location);
    StateComponents.types.mood.add_to(npc,
        random_mood_state(),
        random_range(0.3, 0.8),
        random_desire(),
        random_proactivity(),
        random_jealousy_intensity()
    );
    StateComponents.types.relationship.add_to(npc,
        global.player_entity,
        random_affinity(),
        random_intimacy(),
        random_attraction(),
        random_jealousy(),
        random_jealousy_tendency()
    );
    StateComponents.types.fetish.add_to(npc, random_fetish());
    StateComponents.types.body_fluid.add_to(npc, {
        "sweat": random_fluid_intensity(),
        "saliva": random_fluid_intensity(),
        "semen": random_fluid_intensity(),
        "precum": random_fluid_intensity(),
        "vaginal_lubrication": random_fluid_intensity()
    });
    StateComponents.types.sensory_profile.add_to(npc,
        // Smell traits
        { "sweat": "salty, musky", "saliva": "neutral, faintly sweet", "semen": "bleachy, slightly metallic",
          "precum": "faint, musky", "vaginal_lubrication": "sweet, earthy" },
        // Taste traits
        { "sweat": "salty, slightly bitter", "saliva": "neutral, slightly sweet", "semen": "salty, mildly bitter",
          "precum": "salty, subtle", "vaginal_lubrication": "tangy, slightly sweet" },
        // Anal traits
        { smell: "earthy, musky", taste: "bitter, earthy" }
    );
    StateComponents.types.intimacy_history.add_to(npc);
    StateComponents.types.knowledge.add_to(npc);
    StateComponents.types.faction.add_to(npc,
        _faction,
        choose("member", "member", "leader"), // Leader is rarer
        random_cultural_norm(),
        random_social_openness()
    );
    initialize_hygiene_for_npc(npc, _faction);

    return npc;
}