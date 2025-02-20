function NameGenerator(_array_of_arrays_of_string) constructor {
	stages_count = array_length(_array_of_arrays_of_string);
	stages = array_create(stages_count);
	for (var i = 0; i < stages_count; i++) {
		stages[i] = new ValueBag(_array_of_arrays_of_string[i]);
	}
	
	static generate = function() {
		var final_name = "";
		for (var i = 0; i < stages_count; i++) {
			final_name += stages[i].get();
		}
		return final_name;
	};
}
