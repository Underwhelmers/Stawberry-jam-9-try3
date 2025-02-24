function scr_setup_word_variants_for_encounter(){	
    // Human-specific reaction words for banging actions
    new_word_variant("wait",["wait", "hold", "stop", "hang in there", "slow down", "halt", "not so fast"])
    
    // Emotional Sounds (Mmm equivalents)
    new_word_variant("mmm", ["mmm", "ooh", "ahh", "oh, yes", "right there"]); // Pleasure sounds
    
    // Verbs: Emotional Reactions
    new_word_variant_from_verb("moan", ["moan", "groan", "whimper"]); // Audible emotional responses
    new_word_variant_from_verb("want", ["want", "desire", "crave"]); // Expressing need
    
    // Verbs: Movement/Position
    new_word_variant_from_verb("align", ["align", "position", "adjust"]); // Set orientation
	
    new_word_variant("nope", ["nope", "nop", "nu-uh"]); // Seeking response
    
    // Emotional/Intimate States
    new_word_variant_from_adj("hot", ["hot", "warm", "heated"]); // Temperature or passion
    new_word_variant_from_noun("need", ["need", "urge", "hunger"]); // Strong desire
	
	new_word_variant("hello", ["hello", "hi", "hey", "howdy"]); // Simple hello variants
	new_word_variant("formal_hello", ["hello", "greetings", "salutations"]); // Simple hello variants

	new_word_variant("nice to meet you", [
		"nice to meet you",
		"it's a pleasure to meet you",
	]);
	
	new_word_variant("mhm", ["mhm", "yeah", "uh-huh", "yes", "i see"]);
}