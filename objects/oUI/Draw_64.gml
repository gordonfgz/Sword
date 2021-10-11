/// @desc Draw Health

var _playerHealth = global.playerHealth;
var _playerHealthMax = global.playerHealthMax;
var _playerHealthFrac = frac(_playerHealth);
_playerHealth -= _playerHealthFrac;

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