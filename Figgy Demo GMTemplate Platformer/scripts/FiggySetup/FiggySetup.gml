/*
	This function contains the full setup definition for your Figgy configuration.
	• All Setup-related methods MUST be called inside. Calling them ouside will throw an error.
	• Figgy calls this function automatically during initialization.
	• Do NOT rename, delete or call it yourself. Doing so will break initialization.
	• Documentation: https://glebtsereteli.github.io/Figgy/pages/api/figgy/setup
*/
function FiggySetup() {
	Figgy.Window("Character", true); {
		Figgy.Int("Health", 3, 1, 5, 1, function(_hp) {
			with (obj_character_parent) {
				hp = _hp;
			}
		});
		Figgy.Int("iFrames", 120, 0, 360, 10);
		Figgy.Int("Coin Value", 1, 1, 10);
		Figgy.NoScope().Section("Movement");
			Figgy.NoScope().Group("Horizontal");
				Figgy.Float("MoveSpeed", 8, 2, 16, 0.5);
				Figgy.Float("Friction", 0.7, 0.1, 2, 0.1);
			Figgy.NoScope().Group("Vertical");
				Figgy.Int("Jump Speed", 23, 10, 40);
				Figgy.Float("Gravity", 1, 0.5, 2);
		Figgy.Section("Defeat");
			Figgy.Float("Gravity", 1.5, 0.5, 2);
			Figgy.Int("Jump", 40, 10, 60);
			Figgy.Float("Spin", 3, 0.5, 5);
	}
	Figgy.Window("Enemy"); {
		Figgy.Int("Damage", 1, 0, 3);
		Figgy.NoScope().Section("Movement");
			Figgy.Float("MoveSpeed", 2, 1, 6, 0.1, function(_moveSpeed) {
				with (obj_enemy_parent) {
					start_moving();
				}
			});
			Figgy.Float("Friction", 0, 0.1, 2, 0.1);
			Figgy.Float("Gravity", 1, 0.5, 2);
	}
	Figgy.Window("Parallax"); {
		Figgy.Float("Trees 1", 0.6, 0.1, 1, 0.05);
		Figgy.Float("Trees 2", 0.7, 0.1, 1, 0.05);
		Figgy.Float("Clouds", 0.8, 0.1, 1, 0.05);
	}
}
