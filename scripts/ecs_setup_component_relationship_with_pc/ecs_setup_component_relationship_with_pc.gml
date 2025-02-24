function ecs_setup_component_relationship_with_pc(manager, entity) {
	manager.add_component(entity, "relationship_with_pc", {
		owner: entity,
		times_interacted: 0,
		always_agee: true,
		
		interact: function(_delta_opinion = 0) {
			times_interacted += 1;
			opinion += _delta_opinion;
			
			if (opinion < -100) {
				ecs_change_state_with_comps(owner, ["neutral_opinion", "good_opinion", "is_in_love"],["are_enemies", "bad_opinion"]);
			} else if (opinion < -40) {
				ecs_change_state_with_comps(owner, ["are_enemies", "neutral_opinion", "good_opinion", "is_in_love"],["bad_opinion"]);
			} else if (opinion > 40) {
				ecs_change_state_with_comps(owner, ["are_enemies", "bad_opinion", "neutral_opinion", "is_in_love"],["good_opinion"]);
			} else if (opinion > 100) {
				ecs_change_state_with_comps(owner, ["are_enemies", "bad_opinion", "neutral_opinion"],["is_in_love", "good_opinion"]);
			} else {
				ecs_change_state_with_comps(owner, ["are_enemies", "bad_opinion", "good_opinion", "is_in_love"],["neutral_opinion"]);
			}
		
			//scr_inform(string("opinion: {0}\n          attraction: {1}\n          thrust: {2}", opinion, attraction, trust));
		},
		
		opinion: 0, // 100 best, -100 worst.
		check_opinion: function(threshold) { 
			if (opinion < threshold && !always_agee)
				scr_inform("Not enough opinion.");
			return opinion >= threshold || always_agee;
		},
		
		attraction: 0, // 100 best, -100 worst.
		check_attraction: function(threshold) { 
			if (attraction < threshold && !always_agee)
				scr_inform("Not enough attraction.");
			return attraction >= threshold || always_agee;
		},
		
		
		trust: 0,  // 100 best, -100 worst.
		check_trust: function(threshold) { 
			if (trust < threshold && !always_agee)
				scr_inform("Not enough trust.");
			return trust >= threshold || always_agee;
		},
		
		
		desire: 0,
		check_desire: function(threshold) { 
			if (desire < threshold && !always_agee)
				scr_inform("Not enough desire.");
			return desire >= threshold || always_agee;
		},
		
		
		stimulation: 0,
		check_stimulation: function(threshold) { 
			if (stimulation < threshold && !always_agee)
				scr_inform("Not enough stimulation.");
			return stimulation >= threshold || always_agee;
		},
		
		check_all: function(_opinion = undefined, _trust = undefined, _attraction = undefined, _desire = undefined, _stimulation = undefined) {
			var result = true;
			
			if (is_real(_opinion    )) { result &= check_opinion(_opinion); }
			if (is_real(_trust      )) { result &= check_trust(_trust); }
			if (is_real(_attraction )) { result &= check_attraction(_attraction); }
			if (is_real(_desire     )) { result &= check_desire(_desire); }
			if (is_real(_stimulation)) { result &= check_stimulation(_stimulation); }
			
			return result;
		}
	});
}