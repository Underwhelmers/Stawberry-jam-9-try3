///@desc Converts an array of booleans into a bitmask
///@param _array The array of booleans
///@ret The generated bitmask
function imask_from_array(_array) {
    var val = 0;
    var base = 1;
    for (var i = 0, count = array_length(_array); i < count; i++) {
        val += _array[i] ? base : 0;
        base *= 2;
    }
    return val;
}
