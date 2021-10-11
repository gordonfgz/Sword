/// @description Essential Entity Setup
flash = 0;
uFlash = shader_get_uniform(shWhiteFlash, "flash");
lifted = 0;
thrown = false;
z = 0;


/// @description Boss HP
hp = 50;
hp_max = hp;

healthbar_width = 200;
healthbar_height = 12;
healthbar_x = (640/2) - (healthbar_width/2);
healthbar_y = ystart - 130;