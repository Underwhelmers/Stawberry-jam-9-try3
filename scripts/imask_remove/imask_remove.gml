///@desc Removes specific bits from a bitmask
///@param _mask The original bitmask
///@param _bits The bits to remove
///@ret The modified bitmask
function imask_remove(_mask, _bits) {
    return _mask & ~_bits;
}
