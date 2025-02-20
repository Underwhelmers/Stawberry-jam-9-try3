///@desc Sets a bit at a specific index (turns it on)
///@param _mask The original bitmask
///@param _index The bit index to set
///@ret The modified bitmask
function imask_set_bit(_mask, _index) {
    return _mask | (1 << _index);
}
