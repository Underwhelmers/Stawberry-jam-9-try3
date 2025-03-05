function ecs_setup_components_factions() {
	StateComponents.types.faction = new StateComponents("faction");
	StateComponents.types.faction.add_to = method(
	    StateComponents.types.faction,
	    function(entity, _faction_name, _faction_rank = "member", _cultural_norms = "neutral", _social_openness = 0.5) {
	        default_add(entity, {
	            faction_name: _faction_name,
	            rank: _faction_rank,
	            reputation: {},
	            cultural_norms: _cultural_norms, // e.g., "conservative", "libertine"
	            social_openness: _social_openness, // 0 (reserved) to 1 (very forward)
				
				
				set_reputation: function(_target_faction_or_entity, _value) {
			        reputation[$ _target_faction_or_entity] = clamp(_value, -1, 1);
			    },
				get_reputation: function(_target_faction_or_entity) {
			        return struct_exists(reputation, _target_faction_or_entity) 
			            ? reputation[$ _target_faction_or_entity] 
			            : 0;
			    }
	        });
	    }
	);
	
	StateComponents.types.faction.set_reputation = method(
	    StateComponents.types.faction,
	    function(entity, _target_faction_or_entity, _value) {
	        entity.faction.reputation[$ _target_faction_or_entity] = clamp(_value, -1, 1);
	    }
	);
	
	StateComponents.types.faction.get_reputation = method(
	    StateComponents.types.faction,
	    function(entity, _target_faction_or_entity) {
	        return struct_exists(entity.faction.reputation, _target_faction_or_entity) 
	            ? entity.faction.reputation[$ _target_faction_or_entity] 
	            : 0;
	    }
	);
}