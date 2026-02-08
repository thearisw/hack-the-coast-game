var midx = room_width/2
var midy = room_height/2
if(timer == 1) scr_dialogue_show("This is the Last Call")
if(timer == 180) scr_dialogue_show("Operate the homeless shelter to");
if(timer == 360) scr_dialogue_show("the best of your ability")
if(timer == 540) scr_dialogue_show("Use resources wisely... Funding is quite limited")
if(timer == 700) scr_dialogue_show("WASD walk, space to interact, Enter to confirm")
if(timer==840) scr_dialogue_show_spec("This is the Last Call",0,0)

if(keyboard_check_pressed(vk_space)) {
	room_goto(Room1)
}
timer++;