function TentEncBodyHair(_style, _color, _ubication, _features) constructor {
	style = _style;         // Hair style descriptor
	color = _color;         // Hair color (using a built-in constant)
	features = _features;   // Hair features
	ubication = _ubication; // Hair ubication
}

// Generates random hair features.
function scr_tentenc_hair_generate_random_features(_body, _hair) {
    // A list of possible hair features.
    var possibleHairFeatures = [
        "intricate braids woven through the locks",
        "delicate rings threaded among the hair",
        "naturally wavy strands framing the face",
        "thick, dense hair cascading down",
        "a sparse, artful growth hinting at effortless style"
    ];
    
    // Choose one or two random features.
    var featureCount = irandom_range(1, 2);
	var choosen = choose_from_distinct(possibleHairFeatures, featureCount);
    for (var i = 0; i < featureCount; i++) {
        array_push(_hair.features, choosen[i]);
    }
}
