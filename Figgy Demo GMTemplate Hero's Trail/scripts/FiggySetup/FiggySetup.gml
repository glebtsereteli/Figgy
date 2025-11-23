/**
	This function contains the full setup definition for your Figgy configuration.
	• All Setup-related methods MUST be called inside. Calling them ouside will throw an error.
	• Figgy calls this function automatically during initialization.
	• Do NOT rename, delete or call it yourself. Doing so will break initialization.
	• Documentation: https://glebtsereteli.github.io/Figgy/pages/api/figgy/setup
*/
function FiggySetup() {
	Figgy.Window("Player", true); {
		Figgy.Int("Max Hearts", 4, 1, 30, 1, function(_maxHearts) {
			with (obj_player) {
				hearts = _maxHearts;
			}
		});
		Figgy.Float("Move Speed", 4, 1, 10, 0.25, function(_moveSpeed) {
			with (obj_player) {
				move_speed = _moveSpeed;
			}
		});
		Figgy.Section("Shield"); {
			Figgy.Float("Use Speed", 0.4, 0.1, 3);
			Figgy.Int("Max Power", 100, 20, 200, 5);
			Figgy.Float("Recharge Speed", 0.1, 0.1, 2);
		}
		Figgy.Section("Powerups"); {
			static _Powerup = function(_name, _time, _spdMult, _color) {
				Figgy.Group(_name);
					Figgy.Float("Duration", _time, 3, 15).Comment("seconds", true);
					Figgy.Float("Speed Multiplier", _spdMult, 1, 3);
					Figgy.Color("Color", _color);
			};
			
			_Powerup("Invincibility", 10, 1.5, #FFFB46);
			_Powerup("Speed", 5, 2, #76F63A);
		}
		Figgy.Section("Knockback"); {
			Figgy.Int("Duration", 20, 5, 60);
			Figgy.Float("Speed", 12, 5, 20, 0.5);
		}
		Figgy.Section("Fast Trail"); {
			Figgy.Float("Scale", 1.1, 1, 2);
			Figgy.Color("Color", c_white);
			Figgy.Float("Alpha", 0.1, 0, 1);
		}
	}
	Figgy.Window("Enemies"); {
		Figgy.Section("Baddie"); {
			Figgy.Float("Move Speed", 2, 1, 5, 0.25, function() {
				with (obj_baddie) {
					path_speed = cfg.MoveSpeed;
				}
			});
		}
		Figgy.Section("Bat"); {
			Figgy.Float("Roam Speed", 2, 1, 5);
			Figgy.Float("Roam Spin", 2, 1, 5);
			Figgy.Int("Detect Range", 200, 100, 600, 25);
			Figgy.Float("Chase Speed", 3, 1, 5);
			Figgy.Int("Shoot Delay", 90, 10, 120, 5);
			Figgy.Float("Projectile Speed", 4, 2, 10, 0.2);
		}
	}
}
