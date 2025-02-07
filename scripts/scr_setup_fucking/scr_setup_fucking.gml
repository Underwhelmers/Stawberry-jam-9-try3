function scr_setup_fucking() {
	new_word_variant("they",["she"]);
	new_word_variant("their",["her"]);
	new_word_variant("theirs",["hers"]);
	new_word_variant("fucking_scenes", [
		"|Camp_setup_scene|\n\n||"
	]);
	
	new_word_variant("camp_setup_scene",[
		"|The_enviroment_was_gorgeous|. |The_party_setted_up_camp|.\n|The_party_is_expectant|. |The_leader_gets_ready|. \n|The_party_gets_close_and_ready|."
	]);
	
	
	new_word_variant("the_enviroment_was_gorgeous",[
	    "the |time_of_day| sky spilled hues of |color1| and |color2| over a |terrain|, |wildness| wilderness",
	    "a |temperature|-|time_of_day2|-breeze |verb1| across the |landscape|, carrying the |scent_adj| scent of |element1| and |element2|",
	    "stars |verb2| to glimmer as the |landscape2| |verb3| in the |glow_adj| glow of |time_of_day3|, the scenery both |scenery_adj1| and |scenery_adj2|"
	]);

	new_word_variant("the_party_setted_up_camp",[
	    "the |creature| |action1| about, |verb_pitch| their |tent_adj| tents and |verb_stack| stones to form a |firepit_adj| fire pit",
	    "in a |noun1| of |motion_adj| motion, the |creature| |verb_arrange| their tents in a |circle_adj| circle, each placement a nod to |tradition|",
	    "efficient and |nimble_adj|, the |creature| set up camp with |ease_adj| ease, their makeshift homes a testament to their |nomadic_adj| life"
	]);

	new_word_variant("the_party_is_expectant",[
	    "an undercurrent of |emotion1| wove through the |group1|, as every |creature| sensed the |approach_adj| ritual",
	    "quiet |emotion2| filled the air, with each member looking forward to the leader's |ceremony_adj| role",
	    "a collective breath was held in |emotion3|, the night promising the unfolding of an |ancient_adj|, revered rite"
	]);

	new_word_variant("the_leader_gets_ready",[
	    "the leader stepped aside from the |prep_adj| preparations, their gaze steady as they prepared for the |sacred_adj| duty ahead",
	    "taking a deep, |breath_adj| breath, the leader began the ritual of |readiness_noun|, aware of the tradition's weight on their shoulders",
	    "with deliberate calm, the leader moved toward the heart of the camp, their posture a silent pledge to fulfill the |responsibility_adj| responsibilities"
	]);

	new_word_variant("the_party_gets_close_and_ready",[
	    "gradually, the |creature| converged, forming an |intimacy_adj| circle around their leader and the |fire_adj| fire",
	    "one by one, the |group2| edged nearer, their eyes fixed on the leader as if drawn by an unseen, |force_adj| force",
	    "in a slow, respectful gathering, every |creature| moved closer, their presence a blend of |reverence_noun| and |expectation_emotion|"
	]);

	new_word_variant("time_of_day",[
	    "twilight", "dusk", "nightfall", "eventide"
	]);

	new_word_variant("color1",[
	    "magenta", "fuchsia", "cerise"
	]);

	new_word_variant("color2",[
	    "indigo", "violet", "midnight blue"
	]);

	new_word_variant("terrain",[
	    "rugged", "craggy", "rocky"
	]);

	new_word_variant("wildness",[
	    "untamed", "wild", "unbridled"
	]);

	new_word_variant("temperature",[
	    "cool", "crisp", "fresh"
	]);

	new_word_variant("time_of_day2",[
	    "night", "evening"
	]);

	new_word_variant("verb1",[
	    "whispered", "murmured", "sung"
	]);

	new_word_variant("landscape",[
	    "open plains", "vast fields", "sprawling meadows"
	]);

	new_word_variant("scent_adj",[
	    "fresh", "invigorating", "vivid"
	]);

	new_word_variant("element1",[
	    "earth", "soil", "dirt"
	]);

	new_word_variant("element2",[
	    "pine", "fir", "cedar"
	]);

	new_word_variant("verb2",[
	    "began", "started", "commenced"
	]);

	new_word_variant("landscape2",[
	    "landscape", "vista", "panorama"
	]);

	new_word_variant("verb3",[
	    "basked", "soaked", "absorbed"
	]);

	new_word_variant("glow_adj",[
	    "soft", "gentle", "mellow"
	]);

	new_word_variant("time_of_day3",[
	    "dusk", "sunset", "eventide"
	]);

	new_word_variant("scenery_adj1",[
	    "wild", "untamed", "primal"
	]);

	new_word_variant("scenery_adj2",[
	    "inviting", "welcoming", "enchanting"
	]);

	new_word_variant("creature",[
	    "kobolds", "scaly wanderers"
	]);

	new_word_variant("action1",[
	    "flurried", "scurried", "bustled"
	]);

	new_word_variant("verb_pitch",[
	    "pitching", "erecting", "raising"
	]);

	new_word_variant("tent_adj",[
	    "modest", "humble", "simple"
	]);

	new_word_variant("verb_stack",[
	    "stacking", "arranging", "heaping"
	]);

	new_word_variant("firepit_adj",[
	    "welcoming", "inviting", "cozy"
	]);

	new_word_variant("noun1",[
	    "flurry", "surge", "cascade"
	]);

	new_word_variant("motion_adj",[
	    "coordinated", "synchronized", "harmonious"
	]);

	new_word_variant("verb_arrange",[
	    "arranged", "organized", "aligned"
	]);

	new_word_variant("circle_adj",[
	    "loose", "casual", "relaxed"
	]);

	new_word_variant("tradition",[
	    "tradition", "custom", "ritual"
	]);

	new_word_variant("nimble_adj",[
	    "nimble", "agile", "spry"
	]);

	new_word_variant("ease_adj",[
	    "practiced", "experienced", "seasoned"
	]);

	new_word_variant("nomadic_adj",[
	    "nomadic", "roving", "wandering"
	]);

	new_word_variant("emotion1",[
	    "anticipation", "expectation", "excitement"
	]);

	new_word_variant("group1",[
	    "group", "assembly", "gathering"
	]);

	new_word_variant("approach_adj",[
	    "approaching", "impending", "forthcoming"
	]);

	new_word_variant("emotion2",[
	    "excitement", "thrill", "eagerness"
	]);

	new_word_variant("ceremony_adj",[
	    "ceremonial", "ritualistic", "sacred"
	]);

	new_word_variant("emotion3",[
	    "expectancy", "suspense", "apprehension"
	]);

	new_word_variant("ancient_adj",[
	    "ancient", "time-honored", "old-world"
	]);

	new_word_variant("prep_adj",[
	    "bustling", "hectic", "lively"
	]);

	new_word_variant("sacred_adj",[
	    "sacred", "hallowed", "divine"
	]);

	new_word_variant("breath_adj",[
	    "resolute", "firm", "steadfast"
	]);

	new_word_variant("readiness_noun",[
	    "readiness", "alertness", "preparedness"
	]);

	new_word_variant("responsibility_adj",[
	    "age-old", "time-honored", "traditional"
	]);

	new_word_variant("intimacy_adj",[
	    "intimate", "close-knit", "tight-knit"
	]);

	new_word_variant("fire_adj",[
	    "flickering", "dancing", "wavering"
	]);

	new_word_variant("group2",[
	    "party", "assembly", "crowd"
	]);

	new_word_variant("force_adj",[
	    "binding", "uniting", "compelling"
	]);

	new_word_variant("reverence_noun",[
	    "reverence", "respect", "veneration"
	]);

	new_word_variant("expectation_emotion",[
	    "eager expectation", "keen anticipation", "ardent hope"
	]);
}