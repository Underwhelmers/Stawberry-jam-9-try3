///@desc Checks if a bitmask fully contains another bitmask
///@param _mask_container The containing bitmask
///@param _mask_tested The bitmask to test
///@ret Returns true if _mask_container fully includes _mask_tested
function imask_contains_all(_mask_container, _mask_tested) {
    return (_mask_container & _mask_tested) == _mask_tested;
}
