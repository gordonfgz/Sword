/// @description Insert description here
// You can write your code in this editor

var _sequence = seqCreds;
var _layername = "Instances";

var _seqElm = layer_sequence_create(_layername, 0, 0, _sequence);

if (layer_sequence_is_finished(_seqElm) != 0) {
	layer_sequence_destroy(_seqElm);
	draw_text(640,670,"Press backspace to return to main menu")
	game_restart();
}

