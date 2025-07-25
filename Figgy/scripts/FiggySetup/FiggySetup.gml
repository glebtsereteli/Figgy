
function FiggySetup() {
	Figgy.section("Player"); {
		Figgy.text("Name", "Geraldine");
		Figgy.color("Color", c_aqua);
		Figgy.group("Stats");
			Figgy.int("Health", 100, 0, 300, 10);
			Figgy.int("Energy", 100, 0, 300, 10);
			Figgy.boolean("Extra Strong", true);
			Figgy.comment("Some imaginary value!");
		Figgy.group("Movement");
			Figgy.float("Move Speed", 3, 0.1, 10);
			Figgy.float("Jump Speed", 8, 0.1, 20);
	}
	Figgy.section("Enemy"); {
		Figgy.int("Health", 100, 0, 300, 10);
	}
}
