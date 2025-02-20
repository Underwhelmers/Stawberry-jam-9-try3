/// @function TentEncBodyUbicationDisposition(_config)
/// @description This class holds a configuration mapping for positioning each
///              TentEncBodyUbication on a body. Each ubication is associated with a position,
///              for example defined as an (x,y) coordinate.
/// @param _config Optional initial configuration ds_map.
///                Each entry should be a key (ubication identifier) with a value:
///                { ubication: <TentEncBodyUbication>, x: <x-coordinate>, y: <y-coordinate> }
function TentEncBodyUbicationDisposition(_config = ds_map_create()) constructor {
    config = _config;
    
    static add = function(_ubication, _x, _y) {
        // Store a structure with the ubication and its position.
        ds_map_add(config, _ubication.identifier, { ubication: _ubication, x: _x, y: _y });
    };
    
    static get_position = function(_ubication) {
        if (ds_map_exists(config, _ubication.identifier)) {
            return ds_map_find_value(config, _ubication.identifier);
        }
        return undefined; // Not configured.
    };
    
    static set_position = function(_ubication, _x, _y) {
        var pos = { ubication: _ubication, x: _x, y: _y };
		config[? _ubication.identifier] = pos;
    };
    
    static remove = function(_ubication) {
        if (ds_map_exists(config, _ubication.identifier)) {
            ds_map_delete(config, _ubication.identifier);
        }
    };
	
	static get_all_positions = function() {
        var keys = ds_map_keys(config);
        var arr = [];
        for (var i = 0; i < array_length(keys); i++) {
            var key = keys[i];
            array_push(arr, ds_map_find_value(config, key));
        }
        return arr;
    };
    
    static get_config = function() {
        return config;
    };
}