function NpcInteractionSystems() constructor {
	
}


function scr_setup_player_actions_with_npcs() {	
	NpcInteractionSystems_setup_001_Greet();
    NpcInteractionSystems_setup_002_StartConversationWith();
	NpcInteractionSystems_setup_003_AskNameTo();
    NpcInteractionSystems_setup_004_AskAboutTraitTo();
	NpcInteractionSystems_setup_005_FlirtWith();
    NpcInteractionSystems_setup_006_GiveGiftTo();
    NpcInteractionSystems_setup_007_TellPersonalStoryTo();
    NpcInteractionSystems_setup_008_ChitChatWith();
	NpcInteractionSystems_setup_009_TellSweetNothingsTo();
    NpcInteractionSystems_setup_010_AskToSitTogetherWith();
    // Ask To Sit Together With
    
    
    // Make Dirty Proposal To
    NpcInteractionSystems.MakeDirtyProposalTo = ecs_setup_system_player_action(
        "make dirty proposal to", 
        ["already_introduced", "sitting_together", "relationship_with_pc", "traits", "!npc_is_ready_for_intimacy"], 
        function(entity, args) {
            var resp = scr_apply_traits(entity, "on_interaction", { behaviour_is_overriten: false });
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
            var npc = entity.relationship_with_pc;
            if (npc.check_all(undefined, 20, 30)) {
                ecs_change_state_with_comps(entity, [], ["npc_is_ready_for_intimacy"]);
                npc.desire += 10; // Proposal heightens desire
                scr_chat(entity.name, "When?");
            } else {
                scr_chat(entity.name, "Nope...");
            }
        }
    );
    
    // Start Touching
    NpcInteractionSystems.StartTouching = ecs_setup_system_player_action(
        "start touching", 
        ["npc_is_ready_for_intimacy", "sitting_together", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var resp = scr_apply_traits(entity, "on_interaction", { behaviour_is_overriten: false });
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
            var npc = entity.relationship_with_pc;
            if (npc.check_all(undefined, 40, 60)) {
                npc.stimulation += 15; // Physical touch increases stimulation
                ecs_change_state_with_comps(entity, ["not_intimating"], ["is_aroused"]);
                scr_chat(entity.name, "Mmm <3");
            } else {
                scr_chat(entity.name, "Not yet ;D");
            }
        }
    );
    
    // Kiss
    NpcInteractionSystems.Kiss = ecs_setup_system_player_action(
        "give kiss to", 
        ["npc_is_ready_for_intimacy", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var resp = scr_apply_traits(entity, "on_interaction", { behaviour_is_overriten: false });
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
            var npc = entity.relationship_with_pc;
            if (npc.check_attraction(70)) {
                npc.attraction += 10;
                npc.trust += 5;
                npc.stimulation += 10; // Kissing boosts stimulation
                npc.interact(10);
                scr_chat(entity.name, "Your lips feel amazing...");
            } else {
                npc.attraction += 5;
                scr_chat(entity.name, "Mmm, nice.");
            }
        }
    );
    
    // Remove Clothes From
    NpcInteractionSystems.RemoveClothesFrom = ecs_setup_system_player_action(
        "remove clothes from", 
        ["npc_is_ready_for_intimacy", "relationship_with_pc", "!is_naked", "traits"], 
        function(entity, args) {
            var resp = scr_apply_traits(entity, "on_interaction", { behaviour_is_overriten: false });
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
            var manager = obj_ecs_manager.component_manager;
            var npc = entity.relationship_with_pc;
            if (npc.check_trust(50)) {
                ecs_change_state_with_comps(entity, [], ["is_naked"]);
                npc.attraction += 15;
                npc.desire += 10; // Undressing increases desire
                npc.interact(15);
                scr_chat(entity.name, "Alright, let's get comfortable.");
            } else {
                scr_chat(entity.name, "I'm not ready for that!");
                npc.interact(-10);
            }
        }
    );
    
    // Caress
    NpcInteractionSystems.Caress = ecs_setup_system_player_action(
        "give caress to", 
        ["npc_is_ready_for_intimacy", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var resp = scr_apply_traits(entity, "on_interaction", { behaviour_is_overriten: false });
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
            var npc = entity.relationship_with_pc;
            if (npc.check_attraction(80)) {
                npc.attraction += 10;
                npc.stimulation += 20; // Caressing significantly boosts stimulation
                ecs_change_state_with_comps(entity, ["not_intimating"], ["is_aroused"]);
                scr_chat(entity.name, "That feels so good...");
            } else {
                npc.attraction += 5;
                scr_chat(entity.name, "Hey, slow down a bit.");
            }
        }
    );
    
    // Thrust
    NpcInteractionSystems.Thrust = ecs_setup_system_player_action(
        "thrust", 
        ["npc_is_ready_for_intimacy", "is_naked", "is_aroused", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var resp = scr_apply_traits(entity, "on_interaction", { behaviour_is_overriten: false });
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
            var npc = entity.relationship_with_pc;
            if (npc.check_all(undefined, 60, 90, 50, 70)) { // Requires desire and stimulation
                npc.attraction += 15;
                npc.trust += 5;
                npc.stimulation += 25; // Thrusting heavily increases stimulation
                if (npc.trust >= 70 && npc.attraction >= 90 && npc.desire >= 60 && npc.stimulation >= 80) {
                    scr_chat(entity.name, "I can't hold back anymore!");
                } else {
					scr_chat(entity.name, "Oh yes, keep going!");
				}
            } else {
                scr_chat(entity.name, "Not so fast!");
                npc.interact(-15);
            }
        }
    );
    
    // Cuddle
    NpcInteractionSystems.Cuddle = ecs_setup_system_player_action(
        "cuddle with", 
        ["sitting_together", "reached_climax", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var resp = scr_apply_traits(entity, "on_interaction", { behaviour_is_overriten: false });
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
            var npc = entity.relationship_with_pc;
            scr_chat(entity.name, "That was... wow. Hold me.");
            npc.trust += 20;
            npc.interact(10);
            ecs_change_state_with_comps(entity, ["reached_climax"], ["is_satisfied"]);
        }
    );

    // New Actions
    // Tease
    NpcInteractionSystems.Tease = ecs_setup_system_player_action(
        "tease", 
        ["already_introduced", "in_conversation", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var resp = scr_apply_traits(entity, "on_interaction", { behaviour_is_overriten: false });
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
            var npc = entity.relationship_with_pc;
            if (npc.check_attraction(30)) {
                npc.attraction += 8;
                npc.desire += 5; // Teasing builds desire
                npc.interact(5);
                scr_chat(entity.name, "Oh, you're bad!");
            } else {
                scr_chat(entity.name, "That's not funny.");
                npc.interact(-5);
            }
        }
    );

    // Compliment
    NpcInteractionSystems.Compliment = ecs_setup_system_player_action(
        "give compliment to", 
        ["already_introduced", "in_conversation", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var resp = scr_apply_traits(entity, "on_interaction", { behaviour_is_overriten: false });
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
            var npc = entity.relationship_with_pc;
            npc.trust += 5;
            npc.attraction += 3;
            npc.interact(5);
            scr_chat(entity.name, "Thanks, that's sweet.");
        }
    );

    // Whisper
    NpcInteractionSystems.Whisper = ecs_setup_system_player_action(
        "whisper to", 
        ["already_introduced", "sitting_together", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var resp = scr_apply_traits(entity, "on_interaction", { behaviour_is_overriten: false });
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
            var npc = entity.relationship_with_pc;
            if (npc.check_trust(20)) {
                npc.attraction += 10;
                npc.desire += 5; // Whispering boosts desire
                scr_chat(entity.name, "That gave me chills...");
            } else {
                scr_chat(entity.name, "What did you say?");
                npc.interact(-3);
            }
        }
    );

    // Hold Hands
    NpcInteractionSystems.HoldHands = ecs_setup_system_player_action(
        "hold hands with", 
        ["already_introduced", "sitting_together", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var resp = scr_apply_traits(entity, "on_interaction", { behaviour_is_overriten: false });
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
            var npc = entity.relationship_with_pc;
            if (npc.check_trust(30)) {
                npc.trust += 10;
                npc.attraction += 5;
                scr_chat(entity.name, "I like this.");
                obj_ecs_manager.component_manager.add_component(entity, "is_comfortable", true);
            } else {
                scr_chat(entity.name, "Not yet, okay?");
                npc.interact(-5);
            }
        }
    );

    // Massage
    NpcInteractionSystems.Massage = ecs_setup_system_player_action(
        "give massage to", 
        ["npc_is_ready_for_intimacy", "sitting_together", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var resp = scr_apply_traits(entity, "on_interaction", { behaviour_is_overriten: false });
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
            var npc = entity.relationship_with_pc;
            if (npc.check_attraction(50)) {
                npc.attraction += 15;
                npc.stimulation += 20; // Massage increases stimulation
                npc.desire += 10; // And desire
                ecs_change_state_with_comps(entity, ["not_intimating"], ["is_aroused"]);
                scr_chat(entity.name, "Oh, that's perfect...");
            } else {
                scr_chat(entity.name, "Um, maybe later.");
                npc.interact(-5);
            }
        }
    );

    // Pull Closer
    NpcInteractionSystems.PullCloser = ecs_setup_system_player_action(
        "pull closer", 
        ["npc_is_ready_for_intimacy", "is_aroused", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var resp = scr_apply_traits(entity, "on_interaction", { behaviour_is_overriten: false });
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
            var npc = entity.relationship_with_pc;
            if (npc.check_all(undefined, 50, 70, 40)) { // Requires desire
                npc.attraction += 10;
                npc.trust += 5;
                npc.stimulation += 15;
                scr_chat(entity.name, "Yes, don't let go!");
            } else {
                scr_chat(entity.name, "Too close!");
                npc.interact(-10);
            }
        }
    );

    // Slow Down
    NpcInteractionSystems.SlowDown = ecs_setup_system_player_action(
        "slow down banging", 
        ["npc_is_ready_for_intimacy", "is_aroused", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var resp = scr_apply_traits(entity, "on_interaction", { behaviour_is_overriten: false });
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
            var npc = entity.relationship_with_pc;
            if (npc.check_trust(60)) {
                npc.trust += 10;
                npc.stimulation += 5; // Gentle pace still stimulates
                scr_chat(entity.name, "Mmm, I like it gentle.");
            } else {
                scr_chat(entity.name, "Just... keep going.");
            }
        }
    );

    // Finish Together
    NpcInteractionSystems.FinishTogether = ecs_setup_system_player_action(
        "finish together with", 
        ["npc_is_ready_for_intimacy", "is_naked", "is_aroused", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var resp = scr_apply_traits(entity, "on_interaction", { behaviour_is_overriten: false });
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
            var npc = entity.relationship_with_pc;
            if (npc.check_all(undefined, 70, 90, 60, 80)) { // High desire and stimulation
                scr_chat(entity.name, "Now together!");
                obj_ecs_manager.component_manager.add_component(entity, "reached_climax", true);
                npc.attraction = 30;
                npc.desire = 20;
                npc.stimulation = 0;
                npc.trust += 15;
            } else {
                scr_chat(entity.name, "I'm not there yet!");
                npc.interact(-5);
            }
        }
    );
}