function generate_procedural_entity() {
    // Generate random attributes
    var species = array_choose(CharacterSpecies.all_instances);
    var gender  = array_choose(species.genders);
	
    // Define pools for procedural generation
    var personality_pool = ["shy", "dominant", "curious", "playful"];
    
    var fetish_pool = [
        { name: "has_fetish_sensory_play", desc: "sensory play" },
        { name: "has_fetish_bondage", desc: "bondage" },
        { name: "has_fetish_dominance", desc: "dominance" }
    ];
    
    var name_prefixes = ["Eld", "Syl", "Tor", "Zar"];
    var name_suffixes = ["ia", "en", "ak", "is"];

    var personality = personality_pool[irandom(array_length(personality_pool) - 1)];
    var fetish_count = irandom_range(1, 2); // 1-2 fetishes
    var fetishes = [];
    for (var i = 0; i < fetish_count; i++) {
        var fetish = fetish_pool[irandom(array_length(fetish_pool) - 1)];
        if (!array_contains(fetishes, fetish)) {
            array_push(fetishes, fetish);
        }
    }
    
    // Generate name and description
    var name = name_prefixes[irandom(array_length(name_prefixes) - 1)] + 
               name_suffixes[irandom(array_length(name_suffixes) - 1)];
    var short_desc = gender.as_adjective + " " + species.creature_description;
	//var short_desc = personality + " " + string_lower(species.creature_description);

    // Create the entity struct
	var entity = obj_ecs_manager.entity_manager.create_entity();
    entity.name = short_desc;
	entity.truename = name;
    entity.short_description = short_desc;
    entity.species = species.name;
    entity.personality = personality;
    entity.arousal_level = 0;
    entity.relationship_level = 0;

    // Apply base StateComponents
    StateComponents.types[$ "is_character"].add_to(entity);
    StateComponents.types[$ "is_present"].add_to(entity);
    StateComponents.types[$ "basic_description"].add_to(entity, name + ", a " + short_desc + " with unique traits.");
	StateComponents.types[$ "body"].add_to(entity, gender.body_parts);

    // Apply species-specific traits
    for (var i = 0; i < array_length(gender.extra_traits); i++) {
        StateComponents.types[$ gender.extra_traits[i]].add_to(entity);
    }

	/*
    // Apply random fetishes
    for (var i = 0; i < array_length(fetishes); i++) {
        StateComponents.types[$ fetishes[i].name].add_to(entity);
    }

    // Apply cultural affinity
    StateComponents.types[$ "cultural_affinity"].add_to(entity, species.culture);

    // Randomly add initial interaction states (e.g., 20% chance of has_talked)
    //if (random(1) < 0.2) {
    //    StateComponents.types[$ "has_talked"].add_to(entity);
    //}
	*/
	

    return entity;
}