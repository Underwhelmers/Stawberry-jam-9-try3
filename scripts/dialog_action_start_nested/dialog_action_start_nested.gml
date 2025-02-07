function dialog_action_start_nested(_data) {
    // Retrieve the nested dialog data
    var _nested_dialog = global.dialogs.available[? _data[1]];

    // If the nested dialog exists
    if (array_length(_nested_dialog) > 0) {
        // Split the current dialog into "before" and "after"
        var before = array_create(diag_progress-1);
		array_copy(before, 0, full_dialog, 0, diag_progress - 1); // All processed elements
        var after = array_create(array_length(full_dialog)-diag_progress);
		array_copy(after, 0, full_dialog, diag_progress, array_length(after));        // Remaining elements

        // Merge "before", "nested", and "after" into a new dialog
        full_dialog = array_concat(before, _nested_dialog, after);

        // Adjust diag_progress to point to the first line of the nested dialog
        diag_progress--; // Decrement to reprocess the current step (start of nested dialog)
    }

    return true;
}
