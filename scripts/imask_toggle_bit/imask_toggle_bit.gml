///@desc Toggles a bit at a specific index
///@param _mask The original bitmask
///@param _index The bit index to toggle
///@ret The modified bitmask
function imask_toggle_bit(_mask, _index) {
    return _mask ^ (1 << _index);
}
