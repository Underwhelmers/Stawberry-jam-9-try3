///@desc Checks if any bits match between two masks
///@param _mask1 The first bitmask
///@param _mask2 The second bitmask
///@ret Returns true if any bits overlap
function imask_overlaps(_mask1, _mask2) {
    return (_mask1 & _mask2) != 0;
}
