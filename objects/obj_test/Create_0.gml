scr_setup_text_scene();


var scene = new Scene(
    new SceneLighting(0.8, ["the candelabras", "wall-mounted torches"]),
    new SceneSound(0.7, ["the chatter of guests", "the hum of a lute", "the rustling of the wind"]),
    new SceneSpaceDensity(0.6, ["the crowded dance floor", "the tables filled with revelers"]),
    new SceneVisualHazards(0.6, ["the shifting shadows of the dancers", "the musicians of the band", "the nearest table of people"]),
    new SceneAuditoryHazards(0.2, ["the shifting shadows of the dancers", "the musicians of the band", "the nearest table of people"])
);

global.chat.send("Narrator", scene.make_full_decription());

new_word_variant("npcname", ["Akk'uli"]);
array_choose(PersonalityTraitType.all_instances).setup_variants();

global.chat.send("Narrator", generate_phrase_with_variants(
	"\n  Across the room you find the familiar |trait_caracteristic| smile of |npcname|. Who |trait_caracteristicly|, holded a conversation across the room."
));