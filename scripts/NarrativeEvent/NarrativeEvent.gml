function NarrativeEvent(trigger, outcome) constructor {
    self.trigger = trigger;          // Function returning true when event should fire
    self.outcome = outcome;          // Function executing the event result
}