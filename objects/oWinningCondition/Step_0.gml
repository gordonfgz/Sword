/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 0B0EABE0
/// @DnDArgument : "var" "oSkeleton"
/// @DnDArgument : "op" "3"
if(oSkeleton <= 0)
{
	/// @DnDAction : YoYo Games.Rooms.Go_To_Room
	/// @DnDVersion : 1
	/// @DnDHash : 41C7A406
	/// @DnDParent : 0B0EABE0
	room_goto(noone);
}