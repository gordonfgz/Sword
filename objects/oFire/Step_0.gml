/// @description Insert description here
// You can write your code in this editor
if (TIME_TILL_EXTINGUISH <= 0) {
	instance_destroy();
} else {
	TIME_TILL_EXTINGUISH--;
}