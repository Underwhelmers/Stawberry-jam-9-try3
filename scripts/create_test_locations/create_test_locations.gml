function create_test_locations() {
	var entities = obj_ecs_manager.entity_manager;
    var locations = [];
    
	
    // Location 1: Village Square (public, mixed faction presence)
    var village_square = entities.create_entity();
	village_square.name = "Village Square";
    StateComponents.types.is_location.add_to(village_square);
    StateComponents.types.identity.add_to(village_square, "Village Square", "A bustling public square.");
    StateComponents.types.contents.add_to(village_square);
    StateComponents.types.faction.add_to(village_square, "villagers", "neutral", "neutral", 0.5);
    locations[0] = village_square;

    // Location 2: Bandit Camp (private, bandit-controlled)
    var bandit_camp = entities.create_entity();
	bandit_camp.name = "Bandit Camp";
    StateComponents.types.is_location.add_to(bandit_camp);
    StateComponents.types.identity.add_to(bandit_camp, "Bandit Camp", "A rough encampment in the woods.");
    StateComponents.types.contents.add_to(bandit_camp);
    StateComponents.types.faction.add_to(bandit_camp, "bandits", "neutral", "libertine", 0.7);
    locations[1] = bandit_camp;

    // Location 3: Merchant’s Bathhouse (private, improves hygiene)
    var bathhouse = entities.create_entity();
	bathhouse.name = "Merchant’s Bathhouse" ;
    StateComponents.types.is_location.add_to(bathhouse);
    StateComponents.types.identity.add_to(bathhouse, "Merchant’s Bathhouse", "A luxurious bathing spot.");
    StateComponents.types.contents.add_to(bathhouse);
    StateComponents.types.faction.add_to(bathhouse, "merchants", "neutral", "conservative", 0.3);
    locations[2] = bathhouse;

    return locations;
}