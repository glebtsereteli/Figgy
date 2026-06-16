
/// This function contains the full setup definition for your Figgy configuration.
/// • All Setup-related methods MUST be called inside. Calling them outside will throw an error.
/// • Figgy calls this function automatically during initialization.
/// • Do NOT rename, delete or call it yourself. Doing so will break initialization.
/// • Documentation: https://glebtsereteli.github.io/Figgy/pages/api/figgy/setup
function FiggySetup() {
	Figgy.NoScope().Window("Player", true, 458); {
		Figgy.Section("Stats");
			Figgy.String("Name", "Hero");
			Figgy.Int("Lives", 3, 1, 10);
			Figgy.Int("Stamina", 10, 1, 15);
			Figgy.Bool("Invincible", false);
		Figgy.Section("Movement");
			Figgy.Float("Walk Speed", 2, 1, 10, 0.1);
			Figgy.Float("Run Speed", 4, 1, 10, 0.1);
			Figgy.Float("Gravity", 0.5, 0, 5, 0.1);
			Figgy.Float("Jump Force", 8, 1, 20, 0.5);
		Figgy.NoScope().Section("Combat");
			Figgy.Group("Sword");
				Figgy.Int("Damage", 10, 1, 100);
				Figgy.Int("Range", 32, 8, 128, 8);
			Figgy.Group("Gun");
				Figgy.Int("Ammo", 30, 0, 200, 5);
				Figgy.Int("Fire Delay", 15, 5, 60);
		Figgy.Section("Appearance");
			Figgy.Any("Skin", "Green", ["Green", "Pink", "Purple", "Yellow"]);
			Figgy.Float("Outline Width", 1, 0, 4, 0.5);
			Figgy.Color("Outline Color", c_black);
			Figgy.Bool("Cast Shadow", true);
	}
	Figgy.Window("Enemies"); {
		Figgy.Int("Max Active", 20, 1, 100);
		Figgy.Float("Spawn Interval", 2, 0.1, 10, 0.1);
		Figgy.Bool("Friendly Fire", false);
		Figgy.Section("Slime");
			Figgy.Int("Health", 5, 1, 50);
			Figgy.Int("Damage", 1, 1, 20);
			Figgy.Float("Move Speed", 1.5, 0.1, 8, 0.1);
			Figgy.Asset("Spawn Effect", sprEffectPoof);
		Figgy.Section("Bat");
			Figgy.Int("Health", 3, 1, 50);
			Figgy.Int("Damage", 2, 1, 20);
			Figgy.Float("Move Speed", 4, 0.1, 8, 0.1);
			Figgy.Float("Detection Range", 128, 16, 512, 16);
			Figgy.Asset("Spawn Effect", sprEffectPoof);
	}
	Figgy.Window("World"); {
		Figgy.Group("Generation");
			Figgy.Comment(" Changing any value below regenerates the world.").Comment("");
			Figgy.OnChangeSet(function(_new, _old, _varName) {
				show_debug_message($"\"{_varName}\" changed from '{_old}' to '{_new}'");
				// Regenerate world...
			});
			Figgy.Asset("Tileset", tsWorldGrass, "World Skin");
			Figgy.Float("Spawn Rate", 0.5, 0, 1);
			Figgy.Float("Tree Density", 0.1, 0, 1);
			Figgy.Real("Seed", 0, 0, 9999);
			Figgy.OnChangeReset();
			
			Figgy.Separator();
			Figgy.Button("Regenerate", function() {
				show_message("Regenerating world!");
			});
	}
	Figgy.Window("Transition"); {
		Figgy.Int("Time", 20, 0, 60);
		Figgy.Curve("Curve", acGeneral, "Ease In Out");
		Figgy.Color("Color", c_black);
	}
}
