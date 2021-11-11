draw_sprite(sHealthbarBackground, 0, healthbar_x, healthbar_y);
draw_sprite_stretched(sHealthbar, 0, healthbar_x, healthbar_y, (enemyHP/enemyMaxHP) * 196, healthbar_height);
draw_sprite(sHealthbarBorder, 0, healthbar_x, healthbar_y);
