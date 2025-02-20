function PersonalityTraitType(_name, _adverbs, _adjectives) constructor {
	name = _name;              // Name of the trait.
	adverbs = _adverbs;        // Adverbs of applying the trait.
	adjectives = _adjectives;  // Adjectives that modify an action when exhibiting this trait.
	
	new_word_variant(name+"_adv", adverbs);
	new_word_variant(name+"_adj", adjectives);
	
	static setup_variants = function() {
		global.chat.send("INFO", string("{0} trait is active.", name));
		new_word_variant("trait_adv", adverbs);
		new_word_variant("trait_adj", adjectives);
		
		new_word_variant("trait_caracteristicly", adverbs);
		new_word_variant("trait_caracteristic", adjectives);
	}
	
	static all_instances = [];
	array_push(all_instances, self);
}

function scr_setup_personality_trait_types() {
PersonalityTraitType.Shy = new PersonalityTraitType("shy",  
	[ "hesitantly", "nervously", "timidly", "bashfully", "cautiously", "meekly", "anxiously", "falteringly", "uncertainly", "apprehensively", "reluctantly", "shyly", "demurely", "reservedly"], 
	[ "bashful", "reserved", "flustered", "timid", "meek", "anxious", "self-conscious", "withdrawn", "blushing", "diffident", "sheepish", "soft-spoken", "unassertive", "hesitant", "introverted" ]
);
PersonalityTraitType.Eager = new PersonalityTraitType(
	"eager",  
	["enthusiastically", "excitedly", "impatiently", "keenly", "eagerly", "ardently", "vigorously", "restlessly", "zealously", "hungrily", "fervently", "animatedly", "expectantly", "rapturously", "briskly"],  
	["fervent", "anticipatory", "hungry", "zealous", "restless", "passionate", "impulsive", "energetic", "spirited", "exuberant", "avid", "thrilled", "heated", "hyperactive", "elated"]
);
PersonalityTraitType.Polite = new PersonalityTraitType(
	"polite",  
	["courteously", "gracefully", "gently", "politely", "civilly", "cordially", "elegantly", "tactfully", "diplomatically", "suavely", "charmingly", "pleasantly", "considerately", "delicately", "refinedly"],  
	["respectful", "refined", "gracious", "courteous", "well-mannered", "cultured", "chivalrous", "dignified", "suave", "proper", "gallant", "urbane", "thoughtful", "deferential", "mannerly"]
);
PersonalityTraitType.Rude = new PersonalityTraitType(
	"rude",  
	["roughly", "bluntly", "insensitively", "brashly", "gruffly", "coarsely", "crudely", "disrespectfully", "snappishly", "callously", "boorishly", "impolitely", "obnoxiously", "tactlessly", "scornfully"],  
	["abrasive", "harsh", "impatient", "blunt", "brusque", "gruff", "insolent", "crass", "disrespectful", "ill-mannered", "uncouth", "churlish", "curt", "offhand", "boorish"]
);
PersonalityTraitType.Submissive = new PersonalityTraitType(
	"submissive",  
	["obediently", "meekly", "deferentially", "dutifully", "humbly", "passively", "servilely", "reverently", "compliantly", "timidly", "subserviently", "self-effacingly", "respectfully", "yieldingly", "pliantly"],  
	["yielding", "docile", "compliant", "obedient", "acquiescent", "pliant", "servile", "humble", "passive", "deferent", "self-sacrificing", "soft-spoken", "agreeable", "timorous", "supplicant"]
);
PersonalityTraitType.Dominant = new PersonalityTraitType(
	"dominant",  
	["commandingly", "assertively", "possessively", "authoritatively", "forcefully", "demandingly", "decisively", "imperiously", "commandingly", "confidently", "insistently", "sternly", "controllingly", "intimidatingly", "domineeringly"],  
	["controlling", "firm", "demanding", "authoritative", "commanding", "assertive", "powerful", "unyielding", "decisive", "intimidating", "strict", "masterful", "bossy", "domineering", "forceful"]
);
PersonalityTraitType.Possessive = new PersonalityTraitType(
	"possessive",  
	["clingingly", "jealously", "protectively", "fiercely", "obsessively", "demandingly", "watchfully", "possessively", "controllingly", "insistently", "dominantly", "devotedly", "exclusively", "graspingly", "desperately"],  
	["territorial", "needy", "guarded", "clingy", "obsessive", "demanding", "controlling", "overbearing", "jealous", "domineering", "overprotective", "insecure", "watchful", "fixated", "suffocating"]
);
PersonalityTraitType.EasyGoing = new PersonalityTraitType(
	"easy-going",  
	["casually", "lazily", "nonchalantly", "lightheartedly", "leisurely", "effortlessly", "coolly", "unconcernedly", "smoothly", "unhurriedly", "mellowly", "apathetically", "airily", "calmly", "freely"],  
	["relaxed", "carefree", "laid-back", "chill", "unbothered", "apathetic", "mellow", "serene", "unfazed", "patient", "detached", "amiable", "easygoing", "lenient", "placid"]
);
PersonalityTraitType.Teaser = new PersonalityTraitType(
	"teaser",  
	["playfully", "mischievously", "tauntingly", "teasingly", "naughtily", "impishly", "provocatively", "cheekily", "flirtatiously", "coyly", "slyly", "wittily", "racy", "saucy", "alluringly"],  
	["flirtatious", "provocative", "cheeky", "suggestive", "impish", "coy", "playful", "mischievous", "enticing", "tempting", "teasing", "naughty", "sassy", "fascinating", "daring"]
);
PersonalityTraitType.Caring = new PersonalityTraitType(
	"caring",  
	["gently", "affectionately", "tenderly", "lovingly", "compassionately", "kindly", "nurturingly", "softly", "sympathetically", "caringly", "warmly", "patiently", "soothingly", "comfortingly"],  
	["nurturing", "warm", "attentive", "compassionate", "loving", "kind", "tender", "gentle", "sympathetic", "considerate", "thoughtful", "supportive", "empathetic", "protective", "soothing"]
);
PersonalityTraitType.Cold = new PersonalityTraitType(
	"cold",  
	["indifferently", "detachedly", "stoically", "apathetically", "blandly", "emotionlessly", "unconcernedly", "dispassionately", "unemotionally", "uncompassionately", "robotically", "uninterestedly"],  
	["aloof", "unfeeling", "emotionless", "distant", "cold-hearted", "impersonal", "uncaring", "unsympathetic", "numb", "remote", "detached", "robotic", "unemotional"]
);
PersonalityTraitType.Lustful = new PersonalityTraitType(
	"lustful",  
	["hungrily", "needily", "desperately", "yearningly", "eagerly", "fervently", "lustily", "longingly", "seductively", "impulsively", "obsessively", "wildly"],  
	["passionate", "intense", "heated", "desirous", "aroused", "ravenous", "sensual", "frenzied", "raging", "fiery", "consumed", "alluring", "insatiable"]
);
PersonalityTraitType.Reserved = new PersonalityTraitType(
	"reserved",  
	["reluctantly", "carefully", "cautiously", "hesitantly", "withdrawn", "safely", "tentatively", "inhibited", "quietly", "indifferently"],  
	["modest", "guarded", "conservative", "shy", "reticent", "discreet", "introverted", "restrained", "stoic", "unemotional", "reclusive"]
);
PersonalityTraitType.Aggressive = new PersonalityTraitType(
	"aggressive",  
	["forcefully", "demandingly", "roughly", "angrily", "violently", "harshly", "hostilely", "intimidatingly", "confrontationally", "belligerently"],  
	["intense", "fierce", "unyielding", "combative", "overbearing", "domineering", "reckless", "brutal", "ruthless", "agitated"]
);
PersonalityTraitType.Flirty = new PersonalityTraitType(
	"flirty",  
	["suggestively", "charmingly", "coyly", "playfully", "teasingly", "seductively", "mischievously", "enticingly", "provocatively", "cheekily"],  
	["alluring", "sultry", "inviting", "tempting", "captivating", "seductive", "enticing", "teasing", "appealing", "beguiling"]
);
PersonalityTraitType.Manipulative = new PersonalityTraitType(
	"manipulative",  
	["deceptively", "persuasively", "smoothly", "subtly", "craftily", "insidiously", "slyly", "covertly", "calculatingly", "schemingly"],  
	["cunning", "calculating", "coaxing", "scheming", "crafty", "deceptive", "manipulative", "subversive", "conniving", "underhanded"]
);
PersonalityTraitType.Greedy = new PersonalityTraitType( // fix
	"greedy", 
	["selfishly", "possessively", "demandingly", "avariciously", "insatiably", "gluttonously", "materialistically", "graspingly", "covetously", "ravenously"], 
	["insatiable", "hoarding", "self-indulgent", "avaricious", "greedy", "gluttonous", "materialistic", "covetous", "ravenous", "consuming"]
);
PersonalityTraitType.Clumsy = new PersonalityTraitType(
	"clumsy", 
	["awkwardly", "fumblingly", "unintentionally", "bunglingly", "carelessly", "disjointedly", "clumsily", "ungracefully", "stumblingly", "imprecisely"], 
	["goofy", "uncoordinated", "accidental", "clumsy", "graceless", "inept", "disorganized", "fumbled", "ungainly", "unskillful"]
);
PersonalityTraitType.Cocky = new PersonalityTraitType(
	"cocky", 
	["smugly", "confidently", "boldly", "conceitedly", "overconfidently", "boastfully", "self-importantly", "proudly", "flamboyantly", "arrogantly"], 
	["arrogant", "self-assured", "brash", "haughty", "conceited", "egotistical", "vain", "pompous", "self-important", "supercilious"]
);
PersonalityTraitType.Moody = new PersonalityTraitType(
	"moody", 
	["erratically", "temperamentally", "unpredictably", "fickly", "changeably", "whimsically", "capriciously", "hot-and-cold", "moody", "inconstantly"], 
	["sensitive", "volatile", "brooding", "irritable", "moody", "whiny", "pouty", "mood-swinging", "testy", "surly"]
);
PersonalityTraitType.Anxious = new PersonalityTraitType(
	"anxious", 
	["worriedly", "fretfully", "restlessly", "uneasily", "nervously", "apprehensively", "jitterily", "edgily", "tensely", "agitatedly"], 
	["nervous", "tense", "uneasy", "fidgety", "on-edge", "jumpy", "restive", "distracted", "concerned", "overwhelmed"]
);
PersonalityTraitType.Dirty = new PersonalityTraitType(
	"dirty", 
	["lewdly", "filthily", "obscenely", "crassly", "vulgarly", "raunchily", "naughtily", "provocatively", "coarsely", "salaciously"], 
	["vulgar", "shameless", "perverse", "obscene", "coarse", "indecent", "immoral", "raunchy", "depraved", "unrefined"]
);
PersonalityTraitType.Sultry = new PersonalityTraitType(
	"sultry", 
	["seductively", "breathily", "sensually", "provocatively", "languidly", "teasingly", "warmly", "intimately", "softly", "voluptuously"], 
	["tempting", "alluring", "smoky", "enticing", "captivating", "sensuous", "fiery", "smoldering", "irresistible", "mesmerizing"]
);
PersonalityTraitType.Needy = new PersonalityTraitType(
	"needy", 
	["desperately", "yearningly", "wantingly", "longingly", "eagerly", "cravingly", "helplessly", "obsessively", "insistently", "fervently"], 
	["clingy", "impatient", "starved", "dependent", "needy", "overbearing", "hungry", "obsessive", "neurotic", "possessive"]
);
PersonalityTraitType.Risky = new PersonalityTraitType(
	"risky", 
	["recklessly", "boldly", "exhibitionistically", "fearlessly", "bravely", "impulsively", "courageously", "adventurously", "headlong", "audaciously"], 
	["daring", "adventurous", "thrill-seeking", "audacious", "fearless", "reckless", "impetuous", "intrepid", "brash", "wild"]
);
PersonalityTraitType.Rough = new PersonalityTraitType(
	"rough", 
	["forcefully", "demandingly", "fiercely", "brutally", "harshly", "violently", "sternly", "unrelentingly", "bluntly", "savagely"], 
	["intense", "aggressive", "feral", "raw", "gritty", "ruthless", "uncompromising", "barbaric", "unforgiving", "wild"]
);
PersonalityTraitType.Smothering = new PersonalityTraitType(
	"smothering", 
	["overwhelmingly", "possessively", "dominantly", "stiflingly", "all-encompassing", "saturatingly", "inundatingly", "overbearingly", "insistently", "consuming"], 
	["suffocating", "clingy", "overpowering", "stifling", "obsessive", "overindulgent", "domineering", "controlling", "oppressive", "excessive"]
);
PersonalityTraitType.Experienced = new PersonalityTraitType(
	"experienced", 
	["knowingly", "expertly", "masterfully", "seasonedly", "proficiently", "adeptly", "competently", "savvily", "strategically", "confidently"], 
	["skilled", "confident", "practiced", "proficient", "seasoned", "talented", "accomplished", "adept", "savvy", "knowledgeable"]
);
PersonalityTraitType.Playful = new PersonalityTraitType(
	"playful", 
	["cheekily", "naughtily", "jokingly", "lightheartedly", "frolicsome", "teasingly", "whimsically", "funny", "playfully", "spiritedly"],
	["mischievous", "fun-loving", "teasing", "jovial", "whimsical", "spirited", "energetic", "lively", "frivolous", "carefree"]
);
PersonalityTraitType.Naive = new PersonalityTraitType(
	"naive", 
	["innocently", "gullibly", "ignorantly", "naively", "childishly", "trustingly", "unawarely", "unassumingly", "credulously"],
	["innocent", "gullible", "trusting", "unsuspecting", "wide-eyed", "unworldly", "ignorant", "simple-minded", "unquestioning"]
);
PersonalityTraitType.Forward = new PersonalityTraitType(
	"forward", 
	["bluntly", "directly", "openly", "boldly", "straightforwardly", "unabashedly", "honestly", "candidly", "frankly"],
	["outspoken", "honest", "unreserved", "blunt", "frank", "direct", "uninhibited", "bold", "courageous"]
);
PersonalityTraitType.Keen = new PersonalityTraitType(
	"keen", 
	["eagerly", "intensely", "sharply", "enthusiastically", "quickly", "alertly", "vigorously", "vividly"],
	["observant", "alert", "enthusiastic", "sharp", "insightful", "keen-eyed", "perceptive", "excitable", "engaged"]
);
PersonalityTraitType.Romantic = new PersonalityTraitType(
	"romantic", 
	["passionately", "affectionately", "lovingly", "dreamily", "tenderly", "adoringly", "fondly", "gently"],
	["charming", "sentimental", "devoted", "loving", "affectionate", "idealistic", "thoughtful", "swept-up", "whimsical"]
);
PersonalityTraitType.Perverted = new PersonalityTraitType(
	"perverted", 
	["lecherously", "depravedly", "lustfully", "obsessively", "perversely", "wickedly", "obscenely", "shamelessly"],
	["depraved", "wicked", "obsessive", "corrupt", "vulgar", "taboo-breaking", "raunchy", "kinky", "immoral"]
);
PersonalityTraitType.Affectionate = new PersonalityTraitType(
	"affectionate", 
	["lovingly", "fondly", "tenderly", "gently", "endearingly", "warmly", "softly"],
	["caring", "devoted", "warm-hearted", "loving", "touchy-feely", "gentle", "nurturing", "compassionate"]
);
PersonalityTraitType.Agreeable = new PersonalityTraitType(
	"agreeable", 
	["amicably", "pleasantly", "cooperatively", "harmoniously", "cheerfully", "graciously"],
	["friendly", "pleasant", "affable", "compromising", "cooperative", "easygoing", "charming", "likable"]
);
}