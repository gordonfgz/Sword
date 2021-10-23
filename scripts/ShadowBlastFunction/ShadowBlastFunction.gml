function ShadowBlastAttack(){
	//Use attack hitbox and check for hits
	ds_list_clear(hitByAttack);
	show_debug_message("TRYING TO DETECT HTIS");
	mask_index = sShadowBlastHB;
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x,y,oPlayer,hitByAttackNow,false);
	if (hits > 0)
	{
		show_debug_message("SOMETHING IS HIT");
		for (var i = 0; i <hits; i++)
		{
			//if this instance has not yet been hit by this attack, hit it!
			var hitID = hitByAttackNow[| i];
			if (ds_list_find_index(hitByAttack, hitID) == -1)
			{
				ds_list_add(hitByAttack, hitID);
				with (hitID)
				{	
					HurtPlayer(0,0,1);
				}
			}
		}
	}
	ds_list_destroy(hitByAttackNow);
}