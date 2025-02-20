///@desc Gets the highest active bit in a bitmask
///@param _mask The bitmask to analyze
///@ret The highest active bit as a power of two
function imask_highest_bit(_mask) {
    var highest = 0;
    while (_mask > 0) {
        highest = _mask;
        _mask &= _mask - 1;
    }
    return highest;
}
