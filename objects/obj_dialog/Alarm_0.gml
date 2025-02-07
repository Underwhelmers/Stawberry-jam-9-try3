if (diag_progress < array_length(full_dialog)) {
    while(
        diag_progress < array_length(full_dialog) &&
        dialog_process_next_data(full_dialog[diag_progress++])
    ) {}
} else if (instance_number(obj_dialog_option) == 0) {
	instance_destroy();
}