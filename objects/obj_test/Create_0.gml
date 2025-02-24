scr_setup_state_components();

scr_setup_word_variants_for_encounter();
scr_setup_general_interaction_systems();
scr_setup_player_actions_with_assets();
scr_setup_player_actions_with_npcs();

scr_setup_simulation_system();
scr_setup_personality_traits();

var compos =  obj_ecs_manager.component_manager;
var entit = obj_ecs_manager.entity_manager;
var syst = obj_ecs_manager.system_manager;

global.player = entit.create_entity("Adventurer");

var name_generator = new NameGenerator([
    // Stage 1: Starting consonants (softer, flowing sounds)
    ["S", "K", "V", "L", "Z", "Sh", "Kl", "Vr", "Sy", "T"],
    // Stage 2: Vowels or diphthongs (melodic or hissing)
    ["i", "e", "a", "y", "ee", "ia", "ira", "ys", "o"],
    // Stage 3: Ending sounds (feminine, sharp, or trailing)
    ["ra", "ss", "z", "n", "sh", "ka", "si", "th", "r", ""]
]);


global.npc1 = scr_generate_new_npc(name_generator.generate());
global.npc2 = scr_generate_new_npc(name_generator.generate());
global.npc3 = scr_generate_new_npc(name_generator.generate());
