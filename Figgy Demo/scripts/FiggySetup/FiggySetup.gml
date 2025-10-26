
function FiggySetup() {
	Figgy.Window("Player", true);
		Figgy.Float("Move Speed", 5, 0.1, 10);
		Figgy.Float("Ground Acceleration", 1, 0, 1, 0.05);
		Figgy.Float("Ground Deceleration", 1, 0, 1, 0.05);
		Figgy.Float("Air Acceleration", 1, 0, 1, 0.05);
		Figgy.Float("Air Deceleration", 1, 0, 1, 0.05);
		Figgy.Float("Gravity", 1, 0.1, 1.5);
		Figgy.Int("Jump Speed", 15, 10, 20);
		Figgy.Int("Jump Buffer", 7, 5, 15);
		Figgy.Int("Coyote Time", 10, 0, 20);
		Figgy.Float("Max Fall Speed", 15, 10, 20);
}

/*
Figgy.Window("Player", true);
		Figgy.Text("Name", "Geraldine");
		Figgy.Color("Color", c_aqua);
		Figgy.Section("Stats");
			Figgy.Int("Health", 100, 0, 300, 10);
			Figgy.Int("Energy", 100, 0, 300, 10);
			Figgy.Bool("Extra Strong", true);
			Figgy.Comment("Some very important comment!");
		Figgy.Section("Movement");
			Figgy.Float("Move Speed", 3, 0.1, 10);
			Figgy.Float("Jump Speed", 8, 0.1, 20);
	
	Figgy.Window("Enemy");
		Figgy.Int("Health", 100, 0, 300, 10);