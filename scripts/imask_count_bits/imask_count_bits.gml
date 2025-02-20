///@desc Counts the number of active bits (1s) in a bitmask
///@param _mask The bitmask to analyze
///@ret The number of active bits in the bitmask
function imask_count_bits(_mask) {
    var count = 0;
    while (_mask > 0) {
        count += _mask & 1;
        _mask = _mask >> 1;
    }
    return count;
}
