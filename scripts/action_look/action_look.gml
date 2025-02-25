// examine [target]
function action_look(command) {
	scr_inform(command.toString())
	//scr_chat(command.actor, "{0}_looks_around", command.character_type);
}

function scr_setup_action_examine() {
    // Main variants based on actor type (NPC or player)
    new_word_variant("npc_examines", [
        "npc_examines_distractedly",
        "npc_examines_intently",
        "npc_examines_seductively",
        "npc_examines_curiously"
    ]);
    new_word_variant("player_examines", [
        "player_examines_scene_object",
        "player_examines_character",
        "player_examines_with_focus",
        "player_examines_sensually"
    ]);

    // NPC-specific reactions
    new_word_variant("npc_examines_distractedly", [
        "*|Glances| at {0} |absently|*",
        "*Seems to |study| {0}, but her mind drifts*",
        "*|Looks| over {0} with a |distracted| air*",
        "*|Eyes| {0} |idly|, barely engaged*"
    ]);
    new_word_variant("npc_examines_intently", [
        "*|Stares| at {0} with |piercing| focus*",
        "*|Studies| {0}, her |eyes| unwavering*",
        "*Locks her |gaze| on {0}, |intently| watching*",
        "*|Inspects| {0}, every detail held in her |eyes|*"
    ]);
    new_word_variant("npc_examines_seductively", [
        "*|Gazes| at {0}, a |sultry| smile playing on her lips*",
        "*|Looks| over {0} with a slow, |alluring| sweep*",
        "*|Eyes| {0}, her |breath| soft and inviting*",
        "*|Studies| {0}, her |gaze| dripping with |desire|*"
    ]);
    new_word_variant("npc_examines_curiously", [
        "*|Peers| at {0}, head tilted in |curiosity|*",
        "*|Looks| at {0}, her |eyes| wide with |wonder|*",
        "*|Inspects| {0}, a |playful| glint in her |gaze|*",
        "*|Glances| at {0}, intrigued by its |mystery|*"
    ]);

    // Player-specific reactions
    new_word_variant("player_examines_scene_object", [
        "You |study| the |scene_furniture|, noting its |texture|.",
        "Your |eyes| linger on the |scene_furniture|, tracing its |shape|.",
        "You |inspect| the |scene_lighting|, the |scene_scent| teasing your senses.",
        "The |scene_furniture| draws your |gaze|, its |feel| almost tangible."
    ]);
    new_word_variant("player_examines_character", [
        "You |gaze| at {0}, her |hair_color| hair catching the |scene_lighting|.",
        "Your |eyes| roam over {0}, drawn to her |body_type| form.",
        "You |inspect| {0}, her |eye_color| eyes meeting yours with |intensity|.",
        "You |study| {0}, the |scene_scent| mingling with her |arousal_state|."
    ]);
    new_word_variant("player_examines_with_focus", [
        "You focus on {0}, every |detail| sharpening under your |gaze|.",
        "Your |eyes| lock onto {0}, its |texture| vivid in the |scene_lighting|.",
        "You |peer| at {0}, the |scene_sound| fading as you take it in.",
        "You |examine| {0} closely, its |shape| etched into your mind."
    ]);
    new_word_variant("player_examines_sensually", [
        "You |gaze| at {0}, your |breath| catching at its |alluring| presence.",
        "Your |eyes| caress {0}, the |scene_scent| heightening its |desire|.",
        "You |study| {0} slowly, a |sultry| warmth spreading through you.",
        "You |inspect| {0}, its |feel| stirring a |playful| heat in your chest."
    ]);

    // Supporting variants
    new_word_variant("glances", ["glances", "looks", "casts a look", "flicks her eyes"]);
    new_word_variant("study", ["study", "examine", "observe", "scrutinize"]);
    new_word_variant("looks", ["looks", "gazes", "peers", "stares"]);
    new_word_variant("stares", ["stares", "gazes", "fixes her eyes", "locks her stare"]);
    new_word_variant("inspects", ["inspects", "examines", "probes", "surveys"]);
    new_word_variant("peers", ["peers", "gazes", "squints", "looks closely"]);
    new_word_variant("gaze", ["gaze", "stare", "look", "focus"]);
    new_word_variant("eyes", ["eyes", "gaze", "sight", "vision"]);
    new_word_variant("absently", ["absently", "distractedly", "idly", "carelessly"]);
    new_word_variant("distracted", ["distracted", "absent", "unfocused", "detached"]);
    new_word_variant("piercing", ["piercing", "intense", "sharp", "penetrating"]);
    new_word_variant("intently", ["intently", "keenly", "sharply", "fixedly"]);
    new_word_variant("sultry", ["sultry", "seductive", "alluring", "smoldering"]);
    new_word_variant("alluring", ["alluring", "enticing", "captivating", "tempting"]);
    new_word_variant("breath", ["breath", "sigh", "whisper", "pant"]);
    new_word_variant("desire", ["desire", "need", "hunger", "lust"]);
    new_word_variant("curiosity", ["curiosity", "intrigue", "wonder", "interest"]);
    new_word_variant("wonder", ["wonder", "awe", "fascination", "amazement"]);
    new_word_variant("playful", ["playful", "teasing", "mischievous", "lighthearted"]);
    new_word_variant("mystery", ["mystery", "enigma", "secret", "intrigue"]);
    new_word_variant("texture", ["texture", "surface", "feel", "grain"]);
    new_word_variant("shape", ["shape", "form", "contour", "outline"]);
    new_word_variant("feel", ["feel", "touch", "sensation", "presence"]);
    new_word_variant("detail", ["detail", "feature", "aspect", "nuance"]);
    new_word_variant("intensity", ["intensity", "depth", "fire", "passion"]);
    new_word_variant("hair_color", ["raven", "blonde", "auburn", "silver", "fiery red"]); // From scr_initialize_character_descriptions
    new_word_variant("eye_color", ["emerald", "sapphire", "amber", "hazel", "deep brown"]);
    new_word_variant("body_type", ["lithe", "curvaceous", "athletic", "petite", "voluptuous"]);
    new_word_variant("arousal_state", ["calm", "slightly aroused", "highly aroused", "trembling with desire"]);
}

function scr_setup_action_look_around() {
    // Main variants based on actor type (NPC or player)
    new_word_variant("npc_looks_around", [
        "npc_is_distracted",
        "npc_looks_intently_focus",
        "npc_scans_sensually",
        "npc_gazes_dreamily"
    ]);
    new_word_variant("player_looks_around", [
        "describe_scene",
        "describe_player_focus",
        "player_takes_in_details",
        "player_senses_atmosphere"
    ]);

    // NPC-specific reactions
    new_word_variant("npc_is_distracted", [
        "*Looks around |absently|*",
        "*Seems |distracted|, eyes drifting*",
        "*Gazes off, lost in |thought|*",
        "*Scans the room |idly|, barely noticing*"
    ]);
    new_word_variant("npc_looks_intently_focus", [
        "*|Stares| at you*",
        "*|Stares| at you |intently|*",
        "*Locks |eyes| on you, unblinking*",
        "*Watches you with |piercing| focus*"
    ]);
    new_word_variant("npc_scans_sensually", [
        "*Sweeps her |eyes| over the room, lips parted*",
        "*Looks around with a |sultry| tilt of her head*",
        "*|Gazes| slowly, drinking in every detail*",
        "*Scans the space, her |breath| catching slightly*"
    ]);
    new_word_variant("npc_gazes_dreamily", [
        "*|Gazes| around, lost in a |dreamy| haze*",
        "*Looks about, eyes soft and |distant|*",
        "*Drifts her |eyes| over the scene, |breath| soft*",
        "*Stares into the |shadows|, lost in |thought|*"
    ]);

    // Player-specific reactions
    new_word_variant("describe_scene", [
        "You survey the |scene_lighting| room, noting the |scene_furniture|.",
        "Your |eyes| roam the |scene_atmosphere| space, drawn to the |scene_furniture|.",
        "You take in the |scene_lighting| glow, the |scene_sound| filling your ears.",
        "The |scene_scent| hits you as you glance around the |scene_atmosphere| room."
    ]);
    new_word_variant("describe_player_focus", [
        "You focus on the |scene_furniture|, its |texture| catching your eye.",
        "Your |eyes| linger on the |scene_lighting|, a |scene_sound| in the background.",
        "You zero in on the |scene_atmosphere|, feeling the |scene_scent| wash over you.",
        "You fixate on the |scene_furniture|, the |scene_sound| stirring your senses."
    ]);
    new_word_variant("player_takes_in_details", [
        "You drink in the |scene_lighting|, every detail sharpening in your |eyes|.",
        "Your gaze sweeps over the |scene_furniture|, the |scene_scent| teasing you.",
        "You absorb the |scene_atmosphere|, the |scene_sound| pulsing around you.",
        "You take it all in, the |scene_lighting| painting a |scene_atmosphere| picture."
    ]);
    new_word_variant("player_senses_atmosphere", [
        "You feel the |scene_atmosphere|, the |scene_scent| heavy in the air.",
        "The |scene_sound| wraps around you as you sense the |scene_lighting| glow.",
        "You breathe in the |scene_atmosphere|, the |scene_furniture| looming near.",
        "The |scene_scent| fills your lungs, the |scene_atmosphere| pressing in."
    ]);

    // Supporting variants
    new_word_variant("absently", ["distracted", "absently", "idly", "carelessly"]);
    new_word_variant("distracted", ["distracted", "absent", "unfocused", "detached"]);
    new_word_variant("stare", ["stare", "gaze", "look", "peer"]);
    new_word_variant("eyes", ["eyes", "gaze", "sight", "vision"]);
    new_word_variant("intently", ["intently", "sharply", "keenly", "fixedly"]);
    new_word_variant("sultry", ["sultry", "seductive", "alluring", "smoldering"]);
    new_word_variant("thought", ["thought", "fantasy", "reverie", "musing"]);
    new_word_variant("breath", ["breath", "sigh", "whisper", "pant"]);
    new_word_variant("dreamy", ["dreamy", "hazy", "ethereal", "languid"]);
    new_word_variant("distant", ["distant", "far-off", "remote", "lost"]);
    new_word_variant("piercing", ["piercing", "intense", "sharp", "penetrating"]);
    new_word_variant("texture", ["texture", "surface", "feel", "shape"]);
    new_word_variant("shadows", ["shadows", "darkness", "gloom", "dimness"]);
}