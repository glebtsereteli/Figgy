
// @Figgy: Set up a global reference to the config + a macro shortcut for convenient access.
#macro CFG global.__config 
CFG = Figgy.GetCurrent();

weapon_shooting_reset(); // @Figgy: Moved from 'weapon_shooting' script to initialize after configs.
weapon_swipe_reset(); // @Figgy: Moved from the 'weapon_swipe' script to initialize after configs.
weapon_trail_reset(); // @Figgy: Moved from 'weapon_trail' script to initialize after configs.
