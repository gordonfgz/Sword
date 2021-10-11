/// @description Entity Loop
if (!global.gamePaused)
{
	// original
	depth = -bbox_bottom;
	
	//added for lift
	if ((lifted) && instance_exists(oPlayer)) {
		if (oPlayer.sprite_index != sPlayerLift) {
			x = oPlayer.x;
			y = oPlayer.y - 20;
			z = 2 * oPlayer.z + 13; 
			depth = oPlayer.depth-1;
		}
	}
}

// for shader
flash = max(flash - 0.04, 0);