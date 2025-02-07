// this is not working as intended or at all.
function dialog_action_if(_data) {
    var _condition = dialog_action_condition_parser(_data[1]);
    if (_condition) {
        return dialog_process_next_data(array_subgroup(_data,2));
    }
    return true;
}

