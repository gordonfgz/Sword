/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (EXIST_TIME <= 0) {
	instance_destroy();
} else {
	EXIST_TIME--;
}
