
function FiggySetup() {
	Figgy.Window("Player");
		Figgy.Text("Name", "Geraldine");
		Figgy.Color("Color", c_aqua);
		Figgy.Section("Stats");
			Figgy.Int("Health", 100, 0, 300, 10);
			Figgy.Int("Energy", 100, 0, 300, 10);
			Figgy.Boolean("Extra Strong", true);
			Figgy.Comment("Some imaginary value!");
		Figgy.Section("Movement");
			Figgy.Float("Move Speed", 3, 0.1, 10);
			Figgy.Float("Jump Speed", 8, 0.1, 20);
	
	Figgy.Window("Enemy");
		Figgy.Int("Health", 100, 0, 300, 10);
}
