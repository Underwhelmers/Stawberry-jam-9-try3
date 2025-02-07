function TentEncTagValues() constructor {
	tags = [];
	values = ds_map_create();
	
	static set = function(_tag, _value) {
		if (!ds_map_exists(values,_tag))
			array_push(tags, _tag);
		values[? _tag] = _value;
	};
	static get = function(_tag) {
		return values[? _tag];
	};
	static remove = function(_tag) {
		if (!ds_map_exists(values,_tag))
			return;
		
		tags = array_remove(tags,_tag);
		ds_map_delete(values,_tag);
	};
	static is_valid = function(_tag) {
		for (var i = 0; i < array_length(tags); i++) {
			if (tags[i].is_valid(_tag))
				return true;
		}
		return false;
	}
}
