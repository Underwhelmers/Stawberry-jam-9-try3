function PersonalityTraitType(_name, _adverbs, _adjectives) constructor {
	name = _name;              // Name of the trait.
	adverbs = _adverbs;        // Adverbs of applying the trait.
	adjectives = _adjectives;  // Adjectives that modify an action when exhibiting this trait.
	
	new_word_variant(name+"_adv", adverbs);
	new_word_variant(name+"_adj", adjectives);
	
	static set_variants = function() {
		new_word_variant("trait_adv", adverbs);
		new_word_variant("trait_adj", adjectives);
	}
	
	
	static all_instances = [];
	array_push(all_instances, self);

}

	PersonalityTraitType.Shy = new PersonalityTraitType( "shy",  
		[ "hesitantly", "nervously", "timidly", "bashfully", "cautiously", "meekly", "anxiously", "falteringly", "uncertainly", "apprehensively", "reluctantly", "shyly", "demurely", "reservedly"], 
		[ "bashful", "reserved", "flustered", "timid", "meek", "anxious", "self-conscious", "withdrawn", "blushing", "diffident", "sheepish", "soft-spoken", "unassertive", "hesitant", "introverted" ]
	);