function scr_setup_general_entities() {
	var EManager = obj_ecs_manager.entity_manager;
    // --- Items ---
    // Aromatic Oil
    var oil = EManager.create_entity();
    StateComponents.types[$ "name"].add_to(oil, "Aromatic Oil");
    StateComponents.types[$ "is_item"].add_to(oil);
    StateComponents.types[$ "is_in_inventory"].add_to(oil);
    StateComponents.types[$ "basic_description"].add_to(oil, "A musky vial of fragrant oil.");

    // Silk Rope
    var rope = EManager.create_entity();
    StateComponents.types[$ "name"].add_to(rope, "Silk Rope");
    StateComponents.types[$ "is_item"].add_to(rope);
    StateComponents.types[$ "is_rope"].add_to(rope);
    StateComponents.types[$ "is_in_inventory"].add_to(rope);
    StateComponents.types[$ "basic_description"].add_to(rope, "A silken cord for binding.");

    // Velvet Cloth
    var cloth = EManager.create_entity();
    StateComponents.types[$ "name"].add_to(cloth, "Velvet Cloth");
    StateComponents.types[$ "is_item"].add_to(cloth);
    StateComponents.types[$ "is_in_inventory"].add_to(cloth);
    StateComponents.types[$ "basic_description"].add_to(cloth, "A soft velvet cloth for cleaning or teasing.");

    // --- Locations ---
    // Bedchamber
    var bedchamber = EManager.create_entity();
    StateComponents.types[$ "name"].add_to(bedchamber, "Bedchamber");
    StateComponents.types[$ "is_location"].add_to(bedchamber);
    StateComponents.types[$ "is_bedchamber"].add_to(bedchamber);
    StateComponents.types[$ "basic_description"].add_to(bedchamber, "A plush room with a wide bed.");

    // Tavern Hall
    var tavern_hall = EManager.create_entity();
    StateComponents.types[$ "name"].add_to(tavern_hall, "Tavern Hall");
    StateComponents.types[$ "is_location"].add_to(tavern_hall);
    StateComponents.types[$ "is_tavern_hall"].add_to(tavern_hall);
    StateComponents.types[$ "basic_description"].add_to(tavern_hall, "A lively hall filled with revelers.");

    // Private Nook
    var private_nook = EManager.create_entity();
    StateComponents.types[$ "name"].add_to(private_nook, "Private Nook");
    StateComponents.types[$ "is_location"].add_to(private_nook);
    StateComponents.types[$ "is_private_nook"].add_to(private_nook);
    StateComponents.types[$ "basic_description"].add_to(private_nook, "A secluded corner draped in shadows.");
}


