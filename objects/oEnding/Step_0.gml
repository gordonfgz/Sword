camera_set_view_pos(view_camera[0],0,10);

if (!fadeout) a = max(a-0.005, 0.25); else a = min(a+0.005, 1);

l += 2;

print = string_copy(str,1,l);
if (l > string_length(str)+300) && next < array_length_1d(strings)-1
{
	l = 0;
	next = next + 1;
	if (next == array_length_1d(strings)-1) holdspace ++;
}

str = strings[next];

if(keyboard_check_pressed (vk_backspace))
{
	fadeout = 1;
}

if next >= 6 then fadeout = 1;

if (a ==1) && (fadeout == 1) room_goto_next();
