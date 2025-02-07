diag_progress = 0;
full_dialog = [
    ["text","This is some test for the display progress to write."],
    ["text","This is some test for the display progress to write."],
    ["text","This is some test for the display progress to write."],
    ["text","This is some test for the display progress to write."]
];
backbox = new DialogBackbox();
backbox.x = 0;
backbox.y = room_height - backbox.height;

text = new DialogText(backbox);
image = new DialogImage(backbox);
name = new DialogName(backbox);

alarm[0] = 2;

progress_dialog = function() {
    if (text.is_loading()) {
        text.load_all_instantly();
    } else if (!instance_exists(obj_dialog_option)) {
        alarm[0] = 2;
    }
}
