function scr_generate_scene_description() {
    return generate_phrase_with_variants(
		"You find yourself in a |scene_lighting| room with a |scene_furniture|. |Scene_sound| fills the air, and |scene_scent| teases your senses. The atmosphere is |scene_atmosphere|."
	);
}