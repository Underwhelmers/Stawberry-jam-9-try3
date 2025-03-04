function ecs_setup_state_components() {
	
    // Core Entity Types
	
    
    StateComponents.types.is_body_part = new StateComponents("is_body_part");
    StateComponents.types.is_cavity = new StateComponents("is_cavity");
    StateComponents.types.is_phallus = new StateComponents("is_phallus");
    StateComponents.types.is_character = new StateComponents("is_character");
	
	
	StateComponents.types.have_shown_interest = new StateComponents("have_shown_interest");
	StateComponents.types.have_shown_arousal = new StateComponents("have_shown_arousal");
	
    // Location States
    StateComponents.types.is_bedchamber = new StateComponents("is_bedchamber", StateComponents.types.is_location);
    StateComponents.types.is_tavern_hall = new StateComponents("is_tavern_hall", StateComponents.types.is_location);
    StateComponents.types.is_private_nook = new StateComponents("is_private_nook", StateComponents.types.is_location);

    // Item States
    StateComponents.types.is_oil = new StateComponents("is_oil");
    StateComponents.types.is_rope = new StateComponents("is_rope");
    StateComponents.types.is_in_use = new StateComponents("is_in_use");
    StateComponents.types.is_in_inventory = new StateComponents("is_in_inventory");

    // Character Presence and Interaction States
    StateComponents.types.is_present = new StateComponents("is_present");
    StateComponents.types.has_talked = new StateComponents("has_talked", StateComponents.types.is_present);
    StateComponents.types.is_friendly = new StateComponents("is_friendly", StateComponents.types.has_talked);
    StateComponents.types.is_aroused = new StateComponents("is_aroused", StateComponents.types.is_present);
    StateComponents.types.is_intimate = new StateComponents("is_intimate", StateComponents.types.is_aroused);

    // Physical and Intimacy States
    StateComponents.types.is_naked = new StateComponents("is_naked", StateComponents.types.is_character);
    StateComponents.types.is_bound = new StateComponents("is_bound", StateComponents.types.is_character);
    StateComponents.types.is_embraced = new StateComponents("is_embraced", StateComponents.types.is_character);
    StateComponents.types.is_oiled = new StateComponents("is_oiled", StateComponents.types.is_character);
    StateComponents.types.is_penetrated = new StateComponents("is_penetrated", StateComponents.types.is_intimate);
    StateComponents.types.has_climaxed = new StateComponents("has_climaxed", StateComponents.types.is_intimate);

    // Cultural Interaction States
    StateComponents.types.has_danced = new StateComponents("has_danced", StateComponents.types.is_present);
    StateComponents.types.has_introduced = new StateComponents("has_introduced", StateComponents.types.is_present);
    StateComponents.types.has_shared_ritual = new StateComponents("has_shared_ritual", StateComponents.types.is_present);
    
	StateComponents.types.is_exposed = new StateComponents("is_exposed");
	StateComponents.types.is_marked = new StateComponents("is_marked");
	StateComponents.types.name_known = new StateComponents("name_known");
	StateComponents.types.shares_pc_location = new StateComponents("shares_pc_location");
	
    StateComponents.types.in_conversation = new StateComponents("in_conversation", StateComponents.types.is_present);

    // Fetish-Related States
    StateComponents.types.has_fetish_bondage      = new StateComponents("has_fetish_bondage");
    StateComponents.types.has_fetish_dominance    = new StateComponents("has_fetish_dominance");
    StateComponents.types.has_fetish_sensory_play = new StateComponents("has_fetish_sensory_play");

    // Description States with Custom add_to
    StateComponents.types.basic_description = new StateComponents("basic_description");
    StateComponents.types.basic_description.add_to = method(
        StateComponents.types.basic_description,
        function(entity, string_value) {
            default_add(entity, string_value);
        }
    );
    StateComponents.types.detailed_description = new StateComponents("detailed_description");
    StateComponents.types.detailed_description.add_to = method(
        StateComponents.types.detailed_description,
        function(entity, string_value) {
            default_add(entity, string_value);
        }
    );

    // Relationship State with Numerical Value
    StateComponents.types.relationship_level = new StateComponents("relationship_level");
    StateComponents.types.relationship_level.add_to = method(
        StateComponents.types.relationship_level,
        function(entity, value) {
            default_add(entity, value); // Value could be an integer (e.g., 0-100)
        }
    );

    // Arousal Level with Numerical Value
    StateComponents.types.arousal_level = new StateComponents("arousal_level");
    StateComponents.types.arousal_level.add_to = method(
        StateComponents.types.arousal_level,
        function(entity, value) {
            default_add(entity, value); // e.g., 0-100 scale
        }
    );

    // Cultural Affinity State
    StateComponents.types.cultural_affinity = new StateComponents("cultural_affinity");
    StateComponents.types.cultural_affinity.add_to = method(
        StateComponents.types.cultural_affinity,
        function(entity, culture_name) {
            default_add(entity, culture_name); // e.g., "Tentacled Culture"
        }
    );
	
	
    StateComponents.types.name = new StateComponents("name");
	StateComponents.types.name.add_to = method(
        StateComponents.types.name,
        function(entity, string_value) {
            default_add(entity, string_value);
        }
    );
	

    StateComponents.types.location = new StateComponents("location");
	StateComponents.types.location.add_to = method(
        StateComponents.types.location,
        function(entity, location_value = undefined) {
            default_add(entity, location_value);
        }
    );
}