///@desc Checks if a specific bit is set in a bitmask
///@param _mask The bitmask to check
///@param _index The bit index to check
///@ret Returns true if the bit is set
function imask_has_bit(_mask, _index) {
    return (_mask & (1 << _index)) != 0;
}
