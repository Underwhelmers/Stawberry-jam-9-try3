function Cavity(_name, _open_ended) constructor {
	name = _name; 
    // Dimensions  
	max_depth = 10;
	max_width = 5;
	used_width = 0;

	// Derived values  
	fluid_stored = 0;
	used_capacity = 0;
	capacity = max_width*max_width*pi*0.25* max_depth;	

	// Chain-related variables (set later by CavityChain)  
	chain = noone;       // will hold the complete chain array  
	chain_pos = -1;      // our position in that chain  
	open_ended = _open_ended;  // true means fluid can "leak out" if not connected
	content = ds_map_create();

	// Clone (shallow copy)  
	static clone = function() {
	    return new Cavity(name, open_ended);
	};

	// Check if a phallus can penetrate this cavity  
	static try_penetrate_using = function(_phallus) {
		var _area = _phallus.width*_phallus.width*pi*0.25;
	    return used_width + _area <= max_width;
	};

	// Penetrate using _phallus with _depth.  
	// _chain is an array that records the penetration path.
	static penetrate_using = function(_phallus, _depth) {
		return _recursive_penetrate(_phallus,_depth, chain_pos == 0 ? 1 : -1);
	};
	
	static _recursive_penetrate = function(_phallus, _remaining_length, _direction) {
		if (try_penetrate_using(_phallus)) {
			var _values = {
				depth: _remaining_length,
				area: _phallus.width*_phallus.width*pi*0.25,
				volume: _phallus.width*_phallus.width*pi*0.25 * min(max_depth,_remaining_length),
			};
			content[? _phallus] = _values;
			used_capacity += _values.volume;
			used_width += _values.area;
			
			_remaining_length -= max_depth;
	        show_debug_message(_phallus.name + " entered " + name);
			
			if (used_capacity + fluid_stored > capacity) {
				var _spilled = fluid_stored - capacity + used_capacity;
				fluid_stored -= _spilled;
				fill_with_fluid("it's content",_spilled);
			}
			
			if (_remaining_length > 0) {
				if (between(chain_pos + _direction, 0, chain.size-1)) {
					var next = chain.values[chain_pos + _direction];
					return next._recursive_penetrate(_phallus, _remaining_length,_direction);
				}
				else if (open_ended) {
	                show_debug_message(_phallus.name + " leaved through the " + name);
					return noone;
	            }
	            else {
	                show_debug_message(_phallus.name + " is pushing the top of " + name);
					return self;
	            }
			}
			return self;
	    }
	    else {
	        show_debug_message(_phallus.name + " doesnt fit in their " + name);
			return self;
	    }
	}

	// Fill this cavity with _volume of _fluid. If capacity is exceeded, spill the excess.
    static fill_with_fluid = function(_fluid, _volume) {
        if ((chain != noone) && (chain.size > 0)) {
            // Use the current cavity’s chain.
            return _fill_chain_alternating(_fluid, _volume);
        }
        else {
            // Not in a chain: fill self.
            return _fill_self_with_fluid(_fluid, _volume);
        }
    };

    static _fill_self_with_fluid = function(_fluid, _volume) {
        var new_volume = fluid_stored + _volume;
        if (new_volume >= capacity - used_capacity) {
            fluid_stored = capacity - used_capacity;
            show_debug_message("{0} filled to the brim with {1}" ,name, _fluid);
            var spilled = new_volume - capacity + used_capacity;
            if (open_ended) {
                show_debug_message("{0} spilled {1} units of {2}", name, spilled, _fluid);
            }
            return spilled;
        }
        else {
            fluid_stored = new_volume;
            show_debug_message("{0} now contains {1} units of {2}", name, fluid_stored, _fluid);
            return 0;
        }
    };

    static _fill_chain_alternating = function(_fluid, _volume) {
        var order = [];
        var start = chain_pos;  // current cavity's position in the chain
        order[array_length(order)] = start;
        var offset = 1;
        while ((start - offset >= 0) || (start + offset < chain.size)) {
            if (start + offset < chain.size) {
                order[array_length(order)] = start + offset;
            }
            if (start - offset >= 0) {
                order[array_length(order)] = start - offset;
            }
            offset++;
        }
        var vol = _volume;
        // Now, iterate over the alternating order and fill each cavity.
        for (var i = 0; i < array_length(order); i++) {
            var idx = order[i];
            var cav = chain.values[idx];
            vol = cav._fill_self_with_fluid(_fluid, vol);
            if (vol <= 0) break;
        }
        return vol;
    };
	
	/// Pull Out Logic  
	static pull_out = function(_phallus, _length) {
		if (content[? _phallus]) {
			var _data = content[? _phallus];
			var _withdraw_length = min(_length, _data.depth);

			_data.depth -= _withdraw_length;
			_data.volume -= _data.area * _withdraw_length;
			if (_data.depth <= 0) {
				ds_map_delete(content, _phallus);
			}
			used_capacity = max(0, used_capacity - _data.volume);
			used_width = max(0, used_width - _phallus.area);

			if (_length > max_depth) {
				if (between(chain_pos - 1, 0, chain.size - 1)) {
					var next = chain[chain_pos - 1];
					next.pull_out(_phallus, _length - max_depth);
				}
			}
			show_debug_message(_phallus.name + " exited their " + name);
		}
		return self;
	};

}

