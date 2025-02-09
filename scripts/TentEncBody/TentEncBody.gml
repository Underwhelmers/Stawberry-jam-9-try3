function TentEncBody(_specie) {
	specie = _specie;
	height = specie.random_height(); // Height in meters
	build = TentEncBodyBuild.ATHLETIC();
	genital = new TentEncBodyGenital();
	skin = new TentEncBodySkin(
		make_color_rgb(255, 219, 172),
		choose_from(specie.available_skin_textures),
		array_clone(specie.skin_features)
	);
	hair = new TentEncBodyHair(
		TentEncBodyHairStyle.CURLY, c_black,
		TentEncBodyUbication.HEAD,
		array_clone(specie.hair_features)
	);
	
	morph_state = TentEncBodyState.NORMAL;
	breathing_rate = 1.0;
	skin_color_blend = c_white;
	eyes = new TentEncBodyEyes(array_clone(specie.eyes_features));
	
	muscular_tension = 0.5; // 0 (limp) to 1 (shaking with effort)
	natural_expression = TentEncBodyExpression.NEUTRAL;
	expression = TentEncBodyExpression.NEUTRAL;
	
	scr_tentenc_skin_generate_random_features(self, skin);
	scr_tentenc_hair_generate_random_features(self, hair);
	scr_tentenc_eyes_generate_random_features(self, eyes);
};


function scr_generate_body_description(body) {
    // Determine if this is the first description (no lastState stored)
    var isFirst = false;
    if (!variable_instance_exists(body, "lastState") || body.lastState == undefined) {
        isFirst = true;
        body.lastState = {};
    }

    // We'll collect description lines in an array so that we can randomize the order later.
    var desc_lines = [];
	var repeat_chance = 0.2;
    
    // -- Build Description --
    var buildChanged = isFirst || (body.build.descriptor != body.lastState.build);
    if (buildChanged) {
        array_push(desc_lines, "Your " + body.build.descriptor + " build is striking: broad shoulders measured at " + string(body.build.shoulder_width) +
                    " and well-proportioned hips at " + string(body.build.hip_width) + ", all anchored by a subtly curved spine (" + string(body.build.spine_curvature) + ").");
    } else if (success(repeat_chance)) {
        array_push(desc_lines, "You note with quiet satisfaction that your " + body.build.descriptor + " build remains familiar and steady.");
    }
    
    // -- Genital Description --
    var genitalChanged = isFirst || (body.genital.size != body.lastState.genital_size) || (body.genital.elasticity != body.lastState.genital_elasticity);
    if (genitalChanged) {
        array_push(desc_lines, "A recent shift is evident in your intimate area, now scaled to a size of " + string(body.genital.size) +
                    " with an elasticity rating of " + string(body.genital.elasticity) + ".");
    } else if (success(repeat_chance)) {
        array_push(desc_lines, "Your intimate features retain the familiar balance of size and sensitivity.");
    }
    
    // -- Skin Description --
    var skinChanged = isFirst || (body.skin.color != body.lastState.skin_color) || (body.skin.texture.identifier != body.lastState.skin_texture);
    if (skinChanged) {
        array_push(desc_lines, "Your skin now carries a tone of " + string(body.skin.color) + " combined with a " + body.skin.texture.descriptor +
                    " feel—a change that is as striking as it is unexpected.");
    } else if (success(repeat_chance)) {
        array_push(desc_lines, "Your skin, with its steady tone and " + body.skin.texture.descriptor + " texture, remains a constant canvas.");
    }
    
    // -- Hair Description --
    var hairChanged = isFirst || (body.hair.color != body.lastState.hair_color) || (body.hair.style.identifier != body.lastState.hair_style);
    if (hairChanged) {
        array_push(desc_lines, "A noticeable update in your hair—styled in " + body.hair.style.descriptor +
                    " and tinted " + string(body.hair.color) + "—draws the eye.");
    } else if (success(repeat_chance)) {
        array_push(desc_lines, "Your hair, reliably " + body.hair.style.descriptor + ", frames your face as it always has.");
    }
    
    // -- Eyes Description --
    var eyesChanged = isFirst || (body.eyes.state != body.lastState.eyes_state);
    if (eyesChanged) {
        array_push(desc_lines, "Your eyes, now more " + body.eyes.state + " than before, hint at an inner shift of emotion.");
    } else if (success(repeat_chance)) {
        array_push(desc_lines, "Your eyes continue to hold their customary " + body.eyes.state + " look.");
    }
    
    // -- Expression and State (e.g., aroused/normal) --
    var stateChanged = isFirst || (body.morph_state != body.lastState.morph_state) || (body.expression.descriptor != body.lastState.expression);
    if (stateChanged) {
        array_push(desc_lines, "There’s an unmistakable aura about you as you shift into a " + body.morph_state +
                    " state, with your expression now leaning towards " + body.expression.descriptor + ".");
    } else if (success(repeat_chance)) {
        array_push(desc_lines, "The subtle cues in your expression reflect the steady state you’ve grown accustomed to.");
    }
    
    // -- Additional Random Details from Features --
    // Assume TentEncBodyFeatures.get_one() returns a random string (or empty) from the features array.
    var extraSkinFeature = TentEncBodyFeatures.get_one(body.skin.features);
    if (extraSkinFeature != "") {
        if (success(repeat_chance)) {
            array_push(desc_lines, "On closer inspection, your skin shows " + extraSkinFeature + ".");
        }
    }
    var extraHairFeature = TentEncBodyFeatures.get_one(body.hair.features);
    if (extraHairFeature != "") {
        if (success(repeat_chance)) {
            array_push(desc_lines, "Your hair carries " + extraHairFeature + " that catches the light in unexpected ways.");
        }
    }
    
    // -- Shuffle the Description Lines for Unpredictability --
    desc_lines = shuffle_array(desc_lines);
    
    // Concatenate lines into a single description string.
    var description = "";
    for (var i = 0; i < array_length(desc_lines); i++) {
        description += desc_lines[i] + "\n";
    }
    
    // -- Update the lastState snapshot for future comparisons --
    body.lastState.skin_color         = body.skin.color;
    body.lastState.skin_texture       = body.skin.texture.identifier;
    body.lastState.hair_color         = body.hair.color;
    body.lastState.hair_style         = body.hair.style.identifier;
    body.lastState.eyes_state         = body.eyes.state;
    body.lastState.expression         = body.expression.descriptor;
    body.lastState.morph_state        = body.morph_state;
    body.lastState.breathing_rate     = body.breathing_rate;
    body.lastState.genital_size       = body.genital.size;
    body.lastState.genital_elasticity = body.genital.elasticity;
    body.lastState.build              = body.build.descriptor;
    
    return description;
}
