function TentEncBodyEyes(_features) {
	state = TentEncBodyEyesState.NEUTRAL;
	features = _features;
}


// Generates random features for the eyes and adds descriptive strings to _eyes.features.
function scr_tentenc_eyes_generate_random_features(_body, _eyes) {
    var _eyes_colors = ["blue", "green", "grey", "yellow", "brown", "red", "violet", "black"];
    
    // Choose two unique colors for a polychrome effect.
    var _2col = choose_from_unique(_eyes_colors, 2);
    var _poly_out_in   = string("polychrome {0} brim to {1} near the iris", _2col[0], _2col[1]);
    var _poly_left_right = string("polychrome left eye {0} and right eye {1}", _2col[0], _2col[1]);
    
    // Add these options to the available colours.
    array_push(_eyes_colors, _poly_out_in);
    array_push(_eyes_colors, _poly_left_right);
    
    // Choose an eye color/description at random.
    var eyeDesc = "their eyes are " + choose_from(_eyes_colors);
    if (!is_array(_eyes.features)) { _eyes.features = []; }
    array_push(_eyes.features, eyeDesc);
    
    // Additional eye features to add extra flavor.
    var additionalFeatures = [
        "big eyelashes that accentuate the gaze",
        "large, expressive eyes",
        "a hint of mystery in their depth",
        "small, shifty eyes",
        "sincere eyes that reveal emotion"
    ];
    
	
    // Choose one or two random features.
    var featureCount = irandom_range(0, 2);
	var choosen = choose_from_distinct(additionalFeatures, featureCount);
    for (var i = 0; i < featureCount; i++) {
        array_push(_eyes.features, choosen[i]);
    }
}
