///@desc Clears a bit at a specific index (turns it off)
///@param _mask The original bitmask
///@param _index The bit index to clear
///@ret The modified bitmask
function imask_clear_bit(_mask, _index) {
    return _mask & ~(1 << _index);
}
