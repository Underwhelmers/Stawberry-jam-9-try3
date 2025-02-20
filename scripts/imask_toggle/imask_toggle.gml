///@desc Toggles specific bits in a bitmask
///@param _mask The original bitmask
///@param _bits The bits to toggle
///@ret The modified bitmask
function imask_toggle(_mask, _bits) {
    return _mask ^ _bits;
}
