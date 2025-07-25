
FIGGY_SETUP_START

Figgy.section("Player"); {
	Figgy.text("Name", "Geraldine");
	Figgy.color("Color", c_aqua);
	Figgy.group("Stats");
		Figgy.int("Health", 100, 0, 300, 10, function(_new, _old) {
			show_debug_message($"Player Health changed from {_old} to {_new}");
		});
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

FIGGY_SETUP_END
