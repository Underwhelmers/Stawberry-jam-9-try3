function initialize_sensory_profile_for_npc(_npc) {
    StateComponents.types.body_fluid.add_to(_npc, {
        "sweat": 0.2, "saliva": 0.1, "semen": 0, "precum": 0, "vaginal_lubrication": 0
    });
    StateComponents.types.sensory_profile.add_to(_npc,
        // Smell traits
        { "sweat": "salty, musky", "saliva": "neutral, faintly sweet", "semen": "bleachy, slightly metallic",
          "precum": "faint, musky", "vaginal_lubrication": "sweet, earthy" },
        // Taste traits
        { "sweat": "salty, slightly bitter", "saliva": "neutral, slightly sweet", "semen": "salty, mildly bitter",
          "precum": "salty, subtle", "vaginal_lubrication": "tangy, slightly sweet" },
        // Anal traits
        { smell: "earthy, musky", taste: "bitter, earthy" }
    );
}