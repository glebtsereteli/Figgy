
function FiggySetup() {
	Figgy.Window("Player", true);
		global.playerSkins = ["Green", "Pink", "Purple", "Yellow"];
		Figgy.Multi("Skin", global.playerSkins[0], global.playerSkins, global.playerSkins, function() {
			with (objPlayer) {
				UpdateSprite();
			}
		});
		Figgy.Float("Move Speed", 5, 0.1, 10);
		Figgy.Float("Ground Acceleration", 1, 0, 1, 0.05);
		Figgy.Float("Ground Deceleration", 1, 0, 1, 0.05);
		Figgy.Float("Air Acceleration", 1, 0, 1, 0.05);
		Figgy.Float("Air Deceleration", 1, 0, 1, 0.05);
		Figgy.Float("Gravity", 1, 0.1, 1.5);
		Figgy.Int("Jump Speed", 15, 10, 20);
		Figgy.Int("Jump Buffer", 7, 5, 15);
		Figgy.Int("Max Jumps", 1, 1, 3);
		Figgy.Int("Coyote Time", 10, 0, 20);
		Figgy.Float("Max Fall Speed", 15, 10, 20);
	
	Figgy.Window("Camera");
		Figgy.Float("Lerp Step X", 0.2, 0.05, 1, 0.05);
		Figgy.Float("Lerp Step Y", 0.2, 0.05, 1, 0.05);
		Figgy.Bool("Clamp", true);
		Figgy.Float("Zoom", 0.5, 0.1, 2);
}
