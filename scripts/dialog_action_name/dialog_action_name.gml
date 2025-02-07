function dialog_action_name(_data) {
    if (_data[1] == "reset") {
        name.reset();
    } else {
        name.update(_data[1]);
    }
    return true;
}
