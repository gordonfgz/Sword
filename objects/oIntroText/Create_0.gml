/// @description Insert description here
// You can write your code in this editor
x1 = RESOLUTION_W;
y1 = (RESOLUTION_H-70)*1.75;
x2 = RESOLUTION_W;
y2 = RESOLUTION_H*1.75;

x1Target = RESOLUTION_W*0.1;
x2Target = RESOLUTION_W*1.9;

lerpProgress = 0;
textProgress = 0;

message_index = 0;
message_array = 
["Use 'WASD' or Arrow keys to move, and 'J' or 'C' to attack.",
"Move to the stairs to progress",
"Press 'R' to restart the stage if you ever get stuck"
];
background = 0;