function house_generation_data() {
	var room_types = [
        ["grand_entrance", "Grand Entrance", "A big room beautifully ornamented"],
        ["dining_hall", "Dining Hall", "A spacious hall for feasts"],
        ["library", "Library", "A quiet room filled with knowledge"],
        ["master_bedroom", "Master Bedroom", "A luxurious chamber for the noble family"],
        ["guest_chambers", "Guest Chambers", "A comfortable room for visitors"],
        ["kitchen", "Kitchen", "A busy space for meal preparation"]
    ];
    
    var item_pools = {
        grand_entrance: [
            ["Crystal Chandelier", "An elegant light source hanging from the ceiling", ["fragility", 0.9], ["is_floating"]],
            ["Marble Statue", "A statue of a family ancestor"],
            ["Ornate Rug", "A finely crafted rug depicting family history", ["checks", [
                "You examine the ornate rug. It's woven with intricate patterns of gold and crimson.",
                "The edges are frayed, suggesting years of use.",
                "You kneel and feel the fabric—soft, with a faint musty smell."
            ]]]
        ],
        dining_hall: [
            ["Long Oak Table", "A finely sculpted table made of oak"],
            ["Silver Candelabra", "Lights the room with a warm glow"],
            ["Velvet Chairs", "20 chairs for guests, plus 2 for hosts"]
        ],
        library: [
            ["Bookshelf", "A tall oak bookshelf with leather-bound books"],
            ["Reading Desk", "A sturdy desk for studying"],
            ["Globe", "An ornate globe of the known world"]
        ],
        master_bedroom: [
            ["Four-Poster Bed", "A grand bed with velvet curtains"],
            ["Silk Curtains", "Elegant curtains that shimmer"],
            ["Wardrobe", "A large wardrobe for fine garments"]
        ],
        guest_chambers: [
            ["Guest Bed", "A well-made bed for visitors"],
            ["Small Table", "A modest table for belongings"]
        ],
        kitchen: [
            ["Cooking Stove", "A sturdy stove for feasts"],
            ["Preparation Table", "A wide table for food prep"],
            ["Utensil Rack", "Holds various cooking implements"]
        ]
    };
	
	return [room_types, item_pools]
}