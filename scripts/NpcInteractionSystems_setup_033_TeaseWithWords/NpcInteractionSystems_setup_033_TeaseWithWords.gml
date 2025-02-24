function NpcInteractionSystems_setup_033_TeaseWithWords() {
    NpcInteractionSystems.TeaseWithWords = ecs_setup_system_player_npc_interaction(
        "tease {name} with words",
        ["already_introduced", "in_conversation", "relationship_with_pc", "traits"],
        function(entity, args) {
            var npc = entity.relationship_with_pc;
            if (npc.check_attraction(30)) {
                npc.attraction += 10;
                npc.desire += 5;
                npc.interact(5);
                scr_chat(entity.name, "tease_with_words_positive");
            } else {
                scr_chat(entity.name, "tease_with_words_negative");
                npc.interact(-5);
            }
        }
    );
    
    new_word_variant("tease_with_words_positive", [
        "Oh, you’re |good| at this!",
        "|Yes|, keep talking like that!",
        "That’s |nice|, you tease!"
    ]);
    new_word_variant("tease_with_words_negative", [
        "Not funny, stop it.",
        "|No|, that’s too much.",
        "Cut it out, |please|."
    ]);
}