
FIGGY_SETUP_START

Figgy.section("Player");
	Figgy.group("Stats");
		Figgy.int("Health", 100, 1, 300);
		Figgy.int("Energy", 100, 1, 300);
		Figgy.boolean("Extra Strong", true);
	Figgy.group("Movement");
		Figgy.float("Move Speed", 3, 0.1, 10);
		Figgy.float("Jump Speed", 8, 0.1, 20);
	Figgy.ungroup();
	Figgy.int("Test", 50, 1, 100);

//CFG = {
//	Player: {
//		Vitals: {
//			Health: 100,
//			Energy: 100,
//		},
//		Movement: {
//			MoveSpeed: 3,
//			JumpSpeed: 10,
//		},
//	},
//};

FIGGY_SETUP_END
