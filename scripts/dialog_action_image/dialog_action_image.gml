function dialog_action_image(_data) {
    if (_data[1] == "reset") {
        image.reset();
    } else {
        image.update(asset_get_index(_data[1]));
    }
    return true;
}
