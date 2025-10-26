
#macro EVENT_METHOD event_user(14)
#macro EVENT_FSM event_user(15)

function DemoOnChange(_new, _old, _name) {
	show_debug_message($"Changed variable \"{_name}\" from {_old} to {_new}.");
}
