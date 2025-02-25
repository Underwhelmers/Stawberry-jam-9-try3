function scr_setup_name_generators() {
	global.name_generators = {
		for_kobolds: new NameGenerator([
		    ["S", "K", "V", "L", "Z", "Sh", "Kl", "Vr", "Sy", "T"],
		    ["i", "e", "a", "y", "ee", "ia", "ira", "ys", "o"],
		    ["ra", "ss", "z", "n", "sh", "ka", "si", "th", "r", ""]
		]),
		for_goblins: new NameGenerator([
		
		]),
		// ...
	};
}