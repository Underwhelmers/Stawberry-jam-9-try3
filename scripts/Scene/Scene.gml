function Scene(_lighting, _sound, _space_density, _visual_hazards, _auditory_hazards) constructor {
	lighting = _lighting;
	sound = _sound;
	space_density = _space_density;
	visual_hazards = _visual_hazards;
	auditory_hazards = _auditory_hazards;
	
	static make_full_decription = function() {
		return string("\n  The room is {0}. Filled with {1}. The ambient is {2}.\n  Your moves are {3}. Any noise you make is {4}.",
			lighting.describe(),
			sound.describe(),
			space_density.describe(),
			visual_hazards.describe(),
			auditory_hazards.describe()
		);
	};

	static visual_risk = function() {
		return clamp((lighting.value + 1 - space_density.value)/2 * visual_hazzards.value, 0, 1);
	};
	
	static audtory_risk = function() {
		return clamp((1 - ambient_sound.value) * auditory_hazzards.value, 0, 1);
	};
}
