function dialog_action_followup(_data) {
	return dialog_action_text(array_concat(_data,["prefix-space","keep-old-text"]))
}