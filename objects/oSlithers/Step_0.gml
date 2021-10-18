event_inherited();


if (AttackCooldown != 0) {
	AttackCooldown--;
}

if (PassiveCooldown != 0) {
	PassiveCooldown--;
} else {
	PassiveCooldown = PassiveTimer;
	SlithersPassive();
}
