function scr_setup_scene(){
	// Species
	var tentacled_beings = new Species("Tentacled Beings", ["tentacles"], ["group intimacy"], ["tactile"]);

	// Culture
	var tentacled_culture = new Culture("Tentacled Culture", ["pre-intercourse dance"], ["group intimacy"], ["scent marking"]);

	// Character
	var lara = new Character("Lara", tentacled_beings, "shy", "Lara seeks to indulge her hidden desires.", ["sensory play"]);

	// Anatomy
	var tentacles = new Anatomy("tentacles", "Slick, writhing tendrils", "used for intimate entwining");

	// Fetish
	var sensory_play = new Fetish("Sensory Play", "Relishing intense sensory stimulation", ["Tentacled Beings"]);

	// Location
	var bed = new Location("Bed", "A plush bed with silken sheets, lit by flickering candles.", []);

	// Item
	var aromatic_oil = new Item("aromatic_oil", "A vial of musky, intoxicating oil.", ["apply"]);

	// Game State
	global.game_state.current_location = bed;
	global.game_state.characters = [lara];
	global.game_state.items = [aromatic_oil];
	global.game_state.events = [];

	// Event: Using oil on Lara
	var oil_event = new NarrativeEvent(
	    function() {
	        return (global.last_action == "use" && global.last_target == "Aromatic Oil" && global.last_character == "Lara");
	    },
	    function() {
	        scr_chat("GAME","Lara moans softly as the aromatic oil glistens on her tentacles, her shyness melting away.");
	    }
	);
	
	array_push(global.game_state.events, oil_event);
}