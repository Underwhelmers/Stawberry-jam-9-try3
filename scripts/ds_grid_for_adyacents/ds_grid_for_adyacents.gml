function ds_grid_for_adyacents(_index, _xcenter, _ycenter, _adyacency_mode, _func) {
    var _directions = [];
    
    // Determine directions based on adjacency mode
    switch (_adyacency_mode) {
        case AdyacencyMode.LATERALS:
            _directions = [
                [-1,  0],  // Left
                [ 1,  0],  // Right
                [ 0, -1],  // Up
                [ 0,  1]   // Down
            ];
            break;
            
        case AdyacencyMode.LATERALS_AND_DIAGONALS:
            _directions = [
                [-1,  0],  // Left
                [ 1,  0],  // Right
                [ 0, -1],  // Up
                [ 0,  1],  // Down
                [-1, -1],  // Top-Left
                [ 1, -1],  // Top-Right
                [-1,  1],  // Bottom-Left
                [ 1,  1]   // Bottom-Right
            ];
            break;
    }

    // Apply function to adjacent cells
    var _grid_width = ds_grid_width(_index);
    var _grid_height = ds_grid_height(_index);
    
    for (var _i = 0; _i < array_length(_directions); _i++) {
        var _x = _xcenter + _directions[_i][0];
        var _y = _ycenter + _directions[_i][1];
        
        // Check bounds
        if (_x >= 0 && _x < _grid_width && _y >= 0 && _y < _grid_height) {
            var _value = ds_grid_get(_index, _x, _y);
            _func(_value, _x, _y);
        }
    }
}

enum AdyacencyMode {
	LATERALS,
	LATERALS_AND_DIAGONALS
}