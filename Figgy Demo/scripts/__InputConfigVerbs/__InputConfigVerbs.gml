
function __InputConfigVerbs() {
    enum INPUT_VERB {
        UP,
        DOWN,
        LEFT,
        RIGHT,
    }
    InputDefineVerb(INPUT_VERB.UP,		"up",		["W", vk_up],		[-gp_axislv, gp_padu]);
    InputDefineVerb(INPUT_VERB.DOWN,	"down",		["S", vk_down],		[+gp_axislv, gp_padd]);
    InputDefineVerb(INPUT_VERB.LEFT,	"left",		["A", vk_left],		[-gp_axislh, gp_padl]);
    InputDefineVerb(INPUT_VERB.RIGHT,	"right",	["D", vk_right],	[+gp_axislh, gp_padr]);
   
	enum INPUT_CLUSTER {
        NAVIGATION,
    }
    InputDefineCluster(INPUT_CLUSTER.NAVIGATION, INPUT_VERB.UP, INPUT_VERB.RIGHT, INPUT_VERB.DOWN, INPUT_VERB.LEFT);
}
