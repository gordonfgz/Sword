/// @description Room UI Management
if room == rDungeonIntro or room == rDungeon1Intro or room == rDungeon2Intro {
	object_set_visible(oUI,false)}
else if room == rDungeon or room == rDungeon1 or room == rDungeon2{
	object_set_visible(oUI,true)}
	
