/// @description Shaders activation

if (flash != 0) {
	shader_set(shRedFlash);
	shader_set_uniform_f(uFlash, flash);
}

draw_sprite_ext(
	sprite_index,
	image_index,
	floor(x),
	floor(y),
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
)





if (shader_current() != -1) {
	shader_reset();
}
