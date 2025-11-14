/**
	This function contains the full setup definition for your Figgy configuration.
	• All Setup-related methods MUST be called inside. Calling them ouside will throw an error.
	• Figgy calls this function automatically during initialization.
	• Do NOT rename, delete or call it yourself. Doing so will break initialization.
	• Documentation: https://glebtsereteli.github.io/Figgy/pages/api/figgy/setup
*/
function FiggySetup() {
	Figgy.Window("Player", true);
		Figgy.NoScope().Section("General");
			global.playerSkins = ["Green", "Pink", "Purple", "Yellow"];
			Figgy.Any("Skin", global.playerSkins[0], global.playerSkins, global.playerSkins, function() {
				with (objPlayer) {
					UpdateSprite();
				}
			});
		Figgy.NoScope().Section("Movement");
			Figgy.NoScope().Group("Horizontal");
				Figgy.Float("Move Speed", 5, 0.1, 10);
				Figgy.Float("Ground Acceleration", 1, 0, 1, 0.05);
				Figgy.Float("Ground Friction", 1, 0, 1, 0.05);
				Figgy.Float("Air Acceleration", 1, 0, 1, 0.05);
				Figgy.Float("Air Friction", 1, 0, 1, 0.05);
			Figgy.NoScope().Group("Vertical");
				Figgy.Float("Gravity", 1, 0.1, 1.5);
				Figgy.Int("Jump Speed", 15, 10, 20);
				Figgy.Int("Jump Buffer", 7, 5, 15);
				Figgy.Int("Max Jumps", 1, 1, 3);
				Figgy.Int("Coyote Time", 10, 0, 20);
				Figgy.Float("Max Fall Speed", 15, 10, 20);
				Figgy.Int("Corner Tolerance", 16, 0, 32);
		Figgy.Section("Light");
			Figgy.Float("X Scale", 1, 0.1, 2);
			Figgy.Float("Y Scale", 1, 0.1, 2);
			Figgy.Float("Intensity", 1, 0.1, 2);
			Figgy.Color("Color", c_white);
			
	Figgy.Window("Camera");
		Figgy.Float("Lerp Step X", 0.2, 0.05, 1, 0.05);
		Figgy.Float("Lerp Step Y", 0.2, 0.05, 1, 0.05);
		Figgy.Int("Deadzone X", 0, 0, 200, 10);
		Figgy.Int("Deadzone Y", 0, 0, 200, 10);
		Figgy.Bool("Clamp", true);
		Figgy.Float("Zoom", 0.5, 0.1, 2);
	
	Figgy.Window("Lighting");
		Figgy.Bool("Enabled", true);
		Figgy.Color("Ambient Color", c_dkgray);
		Figgy.Bool("Soft", true);
		Figgy.Bool("Smooth", true);
	
	Figgy.Window("Display");
		static _modes = [DISPLAY_MODE_WINDOWED, DISPLAY_MODE_EXCLUSIVE_FULLSCREEN, DISPLAY_MODE_BORDERLESS_FULLSCREEN];
		Figgy.Any("Mode", _modes[0], _modes,, DemoRefreshDisplay);
		Figgy.Int("Window Scale", 2, 1, 6);
		Figgy.Button("Apply", DemoRefreshDisplay, 48, 19, true);
		Figgy.Float("Resolution Scale", 2, 0.5, 4, 0.5, function(_new, _old, _name) {
			show_debug_message($"variable {_name} changed from {_new} to {_old}");
		});
}
