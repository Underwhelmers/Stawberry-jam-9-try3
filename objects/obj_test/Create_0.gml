var scene = new Scene(
    new SceneLighting(0.8, ["the candelabras", "wall-mounted torches"]),
    new SceneSound(0.7, ["the chatter of guests", "the hum of a lute", "the rustling of the wind"]),
    new SceneSpaceDensity(0.6, ["the crowded dance floor", "the tables filled with revelers"]),
    new SceneVisualHazards(0.6, ["the shifting shadows of the dancers", "the musicians of the band", "the nearest table of people"]),
    new SceneAuditoryHazards(0.2, ["the shifting shadows of the dancers", "the musicians of the band", "the nearest table of people"])
);

global.chat.send("Narrator", scene.make_full_decription());