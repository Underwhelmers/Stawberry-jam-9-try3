///@desc Converts an array of anything into a bitmask
///@param _array The array of anything
///@param _to_bool The function that converts the current value in a boolean
///@ret The generated bitmask
function imask_from_array_ext(_array, _to_bool) {
    var val = 0;
    var base = 1;
    for (var i = 0, count = array_length(_array); i < count; i++) {
        val += _to_bool(_array[i]) ? base : 0;
        base *= 2;
    }
    return val;
}
