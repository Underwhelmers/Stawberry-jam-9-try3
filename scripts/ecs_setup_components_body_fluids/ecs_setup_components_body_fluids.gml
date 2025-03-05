function ecs_setup_components_body_fluids() {
	StateComponents.types.body_fluid = new StateComponents("body_fluid");
	StateComponents.types.body_fluid.add_to = method(
	    StateComponents.types.body_fluid,
	    function(entity, _fluids = {}) {
	        default_add(entity, {
	            fluids: _fluids, // Struct mapping fluid types to intensity (0 to 1)
	            // e.g., { "sweat": 0.5, "saliva": 0.2, "semen": 0, "precum": 0, "vaginal_lubrication": 0 }
				
				add_fluid: function(_fluid_type, _intensity) {
			        fluids[$ _fluid_type] = clamp((fluids[$ _fluid_type] ?? 0) + _intensity, 0, 1);
			    },
				remove_fluid: function(_fluid_type, _intensity) {
			        fluids[$ _fluid_type] = clamp((fluids[$ _fluid_type] ?? 0) - _intensity, 0, 1);
			    }
	        });
	    }
	);
	
	StateComponents.types.sensory_profile = new StateComponents("sensory_profile");
	StateComponents.types.sensory_profile.add_to = method(
	    StateComponents.types.sensory_profile,
	    function(entity, _smell_traits = {}, _taste_traits = {}, _anal_traits = { smell: "neutral", taste: "neutral" }) {
	        default_add(entity, {
	            smell_traits: _smell_traits, // Struct mapping fluid types to smell descriptions
	            taste_traits: _taste_traits, // Struct mapping fluid types to taste descriptions
	            anal_traits: _anal_traits // Specific smell/taste for anal region
				
				
	        });
	    }
	);
	StateComponents.types.sensory_profile.update_traits = method(
	    StateComponents.types.sensory_profile,
	    function(entity, _fluid_type, _smell, _taste) {
	        entity.sensory_profile.smell_traits[$ _fluid_type] = _smell;
	        entity.sensory_profile.taste_traits[$ _fluid_type] = _taste;
	    }
	);
	
	StateComponents.types.sensory_profile.get_smell = method(
	    StateComponents.types.sensory_profile,
	    function(entity, _fluid_type) {
	        var base_smell = entity.sensory_profile.smell_traits[$ _fluid_type] ?? "neutral";
	        if (!struct_exists(entity, "hygiene")) return base_smell;

	        var cleanliness = entity.hygiene.cleanliness;
	        var modifier = entity.hygiene.fluid_modifiers[$ _fluid_type] ?? 0;
	        var cleanliness_effect = cleanliness + modifier;

	        if (cleanliness_effect < 0.3) {
	            return base_smell + ", rancid and unclean";
	        } else if (cleanliness_effect < 0.6) {
	            return base_smell + ", slightly stale";
	        } else if (cleanliness_effect > 0.9) {
	            return base_smell + ", fresh and clean";
	        }
	        return base_smell;
	    }
	);
	StateComponents.types.sensory_profile.get_taste = method(
	    StateComponents.types.sensory_profile,
	    function(entity, _fluid_type) {
	        var base_taste = entity.sensory_profile.taste_traits[$ _fluid_type] ?? "neutral";
	        if (!struct_exists(entity, "hygiene")) return base_taste;

	        var cleanliness = entity.hygiene.cleanliness;
	        var modifier = entity.hygiene.fluid_modifiers[$ _fluid_type] ?? 0;
	        var cleanliness_effect = cleanliness + modifier;

	        if (cleanliness_effect < 0.3) {
	            return base_taste + ", bitter and sour";
	        } else if (cleanliness_effect < 0.6) {
	            return base_taste + ", slightly off";
	        } else if (cleanliness_effect > 0.9) {
	            return base_taste + ", clean and pleasant";
	        }
	        return base_taste;
	    }
	);
	StateComponents.types.sensory_profile.get_anal_traits = method(
	    StateComponents.types.sensory_profile,
	    function(entity, _trait_type) {
	        var base_trait = _trait_type == "smell" ? entity.sensory_profile.anal_traits.smell : entity.sensory_profile.anal_traits.taste;
	        if (!struct_exists(entity, "hygiene")) return base_trait;

	        var cleanliness = entity.hygiene.cleanliness;
	        var modifier = entity.hygiene.body_part_modifiers[$ "anal"] ?? 0;
	        var cleanliness_effect = cleanliness + modifier;

	        if (cleanliness_effect < 0.3) {
	            return base_trait + (_trait_type == "smell" ? ", foul and unclean" : ", rancid and unpleasant");
	        } else if (cleanliness_effect < 0.6) {
	            return base_trait + (_trait_type == "smell" ? ", mildly stale" : ", slightly bitter");
	        } else if (cleanliness_effect > 0.9) {
	            return base_trait + (_trait_type == "smell" ? ", clean and faint" : ", clean and subtle");
	        }
	        return base_trait;
	    }
	);
	
	
	StateComponents.types.hygiene = new StateComponents("hygiene");
	StateComponents.types.hygiene.add_to = method(
	    StateComponents.types.hygiene,
	    function(entity, _cleanliness = 0.5, _fluid_modifiers = {}, _body_part_modifiers = {}) {
	        default_add(entity, {
	            cleanliness: _cleanliness, // 0 (filthy) to 1 (pristine)
	            fluid_modifiers: _fluid_modifiers, // Struct mapping fluid types to hygiene impact
	            body_part_modifiers: _body_part_modifiers, // Struct mapping body parts (e.g., "anal") to hygiene impact
				
				adjust_cleanliness: function(_amount) {
				    cleanliness = clamp(cleanliness + _amount, 0, 1);
				},
				set_modifier: function(_type, _key, _value) {
			        if (_type == "fluid") {
			            fluid_modifiers[$ _key] = _value;
			        } else if (_type == "body_part") {
			            body_part_modifiers[$ _key] = _value;
			        }
			    }
	        });
	    }
	);
	
	StateComponents.types.hygiene.adjust_cleanliness = method(
	    StateComponents.types.hygiene,
	    function(entity, _amount) {
	        entity.hygiene.cleanliness = clamp(entity.hygiene.cleanliness + _amount, 0, 1);
	    }
	);
	StateComponents.types.hygiene.set_modifier = method(
	    StateComponents.types.hygiene,
	    function(entity, _type, _key, _value) {
	        if (_type == "fluid") {
	            entity.hygiene.fluid_modifiers[$ _key] = _value;
	        } else if (_type == "body_part") {
	            entity.hygiene.body_part_modifiers[$ _key] = _value;
	        }
	    }
	);
}