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
["You open your eyes, getting slowly to your feet and freezing as you spot a floating sword in front of you.\nIt seems irritated, though you don't know how you can tell.",
"Sword: 'Well it's about time you got up; I was starting to think you were dead!'\nYou: '...This has to be the weirdest hallucination I've ever had.'\nSword: 'I AM NOT A HALLUCINATION.'",
"You glance around the room.",
"You: 'I must be high; a talking sword smh...dam if it don't look real though.'\nThe floating sword jabs you with its hilt.",
"You: 'Ow!'\nSword: 'I still look like a hallucination to you huh?!'\nYou: 'How much did I drink?'",
"Sword: 'LISTEN TO ME.'\nYou: 'OKAY.'\nSword: 'Do you have any idea how long I've been waiting for you to wake up?!'",
"You: '...Probably not? I mean I wasn't awake...'\nThe sword waves its tip threateningly in your face, and you raise your hands defensively.",
"You: 'I mean *cough* must have been a long time.'\nSword: '...Whatever. Let me get into the gist of it. I am Excalibur; magic sword extraordinaire!\nRejoice; for you are in my presence!'",
"You: 'Excalibur? You mean like the King Arthur thingy?'\nExcalibur?: 'DO NOT COMPARE ME TO THAT FICTITIOUS WENCH!'",
"You decide it would behoove you to shut your mouth now.",
"Excalibur?: 'Anyhow, it appears you're stuck in this dungeon here. BUT my benevolent self will be guiding you out of it!\nI give you permission to allow your unrestrained awe to flow free. REJOICE!'",
"You decide you must be crazy.",
"You: 'Which state am I in? Kansas?'\nExcalibur?: 'Your current state is alive, Dorothy, but if you keep talking, YOU WILL BE DEAD!'\nYou: 'Got it.'",
"Excalibur?: 'Wonderful. Now, use 'WASD' to move your heiny over to that there staircase.'\nYou: 'What?'\nExcalibur?: 'What?'",
"You descend the staircase.",
"The skeleton across from you chatters eerily, and you flinch as the\nshrill screech of the greatsword it is dragging across the floor meets your ears.",
"You: 'What is that?!'\nExcalibur?: ''That' is Bones. He's pretty easy; the bloke is big and moves slowly, which makes everyone\nthink he swings like a batter so far past his prime his teeth are falling out of his head.'",
"Excalibur?: 'But he's deceptively fast. So don't stand in his way when he attacks.'\nYou: 'You want me to fight that thing?! Why can't you fight it?!'\nExcalibur?: 'Because, I am a SWORD. Someone needs to SWING ME.'",
"You: 'But you're clearly not an ordinary sword; you can float and talk and threaten my life!'\nExcalibur?: 'Precisely. Therefore, so help me you will use me to fight that thing or I WILL KILL YOU MYSELF.'\nYou decide that this will get you nowhere, and the only way out of this forsaken room is the staircase behind the skeleton.",
"Excalibur?: 'Now don't forget: 'WASD' to move, and press 'J' to attack. Don't die now.'\nYou: 'Dammit.'"
];
background = 0;