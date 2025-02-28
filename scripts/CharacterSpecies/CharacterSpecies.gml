function CharacterSpecies(_specie_name, _creature_desc, _genders) constructor {
	name = _specie_name;
	creature_description = _creature_desc;
	genders = _genders;
	
	static all_instances = [];
	array_push(all_instances,self);
}

function scr_setup_character_species() {
    // Winged Ones
    CharacterSpecies.WingedOnes = new CharacterSpecies(
        "Winged Ones",
        "winged creature",
        [new CharacterGender("female", "slender", [
            global.body_parts.beak,
            global.body_parts.chest,
            global.body_parts.wings,
            global.body_parts.ass,
            global.body_parts.cloeca,
            global.body_parts.tongue,
            global.body_parts.neck
        ], ["has_wings", "lays_eggs"]),
        new CharacterGender("male", "majestuous", [
            global.body_parts.beak,
            global.body_parts.chest,
            global.body_parts.wings,
            global.body_parts.ass,
            global.body_parts.dick,
            global.body_parts.cloeca,
            global.body_parts.tongue,
            global.body_parts.neck
        ], ["has_wings"])]
    );

    // Horned Ones
    CharacterSpecies.HornedOnes = new CharacterSpecies(
        "Horned Ones",
        "horned beast",
        [new CharacterGender("female", "curvaceous", [
			global.body_parts.mouth,
		    global.body_parts.neck,
			global.body_parts.tongue,
			global.body_parts.lips,
			global.body_parts.ass,
			global.body_parts.anus,
		    global.body_parts.chest,
		    global.body_parts.nipples,
			global.body_parts.hands,
			global.body_parts.thighs,

            global.body_parts.horns,
            global.body_parts.breasts,
            global.body_parts.tail,
            global.body_parts.vagina
        ], ["has_horns", "heat_cycles"]),
        new CharacterGender("male", "burly", [
			global.body_parts.mouth,
		    global.body_parts.neck,
			global.body_parts.tongue,
			global.body_parts.lips,
			global.body_parts.ass,
			global.body_parts.anus,
		    global.body_parts.chest,
		    global.body_parts.nipples,
			global.body_parts.hands,
			global.body_parts.thighs,
			
            global.body_parts.horns,
            global.body_parts.tail,
        ], ["has_horns", "rutting_season"])]
    );

    // Tentacled Beings
    CharacterSpecies.TentacledBeings = new CharacterSpecies(
        "Tentacled Beings",
        "slithering mass",
        [new CharacterGender("female", "fluid", [
            global.body_parts.tentacles,
            global.body_parts.mouth,
            global.body_parts.ass,
            global.body_parts.anus,
            global.body_parts.vagina,
			global.body_parts.tongue
        ], ["has_tentacles", "regenerates"]),
        new CharacterGender("male", "coiled", [
            global.body_parts.tentacles,
            global.body_parts.mouth,
            global.body_parts.ass,
            global.body_parts.anus,
            global.body_parts.dick,
			global.body_parts.tongue
        ], ["has_tentacles", "regenerates"])]
    );

    // Kobolds
    CharacterSpecies.Kobolds = new CharacterSpecies(
        "Kobolds",
        "small scaly trickster",
        [new CharacterGender("female", "nimble", [
			global.body_parts.mouth,
		    global.body_parts.neck,
			global.body_parts.tongue,
			global.body_parts.lips,
			global.body_parts.ass,
			global.body_parts.anus,
		    global.body_parts.chest,
		    global.body_parts.nipples,
			global.body_parts.hands,
			global.body_parts.thighs,
			
            global.body_parts.tail,
            global.body_parts.claws,
            global.body_parts.vagina,
            global.body_parts.tongue
        ], ["has_scales", "cold_blooded", "androginous", "small_body"]),
        new CharacterGender("male", "nimble", [
			global.body_parts.mouth,
		    global.body_parts.neck,
			global.body_parts.tongue,
			global.body_parts.lips,
			global.body_parts.ass,
			global.body_parts.anus,
		    global.body_parts.chest,
		    global.body_parts.nipples,
			global.body_parts.hands,
			global.body_parts.thighs,
			
			global.body_parts.tail,
            global.body_parts.claws,
            global.body_parts.dick,
        ], ["has_scales", "cold_blooded", "androginous", "small_body"])]
    );

    // Goblins
    CharacterSpecies.Goblins = new CharacterSpecies(
        "Goblins",
        "greedy little fiend",
        [new CharacterGender("female", "petite", [
			global.body_parts.mouth,
		    global.body_parts.neck,
			global.body_parts.tongue,
			global.body_parts.lips,
			global.body_parts.ass,
			global.body_parts.anus,
		    global.body_parts.chest,
		    global.body_parts.nipples,
			global.body_parts.hands,
			global.body_parts.thighs,
			
            global.body_parts.vagina,
            global.body_parts.breasts,
        ], ["has_claws", "pointy_theets", "small_body"]),
        new CharacterGender("male", "scrappy", [
			global.body_parts.mouth,
		    global.body_parts.neck,
			global.body_parts.tongue,
			global.body_parts.lips,
			global.body_parts.ass,
			global.body_parts.anus,
		    global.body_parts.chest,
		    global.body_parts.nipples,
			global.body_parts.hands,
			global.body_parts.thighs,
			
            global.body_parts.dick,
        ], ["has_claws", "pointy_theets", "small_body"])]
    );

    // Lizardfolk
    CharacterSpecies.Lizardfolk = new CharacterSpecies(
        "Lizardfolk",
        "scaled warrior",
        [new CharacterGender("female", "sleek", [
			global.body_parts.mouth,
		    global.body_parts.neck,
			global.body_parts.tongue,
			global.body_parts.lips,
			global.body_parts.ass,
			global.body_parts.anus,
		    global.body_parts.chest,
		    global.body_parts.nipples,
			global.body_parts.hands,
			global.body_parts.thighs,
			
            global.body_parts.tail,
            global.body_parts.claws,
            global.body_parts.vagina,
            global.body_parts.breasts,
        ], ["has_scales", "cold_blooded"]),
        new CharacterGender("male", "sturdy", [
			global.body_parts.mouth,
		    global.body_parts.neck,
			global.body_parts.tongue,
			global.body_parts.lips,
			global.body_parts.ass,
			global.body_parts.anus,
		    global.body_parts.chest,
		    global.body_parts.nipples,
			global.body_parts.hands,
			global.body_parts.thighs,
			
            global.body_parts.tail,
            global.body_parts.claws,
            global.body_parts.dick,
        ], ["has_scales", "cold_blooded"])]
    );

    // Yordels
    CharacterSpecies.Yordels = new CharacterSpecies(
        "Yordels",
        "furry mountain dweller",
        [new CharacterGender("female", "plump", [
			global.body_parts.mouth,
		    global.body_parts.neck,
			global.body_parts.tongue,
			global.body_parts.lips,
			global.body_parts.ass,
			global.body_parts.anus,
		    global.body_parts.chest,
		    global.body_parts.nipples,
			global.body_parts.hands,
			global.body_parts.thighs,
			
            global.body_parts.vagina,
            global.body_parts.breasts,
        ], ["has_fur", "burrows", "small_body"]),
        new CharacterGender("male", "stocky", [
			global.body_parts.mouth,
		    global.body_parts.neck,
			global.body_parts.tongue,
			global.body_parts.lips,
			global.body_parts.ass,
			global.body_parts.anus,
		    global.body_parts.chest,
		    global.body_parts.nipples,
			global.body_parts.hands,
			global.body_parts.thighs,
			
            global.body_parts.dick,
        ], ["has_fur", "burrows", "small_body"])]
    );

    // Sharkfolk
    CharacterSpecies.Sharkfolk = new CharacterSpecies(
        "Sharkfolk",
        "aquatic predator",
        [new CharacterGender("female", "streamlined", [
			global.body_parts.mouth,
		    global.body_parts.neck,
			global.body_parts.tongue,
			global.body_parts.lips,
			global.body_parts.ass,
			global.body_parts.anus,
		    global.body_parts.chest,
		    global.body_parts.nipples,
			global.body_parts.hands,
			global.body_parts.thighs,
			
            global.body_parts.tail,
            global.body_parts.breasts,
            global.body_parts.vagina,
        ], ["has_fins", "pointy_theets"]),
        new CharacterGender("male", "jagged", [
			global.body_parts.mouth,
		    global.body_parts.neck,
			global.body_parts.tongue,
			global.body_parts.lips,
			global.body_parts.ass,
			global.body_parts.anus,
		    global.body_parts.chest,
		    global.body_parts.nipples,
			global.body_parts.hands,
			global.body_parts.thighs,
			
            global.body_parts.tail,
            global.body_parts.dick,
        ], ["has_fins", "pointy_theets"])]
    );

    // Example of "other commonly sexualized creature": Catfolk
    CharacterSpecies.Catfolk = new CharacterSpecies(
        "Catfolk",
        "feline prowler",
        [new CharacterGender("female", "graceful", [
			global.body_parts.mouth,
		    global.body_parts.neck,
			global.body_parts.tongue,
			global.body_parts.lips,
			global.body_parts.ass,
			global.body_parts.anus,
		    global.body_parts.chest,
		    global.body_parts.nipples,
			global.body_parts.hands,
			global.body_parts.thighs,
			
            global.body_parts.breasts,
            global.body_parts.tail,
            global.body_parts.claws,
            global.body_parts.vagina,
        ], ["has_fur", "nimble", "heat_cycles"]),
        new CharacterGender("male", "lithe", [
			global.body_parts.mouth,
		    global.body_parts.neck,
			global.body_parts.tongue,
			global.body_parts.lips,
			global.body_parts.ass,
			global.body_parts.anus,
		    global.body_parts.chest,
		    global.body_parts.nipples,
			global.body_parts.hands,
			global.body_parts.thighs,
			
			global.body_parts.tail,
            global.body_parts.claws,
            global.body_parts.dick,
        ], ["has_fur", "nimble", "rutting_season"])]
    );
	
	
	
	
    StateComponents.types.has_tentacles = new StateComponents("has_tentacles");
    StateComponents.types.has_wings = new StateComponents("has_wings");
    StateComponents.types.lays_eggs = new StateComponents("lays_eggs");
    StateComponents.types.has_horns = new StateComponents("has_horns");
    StateComponents.types.has_fur = new StateComponents("has_fur");
    StateComponents.types.regenerates = new StateComponents("regenerates");
    StateComponents.types.has_fins = new StateComponents("has_fins");
    StateComponents.types.has_claws = new StateComponents("has_claws");
    StateComponents.types.burrows = new StateComponents("burrows");
    StateComponents.types.has_scales = new StateComponents("has_scales");
    StateComponents.types.cold_blooded = new StateComponents("cold_blooded");
    StateComponents.types.small_body = new StateComponents("small_body");
    StateComponents.types.pointy_theets = new StateComponents("pointy_theets");
    StateComponents.types.nimble = new StateComponents("nimble");
    StateComponents.types.heat_cycles = new StateComponents("heat_cycles");
    StateComponents.types.rutting_season = new StateComponents("rutting_season");
    StateComponents.types.androginous = new StateComponents("androginous");
}