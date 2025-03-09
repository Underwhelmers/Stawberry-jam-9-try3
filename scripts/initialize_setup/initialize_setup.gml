function initialize_setup() {
	var entities = obj_ecs_manager.entity_manager;
	
	
	var ghindex = 0;
	global.house = [];
	
	#region Grand entrance
		var entrance = make_new_room("Grand entrance", "A big room beautifully ornamented.");
		var chandelier = make_new_item("Crystal chandelier", "The most elegant light source, hanging from the ceiling.");
		var statue = make_new_item("Marble statue", "A statue of the ancestor responsable of building this mantion.");
		var entrance_rug = make_new_item("Ornate rug", "A finely crafted rug that has portraied important events of the family history.");
		place_in_room(entrance, [entrance, chandelier, statue, entrance_rug]);
		Components.types.fragility.add_to(chandelier, .9);
		Components.types.is_floating.add_to(chandelier);
		global.house[ghindex++] = entrance;
	#endregion
	
	#region Dining hall
		var dinning_hall = make_new_room("Dining hall", "A spacous hall with tables to acomodte the 20 patreon.");
		var long_table = make_new_item("Long oak table", "A long and finely sculpted table made of oak.");
		var candelabra = make_new_item("Silver candelabra", "Across the table multiple candelabra light the room.");
		var chairs = make_new_item("Velvet chairs", "On the sides of the table there are in total 20 chairs for the guests and one on each head there is 1 for the host.");
		place_in_room(dinning_hall, [dinning_hall, long_table, candelabra, chairs]);
		global.house[ghindex++] = dinning_hall;
	#endregion
	
	#region Library
		var library_desc = make_new_room("Library", "A quiet room filled with knowledge and ancient tomes.");
        var bookshelf = make_new_item("Bookshelf", "A tall oak bookshelf filled with leather-bound books.");
        var reading_desk = make_new_item("Reading Desk", "A sturdy desk for studying the collected works.");
        var globe = make_new_item("Globe", "An ornate globe showing the known world.");
        place_in_room(library_desc, [library_desc, bookshelf, reading_desk, globe]);
		global.house[ghindex++] = library_desc;
	#endregion
	
    #region Master Bedroom
        var bedroom_desc = make_new_room("Master Bedroom", "A luxurious chamber for the noble family.");
        var four_poster_bed = make_new_item("Four-Poster Bed", "A grand bed with velvet curtains and fine carvings.");
        var silk_curtains = make_new_item("Silk Curtains", "Elegant curtains that shimmer in the light.");
        var wardrobe = make_new_item("Wardrobe", "A large wardrobe for the noble's fine garments.");
        place_in_room(bedroom_desc, [bedroom_desc, four_poster_bed, silk_curtains, wardrobe]);
		global.house[ghindex++] = bedroom_desc;
    #endregion

	#region Guest Chambers
        var guest_room_desc = make_new_room("Guest Chambers", "A comfortable room for visiting dignitaries.");
        var guest_bed = make_new_item("Guest Bed", "A well-made bed for important visitors.");
        var small_table = make_new_item("Small Table", "A modest table for the guest's belongings.");
        place_in_room(guest_room_desc, [guest_room_desc, guest_bed, small_table]);
		global.house[ghindex++] = guest_room_desc;
    #endregion
	
	#region Kitchen
        var kitchen_desc = make_new_room("Kitchen", "A busy space where meals are prepared for the household.");
        var cooking_stove = make_new_item("Cooking Stove", "A sturdy stove for preparing lavish feasts.");
        var prep_table = make_new_item("Preparation Table", "A wide table for food preparation.");
        var utensil_rack = make_new_item("Utensil Rack", "A rack holding various cooking implements.");
        place_in_room(kitchen_desc, [kitchen_desc, cooking_stove, prep_table, utensil_rack]);
		global.house[ghindex++] = kitchen_desc;
    #endregion
	
	
	global.house = array_shuffle(global.house);
	for (var i = 0; i < ghindex - 1; i++) {
	    make_new_room_connection(global.house[i], global.house[i + 1]);
	}
	
	//for (var i = 0, count = irandom(ghindex); i < count; i ++) {
	//	var otheri = irandom(count-1);
	//	while(otheri == i) { otheri = irandom(count-1); }
	//	make_new_room_connection(global.house[i],global.house[otheri]);
	//};
	
	
	global.player = make_new_character("Anon", entrance);
	Components.types.is_player.add_to(global.player);
	Components.types.is_npc.remove_from(global.player);
	
	var guest_count = 1;
	global.guests = array_create(guest_count);
	for(var i = 0; i < guest_count; i++) {
		global.guests[i] = make_new_character("Faly", 
			array_choose(global.house)
		);
	}
	
	Components.types.sharing_room.update();
}