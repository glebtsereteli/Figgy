/**
	This function contains the full setup definition for your Figgy configuration.
	• All Setup-related methods MUST be called inside. Calling them ouside will throw an error.
	• Figgy calls this function automatically during initialization.
	• Do NOT rename, delete or call it yourself. Doing so will break initialization.
	• Documentation: https://glebtsereteli.github.io/Figgy/pages/api/figgy/setup
*/
function FiggySetup() {
	var _yBottom = window_get_height() - FIGGY_WINDOW_DEFAULT_HEIGHT - 8;
	
	Figgy.Window("Hero", true,, _yBottom); {
		Figgy.NoScope().Section("Stats"); {
			Figgy.Int("Health", 10, 1, 30, 1, function(_health) {
				with (obj_hero) {
					hitpoints = _health;
				}
			});
			Figgy.Int("Speed", 10, 1, 20);
		}
		Figgy.Section("Shooting"); {
			Figgy.NoScope().Group("General");
				Figgy.Int("Range", 1000, 250, 2000, 50);
				Figgy.Int("Spread", 20, 0, 30);
				Figgy.Int("Bullet Speed", 10, 5, 30);
			Figgy.Group("Base Stats");
				Figgy.OnChangeSet(weapon_shooting_reset);
				Figgy.Float("Damage", 0.75, 0.5, 2);
				Figgy.Int("Attack Speed", 30, 5, 90);
				Figgy.Int("Number Of Shots", 1, 1, 3);
				Figgy.Bool("Unlocked", true);
				Figgy.OnChangeReset();
		}
		Figgy.Section("Swipe"); {
			Figgy.NoScope().Group("General");
				Figgy.Int("Range", 1000, 100, 2000, 120);
				Figgy.Float("Scale", 1.5, 0.5, 2);
			Figgy.Group("Base Stats");
				Figgy.OnChangeSet(weapon_swipe_reset);
				Figgy.Float("Damage", 1, 0.5, 2);
				Figgy.Int("Attack Speed", 60, 5, 120);
				Figgy.Bool("Unlocked", false);
				Figgy.OnChangeReset();
		}
		Figgy.Section("Trail"); {
			Figgy.NoScope().Group("General");
				Figgy.Int("Range", 1000, 100, 2000, 50);
				Figgy.Float("Scale", 1.5, 0.5, 2);
			Figgy.Group("Base Stats");
				Figgy.OnChangeSet(weapon_trail_reset);
				Figgy.Float("Damage", 1, 0.5, 2);
				Figgy.Int("Attack Speed", 60, 5, 120);
				Figgy.Bool("Unlocked", false);
				Figgy.OnChangeReset();
		}
	}
	Figgy.Window("Enemies"); {
		var _Enemy = function(_name) {
			Figgy.Section(_name);
				Figgy.Float("Speed", 4, 1, 10);
				Figgy.Int("Damage", 1, 1, 5);
		};
		
		_Enemy("Pumpkill");
		_Enemy("Pigun");
		_Enemy("Rooster");
	}
	Figgy.Window("Pickups"); {
		var _Pickup = function(_name) {
			Figgy.Group(_name);
				Figgy.Int("Range", 300, 100, 1000, 50);
				Figgy.Float("Acceleration", 0.3, 0.1, 2);
		};
		
		_Pickup("Heart");
		_Pickup("Collectable");
	}
}
