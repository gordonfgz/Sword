event_inherited();



// regulate attack speed
if (timer >= 0) {
	timer--;
} 
if (timer <= 0) {
	canAttack = true;
}

// Below 70% hp increase difficulty
if (enemyHP < enemyMaxHP * 0.7 ) {
	if (PassiveCooldown != 0) {
		PassiveCooldown--;
	} else {
		PassiveCooldown = PassiveTimer;
		SlithersPassive();
	}
}

