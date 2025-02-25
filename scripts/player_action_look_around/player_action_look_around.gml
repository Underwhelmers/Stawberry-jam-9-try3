function player_action_look_around(scene) {
    var desc = scene.name + "\n" + scene.base_description + " ";
    desc += scene.details[irandom(array_length(scene.details) - 1)]; // Random detail
    scr_inform(desc);
}