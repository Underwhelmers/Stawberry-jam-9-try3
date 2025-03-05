function random_cleanliness() { return random_range(0.2, 0.9); }
function random_mood_state() { return choose("happy", "angry", "sad", "excited"); }
function random_desire() { return choose("neutral", "aroused", "repulsed"); }
function random_proactivity() { return random_range(0.2, 0.8); }
function random_jealousy_intensity() { return random_range(0, 0.5); }
function random_affinity() { return random_range(-0.5, 0.8); }
function random_intimacy() { return random_range(0, 0.6); }
function random_attraction() { return random_range(0, 0.7); }
function random_jealousy() { return random_range(0, 0.4); }
function random_jealousy_tendency() { return random_range(0.3, 0.9); }
function random_fluid_intensity() { return random_range(0, 0.5); }
function random_fetish() { return array_shuffle_return_first_n(["roleplay", "bondage", "public", "oral", "anal"], 1 + irandom(2)); }
function random_cultural_norm() { return choose("conservative", "libertine", "taboo", "neutral"); }
function random_social_openness() { return random_range(0.2, 0.8); }

// Helper to shuffle array and return first N elements
function array_shuffle_return_first_n(_array, _n) {
    var temp = array_shuffle(_array);
    var result = array_create(_n);
    for (var i = 0; i < min(_n, array_length(temp)); i++) {
        result[i] = temp[i];
    }
    return result;
}