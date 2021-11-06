/// @description Insert description here
// You can write your code in this editor
if room == rDungeonIntro or room == rDungeon1Intro or room == rDungeon2Intro{
instance_deactivate_object(oUI)
}
if room == rDungeon or room == rDungeon1 or room == rDungeon2{
instance_activate_object(oUI)
}