function scr_describe_character_reaction(character) {
    var reaction = character.name + " ";
    if (character.arousal > 30) {
        reaction += choose("gasps softly, leaning into your touch.", "bites her lip, eyes half-lidded.");
    } else {
        reaction += choose("shifts slightly, watching you.", "lets out a quiet breath.");
    }
    scr_inform(reaction);
}