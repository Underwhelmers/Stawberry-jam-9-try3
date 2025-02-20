///@desc Adds specific bits to a bitmask
///@param _mask The original bitmask
///@param _bits The bits to add
///@ret The modified bitmask
function imask_add(_mask, _bits) {
    return _mask | _bits;
}