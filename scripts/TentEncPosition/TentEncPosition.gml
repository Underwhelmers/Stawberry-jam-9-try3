/// @function TentEncPosition(_dispositionA, _dispositionB)
/// @description This class holds the adjacency relationships between two TentEncBodyUbicationDisposition instances.
///              You can set adjacent relationships between body parts (ubications) and later query them.
/// @param _dispositionA The first body disposition.
/// @param _dispositionB The second body disposition.
function TentEncPosition(_dispositionA, _dispositionB) constructor {
    // Store the two dispositions for reference (if needed).
    dispositionA = _dispositionA;
    dispositionB = _dispositionB;
    
    // Internal mapping to hold adjacent relationships.
    // Key: ubication.identifier ; Value: a ds_list containing adjacent TentEncBodyUbication objects.
    adjacencies = ds_map_create();
    
    /// @desc Sets an adjacency relationship between two ubications.
    ///       By default, the relationship is bidirectional.
    /// @param _ub1 The first TentEncBodyUbication.
    /// @param _ub2 The second TentEncBodyUbication.
    /// @param _bidirectional Optional (default true). If true, the adjacency is stored both ways.
    set_adjacent = function(_ub1, _ub2, _bidirectional) {
        if (argument_count < 3) _bidirectional = true;
        
        // For _ub1: add _ub2 to its list of adjacent ubications.
        if (!ds_map_exists(adjacencies, _ub1.identifier)) {
            ds_map_add(adjacencies, _ub1.identifier, ds_list_create());
        }
        var list1 = ds_map_find_value(adjacencies, _ub1.identifier);
        if (ds_list_find_index(list1, _ub2) == -1) {
            ds_list_add(list1, _ub2);
        }
        
        // If bidirectional, add _ub1 as adjacent to _ub2.
        if (_bidirectional) {
            if (!ds_map_exists(adjacencies, _ub2.identifier)) {
                ds_map_add(adjacencies, _ub2.identifier, ds_list_create());
            }
            var list2 = ds_map_find_value(adjacencies, _ub2.identifier);
            if (ds_list_find_index(list2, _ub1) == -1) {
                ds_list_add(list2, _ub1);
            }
        }
    };
    
    /// @desc Returns an array of all ubications that have been set as adjacent to the given ubication.
    /// @param _ubication The TentEncBodyUbication to query.
    /// @return An array of TentEncBodyUbication objects (could be empty).
    get_adjacent = function(_ubication) {
         if (ds_map_exists(adjacencies, _ubication.identifier)) {
            var list = ds_map_find_value(adjacencies, _ubication.identifier);
            var result = [];
            for (var i = 0; i < ds_list_size(list); i++) {
                array_push(result, ds_list_find_value(list, i));
            }
            return result;
         }
         return [];
    };
    
    /// @desc Call this method when the TentEncPosition instance is no longer needed,
    ///       so that all dynamic data structures are properly destroyed.
    destroy = function() {
         var keys = ds_map_keys(adjacencies);
         for (var i = 0; i < array_length(keys); i++) {
             var key = keys[i];
             var list = ds_map_find_value(adjacencies, key);
             ds_list_destroy(list);
         }
         ds_map_destroy(adjacencies);
    };
}