function ParalaxDisplacementBackground() constructor {
    // Internal list to manage layers
    _int_list = new SortedList();	
    offset = 0;           // Current displacement offset
    drop_by_depth = 1;    // Modifier to control parallax effect

    /// Adds a new layer to the parallax system
    static add_layer = function(_img, _index, _depth) {
        if (!sprite_exists(_img)) {
            show_error("Error: Invalid sprite supplied to add_layer.", true);
            return;
        }

        var _layer = {
            sprite: _img,
            index: _index,
            depth: _depth,
            width: sprite_get_width(_img),
            height: sprite_get_height(_img)
        };
        
        // Add the layer to the sorted list (negative depth for sorting)
        _int_list.add(_layer, -_depth);
    };
	
	/// Draws all layers in the parallax background
	static draw = function(x, y) {
		for (var i = 0, size = _int_list.size(); i < size; i++) {
		    var _inst = _int_list.get(i).value;

		    // Normalize the offset to avoid gaps or infinite growth
		    var layer_offset = offset / (_inst.depth * drop_by_depth);
		    var normalized_offset = layer_offset % _inst.width;
		    if (normalized_offset < 0) normalized_offset += _inst.width; // Handle negative offsets

		    // Calculate how many sprites to draw
		    var _repeats = ceil(SCREEN_W / _inst.width) + 2; // Add 2 for overdraw (left and right)

		    for (var j = -1; j < _repeats; j++) { // Start from -1 for full screen coverage
		        var draw_x = x + j * _inst.width - normalized_offset;
		        draw_sprite(_inst.sprite, _inst.index, draw_x, y);
		    }
		}
	};

    /// Updates the offset (for example, to simulate scrolling)
    static move = function(_delta) {
        offset += _delta;
    };

    /// Clears all layers
    static clear_layers = function() {
        _int_list.clear();
    };

    /// Debug: Print layer details
    static debug_print_layers = function() {
        for (var i = 0, size = _int_list.size(); i < size; i++) {
            var _inst = _int_list.get(i).value;
            show_debug_message(
                "Layer " + string(i) + ": Sprite=" + string(_inst.sprite) +
                ", Index=" + string(_inst.index) +
                ", Depth=" + string(_inst.depth)
            );
        }
    };
}