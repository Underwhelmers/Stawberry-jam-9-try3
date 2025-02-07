function dialog_gamestate_update(_action, _key, _value = noone) {
    switch (_action) {
        case "count":
            dialog_gamestate_get(_key, DialogGamestateType.NUMBER).value += 1;
            break;
        case "consume":
            var _current = dialog_gamestate_get(_key, DialogGamestateType.NUMBER);
            if (_current.value >= 1) {
                _current.value -= 1;
            }
            break;
        case "tag true":
            dialog_gamestate_set(_key, DialogGamestateType.BOOLEAN, true);
            break;
        case "tag false":
            dialog_gamestate_set(_key, DialogGamestateType.BOOLEAN, false);
            break;
        case "tag pending":
            dialog_gamestate_set(_key, DialogGamestateType.TEMPORAL, true);
            break;
        case "set key":
            dialog_gamestate_set(_key, DialogGamestateType.STRING, _value);
            break;
        case "set real":
            dialog_gamestate_set(_key, DialogGamestateType.NUMBER, real(_value));
            break;
        //case "add":
        //    if (!ds_exists(global.dialogs.gamestate[? _key], ds_type_list)) {
        //        global.dialogs.gamestate[? _key] = ds_list_create();
        //    }
        //    ds_list_add(global.dialogs.gamestate[? _key], _value);
        //    break;
        case "remove":
            ds_map_delete(global.dialogs.gamestate, _key);
            break;
    }
}
