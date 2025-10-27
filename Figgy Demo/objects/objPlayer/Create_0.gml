EVENT_METHOD;
EVENT_FSM;

cfg = CFG.Player;

xSpd = 0; xSpdFrac = 0;
ySpd = 0; ySpdFrac = 0;
facing = 1;
coyote = 0;
nJumps = 0;
colliders = [objCollider];
sprites = {};

array_foreach(global.playerSkins, function(_skin) {
	sprites[$ _skin] = {};
	
	static _states = fsm.get_states();
	var _i = 0; repeat (array_length(_states)) {
		var _state = _states[_i];
		sprites[$ _skin][$ _state] = asset_get_index($"sprPlayer{_skin}{_state}");
		_i++;
	}
});

fsm.enter();
