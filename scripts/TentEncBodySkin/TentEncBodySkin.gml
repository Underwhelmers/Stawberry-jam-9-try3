function TentEncBodySkin(_color, _texture, _features) constructor {
	color = _color;       // Default skin tone
	texture = _texture;   // Skinn texture
	features = _features; // Skinn features
}

// Generates random skin features for the body.
// Features are typically associated with a given body ubication.
function scr_tentenc_skin_generate_random_features(_body, _skin) {
    // A list of possible skin features.
    var possibleFeatures = [
        "a scattering of freckles across the cheeks",
        "faint scars hinting at past adventures",
        "small birthmarks near the collarbone",
        "a few subtle moles",
        "an almost unblemished complexion"
    ];
    
	
    // Choose one or two random features.
    var featureCount = irandom_range(1, 2);
	var choosen = choose_from_distinct(possibleFeatures, featureCount);
    for (var i = 0; i < featureCount; i++) {
        array_push(_skin.features, choosen[i]);
    }
}
