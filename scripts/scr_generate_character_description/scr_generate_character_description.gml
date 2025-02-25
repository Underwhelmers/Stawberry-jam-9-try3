function scr_generate_character_description(character_name) {
    return generate_phrase_with_variants(
		character_name+" stands before you with |character_hair_color| hair and |character_eye_color| eyes. Her |character_body_type| form is |character_arousal|."
	);
}