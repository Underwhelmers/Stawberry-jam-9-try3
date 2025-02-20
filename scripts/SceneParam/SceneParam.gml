function SceneParam(_intensity, _sources) constructor {
    static stages = [""]; // Default stages

    value = clamp(_intensity,0,1);       // how high or low is this parameter.
    sources = _sources;                  // What is increasing this parameter value.
    sources_vb = new ValueBag(sources);  // What is increasing this parameter value.
    describe_format = "{0} {1}"; // Default format
	current_stage = "";

    static describe = function() {
        if (value == 0) return stages[0]; // Early return for zero intensity
        var source_text = array_length(sources) > 0 ? text_list_of_comas(array_shuffle(sources)) : "";
        return string(describe_format, current_stage, source_text);
    };

    static one_source = function() {
        return sources_vb.get();
    };
}

function SceneLighting(_intensity, _sources) : SceneParam(_intensity, _sources) constructor {
    static stages = ["unlit", "dimly", "moodly", "well", "brightly", "shadowless"];
    current_stage = stages[ceil(value * (array_length(stages) - 1))];
    describe_format = "{0} lit by {1}";
}

function SceneSound(_intensity, _sources) : SceneParam(_intensity, _sources) constructor {
    static stages = ["silent", "barely audible", "murmuring", "loud", "deafening"];
    current_stage = stages[ceil(value * (array_length(stages) - 1))];
    describe_format = "{0} sounds of {1}";
}

function SceneSpaceDensity(_intensity, _sources) : SceneParam(_intensity, _sources) constructor {
    static stages = ["empty", "sparsely populated", "moderately crowded", "packed", "overcrowded"];
    current_stage = stages[floor(value * (array_length(stages) - 1))];
    describe_format = "{0}, with {1}";
}

function SceneVisualHazards(_intensity, _sources) : SceneParam(_intensity, _sources) constructor {
    static stages = ["out of prying eyes", "hidden", "hard to see", "easy to see", "out in the open"];
    current_stage = stages[floor(value * (array_length(stages) - 1))];
    describe_format = "{0} for {1}";
}

function SceneAuditoryHazards(_intensity, _sources) : SceneParam(_intensity, _sources) constructor { 
    static stages = ["out of hearing range", "quietly masked", "moderately audible", "loud and clear", "easy to overhear"];
    current_stage = stages[floor(value * (array_length(stages) - 1))];
    describe_format = "{0} for {1}";
}
