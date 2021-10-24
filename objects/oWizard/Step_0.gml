event_inherited();

// regulate attack speed
if (timer != 0) {
	timer--;
} 
if (timer <= 0) {
	canAttack = true;
}


