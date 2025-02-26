function ecs_action_verb_to_used_field(_action_verb) {
	return "player_used_" +
	string_replace_all(
	string_replace_all(
	string_replace_all(
	string_replace_all(
	string_replace_all(
	string_replace_all(
		_action_verb,
		" {name}", ""),
		" {name1}", ""),
		" {name2}", ""),
		" {name3}", ""),
		" {name4}", ""),
		" ", "_")
	;	
}