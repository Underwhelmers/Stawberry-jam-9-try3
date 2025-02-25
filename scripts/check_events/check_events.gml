function check_events() {
    for (var i = 0; i < array_length(global.game_state.events); i++) {
        var event = global.game_state.events[i];
        if (event.trigger()) {
            event.outcome();
            array_delete(global.game_state.events, i, 1); // Remove one-time event
            i--;
        }
    }
}