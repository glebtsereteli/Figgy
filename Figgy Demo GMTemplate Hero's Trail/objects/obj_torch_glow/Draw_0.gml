// Draw the light using the "add" blend mode
gpu_set_blendmode(bm_add);

draw_self();

gpu_set_blendmode(bm_normal);