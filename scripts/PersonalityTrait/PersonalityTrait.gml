function PersonalityTrait(_name) constructor {
    name = _name;
    modifiers = ds_map_create(); // Dictionary of event -> { mode: "extend"/"override", func: modifier_func }
    
    static add_modifier = function(event, mode, modifier_func) {
        if (mode != "extend" && mode != "override") {
            mode = "extend"; // Default to extend if invalid
        }
        modifiers[? event] = {
            mode: mode,        // "extend" or "override"
            func: modifier_func
        };
    }
    
    static apply = function(event, entity, args) {
        if (ds_map_exists(modifiers, event)) {
            var modifier = modifiers[? event];
            modifier.func(entity, args);
            return modifier.mode == "override"; // Returns true if overriding
        }
        return false; // No override, proceed normally
    }
	
	static all_instances = [];
	array_push(all_instances, self);
}

function scr_setup_personality_traits() {
    // Shy (Your existing trait, adjusted for consistency)
    PersonalityTrait.Shy = new PersonalityTrait("shy");
    PersonalityTrait.Shy.add_modifier(NpcInteractionSystems.FlirtWith.system_event, 
	"override", function(entity, args) {
        entity.relationship_with_pc.attraction += 2; // Slower attraction gain
        scr_chat(entity.name, "I-I'm not sure about this...");
    });
    PersonalityTrait.Shy.add_modifier(NpcInteractionSystems.StartTouching.system_event, 
	"override", function(entity, args) {
        entity.relationship_with_pc.trust -= 10;
        scr_chat(entity.name, "Stop! Too fast!");
    });
    PersonalityTrait.Shy.add_modifier(NpcInteractionSystems.MakeDirtyProposalTo.system_event, 
	"extend", function(entity, args) {
        entity.relationship_with_pc.trust -= 5; // Nervous about bold moves
        scr_chat(entity.name, "Um... that's a lot...");
    });


    // Bold (Confident and forward)
    PersonalityTrait.Bold = new PersonalityTrait("bold");
    PersonalityTrait.Bold.add_modifier(NpcInteractionSystems.FlirtWith.system_event, 
	"override", function(entity, args) {
        entity.relationship_with_pc.attraction += 10; // Quick to warm up
        scr_chat(entity.name, "Oh, I like where this is going!");
    });
    PersonalityTrait.Bold.add_modifier(NpcInteractionSystems.MakeDirtyProposalTo.system_event, 
	"override", function(entity, args) {
        if (entity.relationship_with_pc.check_attraction(20)) {
            obj_ecs_manager.component_manager.add_component(entity, "npc_is_ready_for_intimacy", true);
            scr_chat(entity.name, "Let's not waste time, yes!");
        } else {
            scr_chat(entity.name, "Prove you’re worth it first.");
        }
    });
    PersonalityTrait.Bold.add_modifier(NpcInteractionSystems.Thrust.system_event, 
	"extend", function(entity, args) {
        entity.relationship_with_pc.attraction += 5;
        scr_chat(entity.name, "Harder!");
    });


    // Playful (Teasing and lighthearted)
    PersonalityTrait.Playful = new PersonalityTrait("playful");
    PersonalityTrait.Playful.add_modifier(NpcInteractionSystems.FlirtWith.system_event, 
	"extend", function(entity, args) {
        entity.relationship_with_pc.attraction += 7;
        args.final_chat = "Hehe, you're cute when you try!";
    });
    PersonalityTrait.Playful.add_modifier(NpcInteractionSystems.StartTouching.system_event, 
	"extend", function(entity, args) {
        entity.relationship_with_pc.attraction += 5;
        scr_chat(entity.name, "Ooh, ticklish spot!");
    });
    PersonalityTrait.Playful.add_modifier(NpcInteractionSystems.Caress.system_event, 
	"override", function(entity, args) {
        entity.relationship_with_pc.attraction += 15;
        scr_chat(entity.name, "You're good at this, keep going!");
        obj_ecs_manager.component_manager.add_component(entity, "is_aroused", true);
    });


    // Reserved (Cautious and slow to trust)
    PersonalityTrait.Reserved = new PersonalityTrait("reserved");
    PersonalityTrait.Reserved.add_modifier(NpcInteractionSystems.Greet.system_event, 
	"override", function(entity, args) {
        entity.relationship_with_pc.trust -= 2; // Wary of strangers
        scr_chat(entity.name, "Uh, hi... I guess.");
		
        var manager = obj_ecs_manager.component_manager;
        ecs_change_state_with_comps(entity, ["is_stranger"], ["in_conversation", "already_introduced"]);
    });
    PersonalityTrait.Reserved.add_modifier(NpcInteractionSystems.AskToSitTogetherWith.system_event, 
	"override", function(entity, args) {
        if (entity.relationship_with_pc.check_trust(30)) {
            ecs_change_state_with_comps(entity, ["is_standing"], ["sitting_together"]);
            scr_chat(entity.name, "Fine, I'll sit.");
        } else {
            scr_chat(entity.name, "I'd rather stand, thanks.");
        }
    });
    PersonalityTrait.Reserved.add_modifier(NpcInteractionSystems.Kiss.system_event, 
	"override", function(entity, args) {
        if (!entity.relationship_with_pc.check_trust(50)) {
            scr_chat(entity.name, "No, I'm not there yet.");
            entity.relationship_with_pc.interact(-10);
        } else {
            entity.relationship_with_pc.attraction += 5;
            scr_chat(entity.name, "Okay... that's nice.");
        }
    });


    // Passionate (Intense and emotional)
    PersonalityTrait.Passionate = new PersonalityTrait("passionate");
    PersonalityTrait.Passionate.add_modifier(NpcInteractionSystems.Kiss.system_event, 
	"extend", function(entity, args) {
        entity.relationship_with_pc.attraction += 15;
        entity.relationship_with_pc.trust += 10;
        scr_chat(entity.name, "Don't stop, more!");
    });
    PersonalityTrait.Passionate.add_modifier(NpcInteractionSystems.Thrust.system_event, 
	"extend", function(entity, args) {
        entity.relationship_with_pc.attraction += 20;
        scr_chat(entity.name, "Yes, yes, YES!");
        if (entity.relationship_with_pc.attraction >= 100) {
            scr_chat(entity.name, "I'm losing it!");
            obj_ecs_manager.component_manager.add_component(entity, "reached_climax", true);
            entity.relationship_with_pc.attraction = 30;
        }
    });
    PersonalityTrait.Passionate.add_modifier(NpcInteractionSystems.Cuddle.system_event, 
	"extend", function(entity, args) {
        entity.relationship_with_pc.trust += 15;
        scr_chat(entity.name, "Hold me tighter...");
    });
	
	
	// Greedy (Loves gifts, hoard-focused)
    PersonalityTrait.Greedy = new PersonalityTrait("greedy");
    PersonalityTrait.Greedy.add_modifier("give gift to", "override", function(entity, args) {
        var npc = entity.relationship_with_pc;
        if (random(100) < 85) { // Higher success chance
            npc.trust += 10; // Bigger trust boost
			npc.atraction += 3;
			npc.desire += 3;
			npc.stimulation += 2;
            npc.interact(20);
            args.final_chat = "Shiny! Mine now!";
        } else {
            npc.interact(5);
            args.final_chat = "Is that all?";
        }
        scr_chat(entity.name, args.final_chat);
    });
    PersonalityTrait.Greedy.add_modifier("make dirty proposal to", "extend", function(entity, args) {
        entity.relationship_with_pc.desire += 5;
        scr_chat(entity.name, "What's in it for my hoard?");
    });
    PersonalityTrait.Greedy.add_modifier("on_interaction", "extend", function(entity, args) {
        if (random(100) < 20) {
            scr_chat(entity.name, "Gots anything shiny for me?");
        }
    });
	
	PersonalityTrait.Skittish = new PersonalityTrait("skittish");
    PersonalityTrait.Skittish.add_modifier("greet", "override", function(entity, args) {
        entity.relationship_with_pc.trust -= 5; // Wary of new faces
        args.final_chat = "Who's this?!";
        scr_chat(entity.name, args.final_chat);
    });
    PersonalityTrait.Skittish.add_modifier("pull closer", "override", function(entity, args) {
        var npc = entity.relationship_with_pc;
        if (npc.check_trust(60)) {
            npc.attraction += 5;
            npc.stimulation += 10;
            args.final_chat = "Hey... Slowly now...";
            scr_chat(entity.name, args.final_chat);
        } else {
            npc.trust -= 10;
            args.final_chat = "Too close-back off!";
            scr_chat(entity.name, args.final_chat);
        }
    });
    PersonalityTrait.Skittish.add_modifier("on_interaction", "extend", function(entity, args) {
        if (random(100) < 25 && entity.relationship_with_pc.trust < 20) {
            scr_chat(entity.name, "Don't sneak up!");
            entity.relationship_with_pc.trust -= 3;
        }
    });
	
	PersonalityTrait.Mischievous = new PersonalityTrait("mischievous");
    PersonalityTrait.Mischievous.add_modifier("tease", "extend", function(entity, args) {
        entity.relationship_with_pc.attraction += 10;
        args.final_chat = "Sneaky, huh? I'll getcha back!";
        scr_chat(entity.name, args.final_chat);
    });
    PersonalityTrait.Mischievous.add_modifier("give kiss to", "override", function(entity, args) {
        var npc = entity.relationship_with_pc;
        if (npc.check_attraction(70)) {
            npc.attraction += 15;
            npc.stimulation += 15;
            args.final_chat = "Surprise peck!";
            scr_chat(entity.name, args.final_chat);
        } else {
            npc.attraction += 5;
            args.final_chat = "Too slow friend!";
            scr_chat(entity.name, args.final_chat);
        }
    });
    PersonalityTrait.Mischievous.add_modifier("on_interaction", "extend", function(entity, args) {
        if (random(100) < 10) {
            scr_chat(entity.name, "Watch your hoard! *pinches your ass*");
            entity.relationship_with_pc.desire += 3;
        }
    });

	PersonalityTrait.Lustful = new PersonalityTrait("lustful");
    PersonalityTrait.Lustful.add_modifier("make dirty proposal to", "override", function(entity, args) {
        var npc = entity.relationship_with_pc;
        if (npc.check_all(undefined, 10, 20)) { // Lowered thresholds for eagerness
            ecs_change_state_with_comps(entity, [], ["npc_is_ready_for_intimacy"]);
            npc.desire += 15; // Strong desire boost
            args.final_chat = "Oh, yes-let’s do it now!";
            scr_chat(entity.name, args.final_chat);
        } else {
            args.final_chat = "Hmm, tempting... convince me.";
            scr_chat(entity.name, args.final_chat);
        }
    });
    PersonalityTrait.Lustful.add_modifier("start touching", "extend", function(entity, args) {
        entity.relationship_with_pc.stimulation += 20; // Heightened sensitivity
        entity.relationship_with_pc.desire += 10; // Extra eagerness
        scr_chat(entity.name, "Don't stop just there, what a tease.");
    });
    PersonalityTrait.Lustful.add_modifier("give kiss to", "extend", function(entity, args) {
        entity.relationship_with_pc.attraction += 5;
        entity.relationship_with_pc.stimulation += 15; // Passionate response
        scr_chat(entity.name, "More... I need more!");
    });
    PersonalityTrait.Lustful.add_modifier("thrust", "extend", function(entity, args) {
        entity.relationship_with_pc.stimulation += 10; // Extra intensity
        entity.relationship_with_pc.desire += 5;
        scr_chat(entity.name, "Yes, harder-please!");
    });
    PersonalityTrait.Lustful.add_modifier("on_interaction", "extend", function(entity, args) {
        if (random(100) < 5) {
            scr_chat(entity.name, "Do you ever think in people arround you just naked?");
            entity.relationship_with_pc.desire += 5;
        }
    });
	
	PersonalityTrait.all_instances_vb = new ValueBag(PersonalityTrait.all_instances);
}