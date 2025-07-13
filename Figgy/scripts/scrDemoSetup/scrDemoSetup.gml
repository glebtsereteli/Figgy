
FIGGY_SETUP_START

Figgy.section("Player");
	Figgy.text("Name", "Geraldine");
	Figgy.group("Stats");
		Figgy.int("Health", 100, 0, 300, 10);
		Figgy.int("Energy", 100, 0, 300, 10);
		Figgy.boolean("Extra Strong", true);
		Figgy.comment("Some imaginary value!");
	Figgy.group("Movement");
		Figgy.float("Move Speed", 3, 0.1, 10);
		Figgy.float("Jump Speed", 8, 0.1, 20);
	Figgy.ungroup();
	Figgy.int("Test", 50, 1, 100);
	Figgy.multi("Color", "Red", ["Red", "Green", "Blue", "Yellow", "Pink", "Brown", "Purple"]);
	Figgy.button("Click Me Baby", function() {
		show_message("Hello There!");
	});

FIGGY_SETUP_END
