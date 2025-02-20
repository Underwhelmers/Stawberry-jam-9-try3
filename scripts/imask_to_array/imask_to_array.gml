///@desc Converts a bitmask back into an array of booleans
///@param _mask The bitmask to convert
///@param _size The size of the resulting array
///@ret An array of booleans representing the bitmask
function imask_to_array(_mask, _size) {
    var arr = array_create(_size, false);
    for (var i = 0; i < _size; i++) {
        arr[i] = (_mask & (1 << i)) != 0;
    }
    return arr;
}
