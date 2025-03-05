function initialize_hygiene_for_npc(_npc, _faction) {
    var base_cleanliness = 0.5; // Default: moderately clean
    var fluid_modifiers = {
        "sweat": 0, "saliva": 0, "semen": 0, "precum": 0, "vaginal_lubrication": 0
    };
    var body_part_modifiers = {
        "anal": 0 // Default: no specific modifier
    };

    // Adjust based on faction or role
    if (_faction == "bandits") {
        base_cleanliness = 0.3; // Bandits are dirtier
        body_part_modifiers.anal = -0.2; // Less hygienic anal region
    } else if (_faction == "merchants") {
        base_cleanliness = 0.7; // Merchants are cleaner
        body_part_modifiers.anal = 0.1; // More hygienic anal region
    }

    StateComponents.types.hygiene.add_to(_npc, base_cleanliness, fluid_modifiers, body_part_modifiers);
}