function scr_setup_body_parts() {	
    // --- Body Parts ---
	global.body_parts = {};
	global.body_parts.anus = ecs_new_body_part("anus", "A tight, puckered opening.", "an anus", ["is_cavity"]);
    global.body_parts.mouth = ecs_new_body_part("mouth", "A soft, dextrous opening.", "a mouth", ["is_cavity"]);
    global.body_parts.chest = ecs_new_body_part("chest", "A broad, toned expanse.", "a chest");
    global.body_parts.nipples = ecs_new_body_part("nipples", "Small, sensitive buds.", "nipples");
	global.body_parts.hands = ecs_new_body_part("hands", "Nimble, dexterous fingers.", "hands");
	global.body_parts.thighs = ecs_new_body_part("thighs", "Thick, muscular curves.", "thighs");
	global.body_parts.ass = ecs_new_body_part("ass", "A firm, rounded backside.", "an ass");
	global.body_parts.lips = ecs_new_body_part("lips", "Soft, plump lips.", "lips");
	global.body_parts.tongue = ecs_new_body_part("tongue", "A wet, agile muscle.", "a tongue", ["is_phallus"]);
    global.body_parts.neck = ecs_new_body_part("neck", "A slender, sensitive column.", "a neck");
	
    global.body_parts.breasts = ecs_new_body_part("breasts", "Soft, rounded mounds.", "breasts");
	global.body_parts.vagina = ecs_new_body_part("vagina", "A slick, welcoming passage.", "a vagina", ["is_cavity"]);
	global.body_parts.cloeca = ecs_new_body_part("cloeca", "A tight, well hiden cave.", "a cloeca", ["is_cavity"]);
    global.body_parts.dick = ecs_new_body_part("dick", "A firm, pulsing shaft.", "a dick", ["is_phallus"]);
	
	global.body_parts.beak = ecs_new_body_part("beak", "A rigid, magestic beak.", "a beak", ["is_cavity"]); 
    global.body_parts.tentacles = ecs_new_body_part("tentacles", "Slick, writhing tendrils.", "tentacles", ["is_phallus"]);
    global.body_parts.wings = ecs_new_body_part("wings", "Feathered, majestic wings.", "wings");
    global.body_parts.horns = ecs_new_body_part("horns", "Curved, imposing horns.", "horns");
    global.body_parts.tail = ecs_new_body_part("tail", "A long, sinuous appendage.", "a tail", ["is_phallus"]); 
    global.body_parts.claws = ecs_new_body_part("claws", "Sharp, curved talons.", "claws");
	
	StateComponents.types.body = new StateComponents("body");
    StateComponents.types.body.add_to = method(
        StateComponents.types.body,
        function(entity, body_parts) {
			var body_inst = {};
            for (var i = 0, count = array_length(body_parts); i < count; i++) {
				var bp = body_parts[i];
				body_inst[$ bp.name] = bp.new_instance();
			}
			
			default_add(entity, body_inst);
        }
    );
}