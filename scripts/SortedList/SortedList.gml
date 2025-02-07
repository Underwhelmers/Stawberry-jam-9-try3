function SortedList() constructor {
    _int_list = ds_list_create(); // Internal storage for the sorted list

    // Adds an entity with value and priority
    static add = function(_value, _priority) {
        // Create the entity struct
        var entity = {
            value: _value,
            priority: _priority
        };

        // Find the correct position to insert the new entity
        for (var i = 0; i < ds_list_size(_int_list); i++) {
            if (_int_list[|i].priority > _priority) {
                ds_list_insert(_int_list, i, entity); // Insert in sorted position
                return;
            }
        }

        // If not inserted, append to the end
        ds_list_add(_int_list, entity);
    };

    // Removes the first element in the list
    static remove_first = function() {
        if (!ds_list_empty(_int_list)) {
            ds_list_delete(_int_list, 0);
        }
    };

    // Retrieves the first element without removing it
    static peek_first = function() {
        if (!ds_list_empty(_int_list)) {
            return _int_list[|0];
        }
        return undefined;
    };

    // Clears the entire list
    static clear = function() {
        ds_list_clear(_int_list);
    };

    // Destroys the list
    static destroy = function() {
        ds_list_destroy(_int_list);
    };

    // Debug: Print the list
    static debug_print = function() {
        for (var i = 0; i < ds_list_size(_int_list); i++) {
            show_debug_message("Value: " + string(_int_list[|i].value) + ", Priority: " + string(_int_list[|i].priority));
        }
    };

    // Get an item at a specific index
    static get = function(_idx) {
        return _int_list[| _idx];
    };

    // Get the size of the list
    static size = function() {
        return ds_list_size(_int_list);
    };

    // Remove an entity by its value
    static remove_value = function(_value) {
        for (var i = 0; i < ds_list_size(_int_list); i++) {
            if (_int_list[i].value == _value) {
                ds_list_delete(_int_list, i);
                return true; // Successfully removed
            }
        }
        return false; // Value not found
    };

    // Remove an entity by its priority
    static remove_priority = function(_priority) {
        for (var i = 0; i < ds_list_size(_int_list); i++) {
            if (_int_list[i].priority == _priority) {
                ds_list_delete(_int_list, i);
                return true; // Successfully removed
            }
        }
        return false; // Priority not found
    };
}
