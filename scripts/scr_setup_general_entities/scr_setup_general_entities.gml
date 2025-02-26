function scr_setup_general_entities() {
	var EManager = obj_ecs_manager.entity_manager;
	
    // --- Body Parts ---
    // Genital/Reproductive
    var pussy = EManager.create_entity();
    StateComponents.types[$ "name"].add_to(pussy, "pussy");
    StateComponents.types[$ "is_body_part"].add_to(pussy);
    StateComponents.types[$ "is_cavity"].add_to(pussy);
    StateComponents.types[$ "basic_description"].add_to(pussy, "A warm, inviting cavity.");
    StateComponents.types[$ "is_exposed"].add_to(pussy);

    var dick = EManager.create_entity();
    StateComponents.types[$ "name"].add_to(dick, "dick");
    StateComponents.types[$ "is_body_part"].add_to(dick);
    StateComponents.types[$ "is_phallus"].add_to(dick);
    StateComponents.types[$ "basic_description"].add_to(dick, "A firm, pulsing shaft.");
    StateComponents.types[$ "is_exposed"].add_to(dick);

    var anus = EManager.create_entity();
    StateComponents.types[$ "name"].add_to(anus, "anus");
    StateComponents.types[$ "is_body_part"].add_to(anus);
    StateComponents.types[$ "is_cavity"].add_to(anus);
    StateComponents.types[$ "basic_description"].add_to(anus, "A tight, puckered opening.");
    StateComponents.types[$ "is_exposed"].add_to(anus);

    // Chest/Torso
    var breasts = EManager.create_entity();
    StateComponents.types[$ "name"].add_to(breasts, "breasts");
    StateComponents.types[$ "is_body_part"].add_to(breasts);
    StateComponents.types[$ "basic_description"].add_to(breasts, "Soft, rounded mounds.");
    StateComponents.types[$ "is_exposed"].add_to(breasts);

    var chest = EManager.create_entity();
    StateComponents.types[$ "name"].add_to(chest, "chest");
    StateComponents.types[$ "is_body_part"].add_to(chest);
    StateComponents.types[$ "basic_description"].add_to(chest, "A broad, toned expanse.");
    StateComponents.types[$ "is_exposed"].add_to(chest);

    var nipples = EManager.create_entity();
    StateComponents.types[$ "name"].add_to(nipples, "nipples");
    StateComponents.types[$ "is_body_part"].add_to(nipples);
    StateComponents.types[$ "basic_description"].add_to(nipples, "Small, sensitive buds.");
    StateComponents.types[$ "is_exposed"].add_to(nipples);

    // Limbs
    var hands = EManager.create_entity();
    StateComponents.types[$ "name"].add_to(hands, "hands");
    StateComponents.types[$ "is_body_part"].add_to(hands);
    StateComponents.types[$ "basic_description"].add_to(hands, "Nimble, dexterous fingers.");
    StateComponents.types[$ "is_exposed"].add_to(hands);

    var thighs = EManager.create_entity();
    StateComponents.types[$ "name"].add_to(thighs, "thighs");
    StateComponents.types[$ "is_body_part"].add_to(thighs);
    StateComponents.types[$ "basic_description"].add_to(thighs, "Thick, muscular curves.");
    StateComponents.types[$ "is_exposed"].add_to(thighs);

    var ass = EManager.create_entity();
    StateComponents.types[$ "name"].add_to(ass, "ass");
    StateComponents.types[$ "is_body_part"].add_to(ass);
    StateComponents.types[$ "is_cavity"].add_to(ass);
    StateComponents.types[$ "basic_description"].add_to(ass, "A firm, rounded backside.");
    StateComponents.types[$ "is_exposed"].add_to(ass);

    // Head/Face
    var lips = EManager.create_entity();
    StateComponents.types[$ "name"].add_to(lips, "lips");
    StateComponents.types[$ "is_body_part"].add_to(lips);
    StateComponents.types[$ "basic_description"].add_to(lips, "Soft, plump lips.");
    StateComponents.types[$ "is_exposed"].add_to(lips);

    var tongue = EManager.create_entity();
    StateComponents.types[$ "name"].add_to(tongue, "tongue");
    StateComponents.types[$ "is_body_part"].add_to(tongue);
    StateComponents.types[$ "basic_description"].add_to(tongue, "A wet, agile muscle.");
    StateComponents.types[$ "is_exposed"].add_to(tongue);

    var neck = EManager.create_entity();
    StateComponents.types[$ "name"].add_to(neck, "neck");
    StateComponents.types[$ "is_body_part"].add_to(neck);
    StateComponents.types[$ "basic_description"].add_to(neck, "A slender, sensitive column.");
    StateComponents.types[$ "is_exposed"].add_to(neck);

    // Species-Specific Features
    var tentacles = EManager.create_entity();
    StateComponents.types[$ "name"].add_to(tentacles, "tentacles");
    StateComponents.types[$ "is_body_part"].add_to(tentacles);
    StateComponents.types[$ "has_tentacles"].add_to(tentacles);
    StateComponents.types[$ "basic_description"].add_to(tentacles, "Slick, writhing tendrils.");
    StateComponents.types[$ "is_exposed"].add_to(tentacles);

    var wings = EManager.create_entity();
    StateComponents.types[$ "name"].add_to(wings, "wings");
    StateComponents.types[$ "is_body_part"].add_to(wings);
    StateComponents.types[$ "has_wings"].add_to(wings);
    StateComponents.types[$ "basic_description"].add_to(wings, "Feathered, majestic wings.");
    StateComponents.types[$ "is_exposed"].add_to(wings);

    var horns = EManager.create_entity();
    StateComponents.types[$ "name"].add_to(horns, "horns");
    StateComponents.types[$ "is_body_part"].add_to(horns);
    StateComponents.types[$ "has_horns"].add_to(horns);
    StateComponents.types[$ "basic_description"].add_to(horns, "Curved, imposing horns.");
    StateComponents.types[$ "is_exposed"].add_to(horns);

    var tail = EManager.create_entity();
    StateComponents.types[$ "name"].add_to(tail, "tail");
    StateComponents.types[$ "is_body_part"].add_to(tail);
    StateComponents.types[$ "basic_description"].add_to(tail, "A long, sinuous appendage.");
    StateComponents.types[$ "is_exposed"].add_to(tail);


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