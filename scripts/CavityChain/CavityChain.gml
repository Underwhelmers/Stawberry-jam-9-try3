function CavityChain(_chain) constructor {
	values = _chain;
	size = array_length(_chain);
	
	for (var i = 0; i < array_length(_chain); i++) {
		_chain[i].chain = self;
		_chain[i].chain_pos = i;
	}
}