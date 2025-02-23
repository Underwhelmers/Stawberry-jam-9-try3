function NpcInteractionSystems() constructor {
	
}


function scr_setup_player_actions_with_npcs() {	
    // Greet
    NpcInteractionSystems.Greet = ecs_setup_system_player_action(
        "greet", 
        ["!already_introduced", "is_in_reach", "relationship_with_pc", "traits"], 
        function(entity, args) {
            scr_chat(global.player.name, "Hello!");
            var resp = scr_apply_traits(entity, "on_interaction", { 
				behaviour_is_overriten: false,
				final_chat: "Hi!"
			});
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
            scr_chat(entity.name, resp.final_chat);
			
            var manager = obj_ecs_manager.component_manager;
            ecs_change_state_with_comps(entity, [], ["in_conversation", "already_introduced"]);
            entity.relationship_with_pc.interact(5);
        }
    );
	
	
    // Greet
    NpcInteractionSystems.Greet = ecs_setup_system_player_action(
        "start conversation with", 
        ["already_introduced", "is_in_reach", "relationship_with_pc", "traits", "!in_conversation"], 
        function(entity, args) {
            scr_chat(global.player.name, "Hello!");
            var resp = scr_apply_traits(entity, "on_interaction", { 
				behaviour_is_overriten: false,
				final_chat: "Hi!"
			});
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
            scr_chat(entity.name, resp.final_chat);
			
            var manager = obj_ecs_manager.component_manager;
            ecs_change_state_with_comps(entity, [], ["in_conversation", "already_introduced"]);
            entity.relationship_with_pc.interact(5);
        }
    );
    
    // Ask Name To
    NpcInteractionSystems.AskNameTo = ecs_setup_system_player_action(
        "ask name to", 
        ["!name_is_known", "in_conversation", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var resp = scr_apply_traits(entity, "on_interaction", { behaviour_is_overriten: false });
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
            var manager = obj_ecs_manager.component_manager;
            ecs_change_state_with_comps(entity, [], ["name_is_known"]);
            entity.relationship_with_pc.interact(3);
            entity.name = entity.truename;
            scr_chat(entity.name, string("My name? It's {0}.", entity.name));
        }
    );
	
    // Ask about trait
    NpcInteractionSystems.AskAboutTraitTo = ecs_setup_system_player_action(
        "ask about trait to", 
        ["in_conversation", "relationship_with_pc", "name_is_known", "traits"], 
        function(entity, args) {
            var resp = scr_apply_traits(entity, "on_interaction", { behaviour_is_overriten: false });
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
			
            scr_chat(entity.name, string("I am '{0}'.",entity.traits[|0].name));
        }
    );
    
    // Flirt With
    NpcInteractionSystems.FlirtWith = ecs_setup_system_player_action(
        "flirt with", 
        ["already_introduced", "in_conversation", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var resp = scr_apply_traits(entity, "on_interaction", {
				behaviour_is_overriten: false,
				final_chat: "Yes?... what else?",
			});
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
            var npc = entity.relationship_with_pc;
            if (npc.check_opinion(20)) {
                npc.attraction += 5;
                npc.desire += 3; // Flirting sparks desire
                npc.interact(10);
                scr_chat(entity.name, resp.final_chat);
            } else {
                scr_chat(entity.name, "Stay back please.");
                npc.interact(-5);
            }
        }
    );
    
    // Give Gift To
    NpcInteractionSystems.GiveGiftTo = ecs_setup_system_player_action(
        "give gift to", 
        ["already_introduced", "in_conversation", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var resp = scr_apply_traits(entity, "on_interaction", { behaviour_is_overriten: false });
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
            var npc = entity.relationship_with_pc;
            if (random(100) < 75) {
                npc.trust += 5;
                npc.interact(15);
                scr_chat(entity.name, "Thanks <3");
            } else {
                npc.interact(5);
                scr_inform("Miss.");
                scr_chat(entity.name, "Thanks? ._.");
            }
        }
    );
    
    // Tell Personal Story To
    NpcInteractionSystems.TellPersonalStoryTo = ecs_setup_system_player_action(
        "tell personal story to", 
        ["already_introduced", "name_is_known", "in_conversation", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var resp = scr_apply_traits(entity, "on_interaction", { behaviour_is_overriten: false });
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
            var npc = entity.relationship_with_pc;
            npc.trust += 5;
            npc.interact(0);
            scr_chat(entity.name, "Ohh, really? :O");
        }
    );
    
    // Chit-Chat With
    NpcInteractionSystems.ChitChatWith = ecs_setup_system_player_action(
        "tell a lot of nothing to", 
        ["already_introduced", "name_is_known", "in_conversation", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var resp = scr_apply_traits(entity, "on_interaction", { behaviour_is_overriten: false });
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
            var npc = entity.relationship_with_pc;
            npc.interact(5);
            scr_chat(entity.name, "Mhm, mhm.");
        }
    );
    
    // Tell Sweet Nothings To
    NpcInteractionSystems.TellSweetNothingsTo = ecs_setup_system_player_action(
        "tell sweet nothings to", 
        ["already_introduced", "name_is_known", "in_conversation", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var resp = scr_apply_traits(entity, "on_interaction", { behaviour_is_overriten: false });
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
            var npc = entity.relationship_with_pc;
            npc.attraction += 1;
            npc.desire += 2; // Subtle intimacy boost
            npc.interact(0);
            scr_chat(entity.name, "Aww <3");
        }
    );
    
    // Ask To Sit Together With
    NpcInteractionSystems.AskToSitTogetherWith = ecs_setup_system_player_action(
        "ask to sit together with", 
        ["already_introduced", "!sitting_together", "in_conversation", "relationship_with_pc", "traits"], 
        function(entity, args) {
            var resp = scr_apply_traits(entity, "on_interaction", { behaviour_is_overriten: false });
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
            var npc = entity.relationship_with_pc;
            if (npc.check_trust(10)) {
                ecs_change_state_with_comps(entity, [], ["sitting_together"]);
                scr_chat(entity.name, "Come here :D.");
            } else {
                scr_chat(entity.name, "Nope...");
            }
        }
    );
    
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