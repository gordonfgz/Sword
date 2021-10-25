/// @description Insert description here
// You can write your code in this editor
lerpProgress += (1 - lerpProgress) * 0.1;
textProgress += global.textSpeed;

x1 = lerp(x1, x1Target, lerpProgress);
x2 = lerp(x2, x2Target, lerpProgress);

instance_deactivate_all(1);

// if (keyboard_check_pressed(vk_space))
// {
	// var _messageLength = string_length(message_array[message_index]);
	// if (textProgress >= _messageLength and message_index == array_length(message_array)-1) 
	// {
		// instance_destroy();
	// }
	// else
	// {
		// if (textProgress > 2)
		// {
			// textProgress = _messageLength;
		// }
	// }
// }

if (keyboard_check_pressed(vk_space))
{
	var _messageLength = string_length(message_array[message_index]);
	if (textProgress >= _messageLength and message_index < array_length(message_array)-1)
	{
		textProgress = 0;
		message_index += 1;
	} 
	else if (textProgress >= _messageLength)
	{
		instance_destroy();
		instance_activate_all()
	}
}