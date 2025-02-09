/// @function                                                  new TentEncBodyHairStyle(id, descriptor, descriptions)
/// @param {string} _id                                        The unique identifier for the hair style (e.g., "curly").
/// @param {string} _descriptor                                A brief descriptor for the hair style (e.g., "curly").
/// @param {Struct.TentEncBodyHairStyleStages} _descriptions   An instance containing arrays for the neat and messy stage descriptors.
/// @desc Creates a new TentEncBodyHairStyle instance with a unique identifier, a short descriptor, and associated stage descriptions.
function TentEncBodyHairStyle(_id, _descriptor, _descriptions) constructor {
	identifier = _id;
	descriptor = _descriptor;
	descriptions = _descriptions;
}

function scr_setup_tent_enc_body_hair_style() {
	// CURLY hair style
	TentEncBodyHairStyle.CURLY = new TentEncBodyHairStyle("curly", "curly",
		new TentEncBodyHairStyleStages(
			["well-defined curls", "tamed curls", "structured curls"],
			["wild curls", "untamed curls", "disordered curls"]
		)
	);
	
	// STRAIGHT hair style
	TentEncBodyHairStyle.STRAIGHT = new TentEncBodyHairStyle("straight", "straight",
		new TentEncBodyHairStyleStages(
			["sleek straight", "polished straight", "refined straight"],
			["flat straight", "unkempt straight", "messy straight"]
		)
	);
	
	// WAVY hair style
	TentEncBodyHairStyle.WAVY = new TentEncBodyHairStyle("wavy", "wavy",
		new TentEncBodyHairStyleStages(
			["subtle waves", "refined waves", "controlled waves"],
			["loose waves", "disheveled waves", "careless waves"]
		)
	);
	
	// BRAIDED hair style
	TentEncBodyHairStyle.BRAIDED = new TentEncBodyHairStyle("braided", "braided",
		new TentEncBodyHairStyleStages(
			["tightly braided", "uniform braids", "structured braids"],
			["loosely braided", "untidy braids", "sloppy braids"]
		)
	);
	
	// DREADLOCKS hair style
	TentEncBodyHairStyle.DREADLOCKS = new TentEncBodyHairStyle("dreadlocks", "dreadlocks",
		new TentEncBodyHairStyleStages(
			["well-maintained dreads", "organized dreads", "styled dreads"],
			["tangled dreads", "unkempt dreads", "disorderly dreads"]
		)
	);
	
	// AFRO hair style
	TentEncBodyHairStyle.AFRO = new TentEncBodyHairStyle("afro", "afro",
		new TentEncBodyHairStyleStages(
			["defined afro", "styled afro", "well-shaped afro"],
			["fluffy afro", "untamed afro", "voluminous afro"]
		)
	);
	
	// PONYTAIL hair style
	TentEncBodyHairStyle.PONYTAIL = new TentEncBodyHairStyle("ponytail", "ponytail",
		new TentEncBodyHairStyleStages(
			["sleek ponytail", "polished ponytail", "tight ponytail"],
			["loose ponytail", "casual ponytail", "disheveled ponytail"]
		)
	);
	
	// MOHAWK hair style
	TentEncBodyHairStyle.MOHAWK = new TentEncBodyHairStyle("mohawk", "mohawk",
		new TentEncBodyHairStyleStages(
			["sharp mohawk", "structured mohawk", "stylized mohawk"],
			["ragged mohawk", "untidy mohawk", "chaotic mohawk"]
		)
	);
	
	// BUN hair style
	TentEncBodyHairStyle.BUN = new TentEncBodyHairStyle("bun", "bun",
		new TentEncBodyHairStyleStages(
			["tidy bun", "well-arranged bun", "structured bun"],
			["messy bun", "loose bun", "disheveled bun"]
		)
	);
}