/// @desc Draw Health

var _playerHealth = global.playerHealth;
var _playerHealthMax = global.playerHealthMax;
var _playerHealthFrac = frac(_playerHealth);
_playerHealth -= _playerHealthFrac;
draw_text(1200, 20, "ESC to pause")

for (var i = 1; i <= _playerHealthMax; i++) {
	var _imageIndex = (i > _playerHealth);
	if (i == _playerHealth + 1) {
		_imageIndex += (_playerHealthFrac > 0);
		_imageIndex += (_playerHealthFrac > 0.25);
		_imageIndex += (_playerHealthFrac > 0.5);
	}
	// sets the spacing between the hearts, normally same size as the hearts themselves
	var _spacing = 32;
	draw_sprite(sHeart, _imageIndex, 8 + (i-1)*_spacing, 8);
}

// Pause Screen
if (global.gamePaused) {
	draw_set_color(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(0, 0, RESOLUTION_W*2, RESOLUTION_H*2, false);
	draw_set_alpha(1.0);
	draw_set_color(c_white);
	draw_set_font(fText);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_text(RESOLUTION_W, RESOLUTION_H*0.75, "...Game Paused...");
	draw_text(RESOLUTION_W, RESOLUTION_H*0.85, "WASD/Arrows to Move, J/C to Attack, Enter to select");
	for (var i = 0; i < array_length(pauseOption); i++) {
		var _print = "";
		if (i == pauseOptionSelected) {
			_print += "> " + pauseOption[i] + " <";
		} else {
			_print += pauseOption[i];
			draw_set_alpha(0.7);
		}
		draw_text(RESOLUTION_W, RESOLUTION_H+18+(i*48), _print);
		draw_set_alpha(1.0);
	}
}