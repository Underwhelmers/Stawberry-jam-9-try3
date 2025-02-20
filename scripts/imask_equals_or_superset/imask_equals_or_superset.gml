///@desc Checks if either mask fully contains the other
///@param _mask1 The first bitmask
///@param _mask2 The second bitmask
///@ret Returns true if one mask is a superset of the other
function imask_equals_or_superset(_mask1, _mask2) {
    var res = _mask1 | _mask2;
    return res == _mask1 || res == _mask2;
}
