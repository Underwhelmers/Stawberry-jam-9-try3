function ActionCommand() constructor {
    actor = "You";             // Default to player if unspecified
	character_type = "player"; // Default to player if unspecified
    action = "";               // The action verb (e.g., "look", "touch")
    targets = [];              // Array of targets (e.g., ["Lara", "breasts"])
    modifier = "";             // Optional adjective (e.g., "gently")
	unknown_words = [];        // All words that were wrongnly tokenized;
	
	static toString = function() {
		return string(
			"Actor '{0}'({1}) uses '{2}', in ['{3}'], with modifier '{4}', UNKNOWN: ['{5}']",
			actor, character_type, action,
			string_join_ext("', '",targets),
			modifier,
			string_join_ext("', '",unknown_words)
		)
	}
}