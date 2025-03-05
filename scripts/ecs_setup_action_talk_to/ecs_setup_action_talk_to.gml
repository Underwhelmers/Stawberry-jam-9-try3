function ecs_setup_action_talk_to() {
    ecs_setup_system_player_action(
        "talk to {name}",
        ["is_npc", "identity"],
        function(entity) {
            var npc_mood = struct_exists(entity, "mood") ? entity.mood.state : "neutral";
            var player_rel = struct_exists(entity, "relationship") ? entity.relationship.affinity : 0;
            
            if (player_rel > 0.5) {
                scr_chat((entity.name), "Good to see you! What do you want to talk about?");
            } else if (player_rel < -0.5) {
                scr_chat((entity.name), "Get lost! I don’t want to talk to you.");
            } else {
                scr_chat((entity.name), "Hey, what’s up?");
                if (struct_exists(entity, "knowledge") && !ds_list_empty(entity.knowledge.contents)) {
                    var fact = entity.knowledge.contents[| 0];
                    scr_chat((entity.name), "By the way, I heard {0}.", fact);
                }
            }
        }
    );
}