function scr_setup_character_body_parts() {	
    // --- Body Parts ---
	CharacterBodyParts.anus    = new CharacterBodyParts("anus", "A tight, puckered opening.", "an anus", ["is_cavity"]);
    CharacterBodyParts.mouth   = new CharacterBodyParts("mouth", "A soft, dextrous opening.", "a mouth", ["is_cavity"]);
    CharacterBodyParts.chest   = new CharacterBodyParts("chest", "A broad, toned expanse.", "a chest");
    CharacterBodyParts.nipples = new CharacterBodyParts("nipples", "Small, sensitive buds.", "nipples");
	CharacterBodyParts.hands   = new CharacterBodyParts("hands", "Nimble, dexterous fingers.", "hands");
	CharacterBodyParts.thighs  = new CharacterBodyParts("thighs", "Thick, muscular curves.", "thighs");
	CharacterBodyParts.ass     = new CharacterBodyParts("ass", "A firm, rounded backside.", "an ass");
	CharacterBodyParts.lips    = new CharacterBodyParts("lips", "Soft, plump lips.", "lips");
	CharacterBodyParts.tongue  = new CharacterBodyParts("tongue", "A wet, agile muscle.", "a tongue", ["is_phallus"]);
    CharacterBodyParts.neck    = new CharacterBodyParts("neck", "A slender, sensitive column.", "a neck");
	
    CharacterBodyParts.breasts = new CharacterBodyParts("breasts", "Soft, rounded mounds.", "breasts");
	CharacterBodyParts.vagina  = new CharacterBodyParts("vagina", "A slick, welcoming passage.", "a vagina", ["is_cavity"]);
	CharacterBodyParts.cloeca  = new CharacterBodyParts("cloeca", "A tight, well hiden cave.", "a cloeca", ["is_cavity"]);
    CharacterBodyParts.dick    = new CharacterBodyParts("dick", "A firm, pulsing shaft.", "a dick", ["is_phallus"]);
	
	CharacterBodyParts.beak      = new CharacterBodyParts("beak", "A rigid, magestic beak.", "a beak", ["is_cavity"]); 
    CharacterBodyParts.tentacles = new CharacterBodyParts("tentacles", "Slick, writhing tendrils.", "tentacles", ["is_phallus"]);
    CharacterBodyParts.wings     = new CharacterBodyParts("wings", "Feathered, majestic wings.", "wings");
    CharacterBodyParts.horns     = new CharacterBodyParts("horns", "Curved, imposing horns.", "horns");
    CharacterBodyParts.tail      = new CharacterBodyParts("tail", "A long, sinuous appendage.", "a tail", ["is_phallus"]); 
    CharacterBodyParts.claws     = new CharacterBodyParts("claws", "Sharp, curved talons.", "claws");
	
	Components.types.body = new Components("body");
    Components.types.body.add_to = method(
        Components.types.body,
        function(entity, body_parts = []) {
			var body_inst = {
				add_all: function(_body_parts) {
					for (var i = 0, count = array_length(_body_parts); i < count; i++) {
						var bp = _body_parts[i];
						self[$ bp.name] = bp.new_instance();
					}
				}
			};
			
			body_inst.add_all(body_parts);
			default_add(entity, body_inst);
        }
    );
}