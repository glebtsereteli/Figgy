// Set alarm to destroy instance one frame later
alarm[0] = 1;

// Create layer for defeat animation sequence
var seq_layer = layer_create(depth);

// Create the defeat animation sequence
layer_sequence_create(seq_layer, x, y, seq_baddie_defeat);