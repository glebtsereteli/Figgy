
function __InputConfigVerbs() {
    enum INPUT_VERB {
        UP,
        DOWN,
        LEFT,
        RIGHT,
        JUMP,
    }
    InputDefineVerb(INPUT_VERB.UP,		"up",		["W", vk_up],			[-gp_axislv, gp_padu]);
    InputDefineVerb(INPUT_VERB.DOWN,	"down",		["S", vk_down],			[+gp_axislv, gp_padd]);
    InputDefineVerb(INPUT_VERB.LEFT,	"left",		["A", vk_left],			[-gp_axislh, gp_padl]);
    InputDefineVerb(INPUT_VERB.RIGHT,	"right",	["D", vk_right],		[+gp_axislh, gp_padr]);
    InputDefineVerb(INPUT_VERB.JUMP,	"jump",		["W", vk_up, vk_space],	[gp_face1]);
	
	enum INPUT_CLUSTER {
        NAV,
    }
    InputDefineCluster(INPUT_CLUSTER.NAV, INPUT_VERB.UP, INPUT_VERB.RIGHT, INPUT_VERB.DOWN, INPUT_VERB.LEFT);
}
