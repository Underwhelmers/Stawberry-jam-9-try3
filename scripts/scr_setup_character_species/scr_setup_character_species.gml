function scr_setup_character_species() {
	// Winged Ones
	CharacterSpecies.Birdfolk = new CharacterSpecies(
		"Birdfolk",
		"winged creature", [
			CharacterBodyParts.beak,
			CharacterBodyParts.chest,
			CharacterBodyParts.wings,
			CharacterBodyParts.ass,
			CharacterBodyParts.tongue,
			CharacterBodyParts.neck,
		], ["has_wings"], [
			new CharacterGender("female", "slender", [
				CharacterBodyParts.cloeca,
			], ["lays_eggs", "gets_wet"]),
			
			new CharacterGender("male", "majestuous", [
				CharacterBodyParts.anus,
				CharacterBodyParts.dick,
			], ["produces_semen", "voluntary_erection"]),
		]
	);

	// Horned Ones
	CharacterSpecies.Goatfolk = new CharacterSpecies(
		"Goatfolk",
		"horned beast", [
			CharacterBodyParts.mouth,
			CharacterBodyParts.neck,
			CharacterBodyParts.tongue,
			CharacterBodyParts.lips,
			CharacterBodyParts.ass,
			CharacterBodyParts.anus,
			CharacterBodyParts.chest,
			CharacterBodyParts.nipples,
			CharacterBodyParts.hands,
			CharacterBodyParts.thighs,
			CharacterBodyParts.horns,
			CharacterBodyParts.tail,	
		], ["has_horns", "has_fur", "has_tail", "heat_cycles"] , [
			new CharacterGender("female", "curvaceous", [
				CharacterBodyParts.breasts,
				CharacterBodyParts.vagina,
			], ["gets_wet"]),
			
			new CharacterGender("male", "burly", [
				CharacterBodyParts.dick,
			], ["produces_semen", "gets_hard"]),
		]
	);

	// Kobolds
	CharacterSpecies.Kobolds = new CharacterSpecies(
		"Kobolds",
		"small dragonid", [
			CharacterBodyParts.mouth,
			CharacterBodyParts.neck,
			CharacterBodyParts.tongue,
			CharacterBodyParts.lips,
			CharacterBodyParts.ass,
			CharacterBodyParts.anus,
			CharacterBodyParts.chest,
			CharacterBodyParts.nipples,
			CharacterBodyParts.hands,
			CharacterBodyParts.thighs,
			CharacterBodyParts.tail,
			CharacterBodyParts.claws,
		], ["has_scales", "cold_blooded", "androgynous", "small_body"] , [
			new CharacterGender("female", "nimble", [
				CharacterBodyParts.vagina,
			], ["gets_wet"]),
			
			new CharacterGender("male", "nimble", [
				CharacterBodyParts.dick,
			], ["produces_semen", "voluntary_erection"]),
		]
	);

	// Goblins
	CharacterSpecies.Goblins = new CharacterSpecies(
		"Goblins",
		"green little fiend", [
			CharacterBodyParts.mouth,
			CharacterBodyParts.neck,
			CharacterBodyParts.tongue,
			CharacterBodyParts.lips,
			CharacterBodyParts.ass,
			CharacterBodyParts.anus,
			CharacterBodyParts.chest,
			CharacterBodyParts.nipples,
			CharacterBodyParts.hands,
			CharacterBodyParts.thighs,
		], ["pointy_theets", "small_body", "pointy_ears"] , [
			new CharacterGender("female", "petite", [
				CharacterBodyParts.vagina,
				CharacterBodyParts.breasts,
			], ["gets_wet"]),
			
			new CharacterGender("male", "scrappy", [
				CharacterBodyParts.dick,
			], ["produces_semen", "gets_hard"]),
		]
	);
	
	
	// Human
	CharacterSpecies.Humans = new CharacterSpecies(
		"Humans",
		"plain old human", [
			CharacterBodyParts.mouth,
			CharacterBodyParts.neck,
			CharacterBodyParts.tongue,
			CharacterBodyParts.lips,
			CharacterBodyParts.ass,
			CharacterBodyParts.anus,
			CharacterBodyParts.chest,
			CharacterBodyParts.nipples,
			CharacterBodyParts.hands,
			CharacterBodyParts.thighs,
		], [] , [
			new CharacterGender("female", "curvy", [
				CharacterBodyParts.vagina,
				CharacterBodyParts.breasts,
			], ["gets_wet"]),
			
			new CharacterGender("male", "strong", [
				CharacterBodyParts.dick,
			], ["produces_semen", "gets_hard"]),
		]
	);

	// Lizardfolk
	CharacterSpecies.Lizardfolk = new CharacterSpecies(
		"Lizardfolk",
		"scaled warrior", [
			CharacterBodyParts.mouth,
			CharacterBodyParts.neck,
			CharacterBodyParts.tongue,
			CharacterBodyParts.lips,
			CharacterBodyParts.ass,
			CharacterBodyParts.anus,
			CharacterBodyParts.chest,
			CharacterBodyParts.nipples,
			CharacterBodyParts.hands,
			CharacterBodyParts.thighs,
			CharacterBodyParts.tail,
			CharacterBodyParts.claws,
		], ["has_scales", "cold_blooded"] , [
			new CharacterGender("female", "sleek", [
				CharacterBodyParts.vagina,
				CharacterBodyParts.breasts,
			], ["lays_eggs", "gets_wet"]),
			
			new CharacterGender("male", "sturdy", [
				CharacterBodyParts.dick,
			], ["produces_semen", "voluntary_erection"]),
		]
	);

	// Yordels
	CharacterSpecies.Yordels = new CharacterSpecies(
		"Yordels",
		"furry mountain dweller", [
			CharacterBodyParts.mouth,
			CharacterBodyParts.neck,
			CharacterBodyParts.tongue,
			CharacterBodyParts.lips,
			CharacterBodyParts.ass,
			CharacterBodyParts.anus,
			CharacterBodyParts.chest,
			CharacterBodyParts.nipples,
			CharacterBodyParts.hands,
			CharacterBodyParts.thighs,
		], ["has_fur", "burrows", "small_body"] , [
			new CharacterGender("female", "plump", [
				CharacterBodyParts.vagina,
				CharacterBodyParts.breasts,
			], ["gets_wet"]),
			
			new CharacterGender("male", "stocky", [
				CharacterBodyParts.dick,
			], ["produces_semen", "gets_hard"]),
		]
	);

	// Sharkfolk
	CharacterSpecies.Sharkfolk = new CharacterSpecies(
		"Sharkfolk",
		"aquatic predator", [
			CharacterBodyParts.mouth,
			CharacterBodyParts.neck,
			CharacterBodyParts.tongue,
			CharacterBodyParts.lips,
			CharacterBodyParts.ass,
			CharacterBodyParts.anus,
			CharacterBodyParts.chest,
			CharacterBodyParts.nipples,
			CharacterBodyParts.hands,
			CharacterBodyParts.thighs,
			CharacterBodyParts.tail,
		], ["waterbreathing", "pointy_theets"] , [
			new CharacterGender("female", "streamlined", [
				CharacterBodyParts.breasts,
				CharacterBodyParts.vagina,
			], ["gets_wet"]),
			
			new CharacterGender("male", "jagged", [
				CharacterBodyParts.dick,
			], ["produces_semen", "voluntary_erection"]),
		]
	);

	// Catfolk
	CharacterSpecies.Catfolk = new CharacterSpecies(
		"Catfolk",
		"feline prowler", [
			CharacterBodyParts.mouth,
			CharacterBodyParts.neck,
			CharacterBodyParts.tongue,
			CharacterBodyParts.lips,
			CharacterBodyParts.ass,
			CharacterBodyParts.anus,
			CharacterBodyParts.chest,
			CharacterBodyParts.nipples,
			CharacterBodyParts.hands,
			CharacterBodyParts.thighs,
			CharacterBodyParts.tail,
			CharacterBodyParts.claws,
		], ["has_fur", "nimble", "heat_cycles"], [
			new CharacterGender("female", "graceful", [
				CharacterBodyParts.vagina,
				CharacterBodyParts.breasts,
			], ["gets_wet"]),
			
			new CharacterGender("male", "lithe", [
				CharacterBodyParts.dick,
			], ["produces_semen", "gets_hard"]),
		]
	);
	
	Components.types.has_wings = new Components("has_wings");
	Components.types.lays_eggs = new Components("lays_eggs");
	Components.types.has_horns = new Components("has_horns");
	Components.types.has_tail = new Components("has_tail");
	Components.types.has_fur = new Components("has_fur");
	Components.types.waterbreathing = new Components("waterbreathing");
	Components.types.has_claws = new Components("has_claws");
	Components.types.burrows = new Components("burrows");
	Components.types.has_scales = new Components("has_scales");
	Components.types.cold_blooded = new Components("cold_blooded");
	Components.types.small_body = new Components("small_body");
	Components.types.pointy_theets = new Components("pointy_theets");
	Components.types.nimble = new Components("nimble");
	Components.types.heat_cycles = new Components("heat_cycles");
	Components.types.androgynous = new Components("androgynous");
	Components.types.produces_semen = new Components("produces_semen");
	Components.types.gets_wet = new Components("gets_wet");
	Components.types.gets_hard = new Components("gets_hard");
	Components.types.voluntary_erection = new Components("voluntary_erection");
}