///@desc Gets the lowest active bit in a bitmask (returns power of two)
///@param _mask The bitmask to analyze
///@ret The lowest active bit as a power of two
function imask_lowest_bit(_mask) {
    return _mask & -_mask;
}
