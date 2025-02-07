function Body() constructor {
	value_of_preference_for = new TentEncTagValues();
	
	static prefernce_for = function(_tags) {
		var _total = 0;
		
		for (var i = 0; i < array_length(_tags); i++) {
			if (value_of_preference_for.is_valid(_tags[i])) {
				_total += value_of_preference_for.get(_tags[i]);
			}
		}
		
		return _total;
	}
}
