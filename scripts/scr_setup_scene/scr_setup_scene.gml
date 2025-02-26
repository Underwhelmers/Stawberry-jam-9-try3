function scr_setup_scene(){
	// Define a character entity
    global.entity_lara = obj_ecs_manager.entity_manager.create_entity();
    global.entity_lara.name = "Lara";
    global.entity_lara.species = "Tentacled Beings";
    global.entity_lara.personality = "shy";
    StateComponents.types[$ "is_character"     ].add_to(global.entity_lara);
    StateComponents.types[$ "is_present"       ].add_to(global.entity_lara);
    StateComponents.types[$ "has_tentacles"    ].add_to(global.entity_lara);
    StateComponents.types[$ "basic_description"].add_to(global.entity_lara, "Lara, a shy tentacled being with slick appendages.");
    StateComponents.types[$ "has_fetish_sensory_play"].add_to(global.entity_lara);
	
    // Define an item entity
    global.entity_oil = obj_ecs_manager.entity_manager.create_entity();
	global.entity_oil.name = "Aromatic Oil";
    StateComponents.types[$ "is_item"          ].add_to(global.entity_oil);
    StateComponents.types[$ "is_in_inventory"  ].add_to(global.entity_oil);
    StateComponents.types[$ "basic_description"].add_to(global.entity_oil, "A vial of musky oil.");
}