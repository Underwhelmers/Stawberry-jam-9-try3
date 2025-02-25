function scr_setup_command_synonyms() {
    // Actions (verbs) and their canonical forms
    var action_synonyms = ds_map_create();
	ds_map_add(action_synonyms, "look", "look");
    ds_map_add(action_synonyms, "gaze", "look");
    ds_map_add(action_synonyms, "peer", "look");
    ds_map_add(action_synonyms, "stare", "look");
    ds_map_add(action_synonyms, "examine", "look");
    ds_map_add(action_synonyms, "look at", "look");

    ds_map_add(action_synonyms, "touch", "touch");
    ds_map_add(action_synonyms, "caress", "touch");
    ds_map_add(action_synonyms, "stroke", "touch");
    ds_map_add(action_synonyms, "feel", "touch");

    ds_map_add(action_synonyms, "kiss", "kiss");
    ds_map_add(action_synonyms, "peck", "kiss");
    ds_map_add(action_synonyms, "smooch", "kiss");
	
	ds_map_add(action_synonyms, "move to"      , "move to"      );
	ds_map_add(action_synonyms, "talk to"      , "talk to"      );
	ds_map_add(action_synonyms, "flirt with"   , "flirt with"   );
	ds_map_add(action_synonyms, "whisper to"   , "whisper to"   );
	ds_map_add(action_synonyms, "caress"       , "caress"       );
	ds_map_add(action_synonyms, "hold"         , "hold"         );
	ds_map_add(action_synonyms, "undress"      , "undress"      );
	ds_map_add(action_synonyms, "lift"         , "lift"         );
	ds_map_add(action_synonyms, "expose"       , "expose"       );
	ds_map_add(action_synonyms, "tease"        , "tease"        );
	ds_map_add(action_synonyms, "rub"          , "rub"          );
	ds_map_add(action_synonyms, "squeeze"      , "squeeze"      );
	ds_map_add(action_synonyms, "lick"         , "lick"         );
	ds_map_add(action_synonyms, "finger"       , "finger"       );
	ds_map_add(action_synonyms, "stroke"       , "stroke"       );
	ds_map_add(action_synonyms, "suck"         , "suck"         );
	ds_map_add(action_synonyms, "grind against", "grind against");
	ds_map_add(action_synonyms, "insert into"  , "insert into"  );
	ds_map_add(action_synonyms, "thrust into"  , "thrust into"  );
	ds_map_add(action_synonyms, "pull out of"  , "pull out of"  );
	ds_map_add(action_synonyms, "switch to"    , "switch to"    );
	ds_map_add(action_synonyms, "lick clean"   , "lick clean"   );
	ds_map_add(action_synonyms, "deep throat"  , "deep throat"  );
	ds_map_add(action_synonyms, "gag on"       , "gag on"       );
	ds_map_add(action_synonyms, "cuddle"       , "cuddle"       );
	ds_map_add(action_synonyms, "rest with"    , "rest with"    );
	ds_map_add(action_synonyms, "clean"        , "clean"        );
	ds_map_add(action_synonyms, "dress"        , "dress"        );
	ds_map_add(action_synonyms, "climax"       , "climax"       );
	ds_map_add(action_synonyms, "edge"         , "edge"         );
	ds_map_add(action_synonyms, "aim at"       , "aim at"       );
	ds_map_add(action_synonyms, "restrain"     , "restrain"     );
	ds_map_add(action_synonyms, "release"      , "release"      );
	ds_map_add(action_synonyms, "spank"        , "spank"        );
	ds_map_add(action_synonyms, "ride"         , "ride"         );
	ds_map_add(action_synonyms, "check"        , "check"        );
	ds_map_add(action_synonyms, "free"         , "free"         );
	
    // Add more as needed

    // Modifiers (adjectives/adverbs) and their canonical forms
    var modifier_synonyms = ds_map_create();
	ds_map_add(modifier_synonyms, "gently", "gently");
    ds_map_add(modifier_synonyms, "softly", "gently");
    ds_map_add(modifier_synonyms, "lightly", "gently");

    ds_map_add(modifier_synonyms, "firmly", "firmly");
    ds_map_add(modifier_synonyms, "hard", "firmly");
    ds_map_add(modifier_synonyms, "strongly", "firmly");

    ds_map_add(modifier_synonyms, "slowly", "slowly");
    ds_map_add(modifier_synonyms, "gradually", "slowly");
    ds_map_add(modifier_synonyms, "deliberately", "slowly");

    ds_map_add(modifier_synonyms, "quickly", "quickly");
    ds_map_add(modifier_synonyms, "swiftly", "quickly");
    ds_map_add(modifier_synonyms, "fast", "quickly");

    // Targets (nouns) will be populated dynamically based on game state
    var target_categories = ds_map_create();

    // Store globally for access
    global.command_synonyms = {
        actions: action_synonyms,
        modifiers: modifier_synonyms,
        targets: target_categories
    };
}