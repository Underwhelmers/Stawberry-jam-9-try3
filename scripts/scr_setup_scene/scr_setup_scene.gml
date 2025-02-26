function scr_setup_scene(){
	
	
	// Player entity
    global.player_entity = {
        name: "Player",
        short_description: "a curious adventurer",
        species: "Human",
        personality: "curious",
        arousal_level: 0,
        relationships: ds_map_create(),
        relationship_types: ds_map_create()
    };

    // Generate procedural characters
    global.entity_char1 = generate_procedural_entity();
    global.entity_char2 = generate_procedural_entity();

    global.entities = ds_map_create();
    //ds_map_add(global.entities, global.player_entity.name, global.player_entity);
    ds_map_add(global.entities, global.entity_char1.name, global.entity_char1);
    ds_map_add(global.entities, global.entity_char2.name, global.entity_char2);

    // Item: Silk Rope
    global.entity_rope = {
        name: "Silk Rope",
        short_description: "a silken cord"
    };
    StateComponents.types[$ "is_item"].add_to(global.entity_rope);
    StateComponents.types[$ "is_rope"].add_to(global.entity_rope);
    StateComponents.types[$ "is_in_inventory"].add_to(global.entity_rope);

}