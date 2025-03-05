function initialize_test_faction_manager() {
    global.faction_manager = {
        factions: {},
        add_faction: function(_faction_name, _default_reputation = 0) {
            factions[$ _faction_name] = {
                reputation: {},
                default_reputation: _default_reputation
            };
        },
        set_faction_relation: function(_faction1, _faction2, _value) {
            if (!struct_exists(factions, _faction1) || !struct_exists(factions, _faction2)) return;
            factions[$ _faction1].reputation[$ _faction2] = clamp(_value, -1, 1);
        },
        get_faction_relation: function(_faction1, _faction2) {
            if (!struct_exists(factions, _faction1) || !struct_exists(factions[$ _faction1].reputation, _faction2)) return 0;
            return factions[$ _faction1].reputation[$ _faction2];
        }
    };

    global.faction_manager.add_faction("bandits", -0.2);
    global.faction_manager.add_faction("villagers", 0.3);
    global.faction_manager.add_faction("merchants", 0.1);
    global.faction_manager.set_faction_relation("bandits", "villagers", -0.8);
    global.faction_manager.set_faction_relation("merchants", "villagers", 0.5);
    global.faction_manager.set_faction_relation("bandits", "merchants", -0.4);
}