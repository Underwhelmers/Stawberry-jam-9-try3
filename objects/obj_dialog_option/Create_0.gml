callback = function() {
    with (obj_dialog) {
        dialog_process_next_data(array_subgroup(other.create_data,2));
		alarm[0] = 2;
    }
    instance_destroy(obj_dialog_option);
}
