// look [target|nothing] 
function action_look(command) {
	if (array_length(command.targets) == 0) {
		scr_chat(command.actor, "{0}_looks_around", command.character_type);
		return;
	}
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