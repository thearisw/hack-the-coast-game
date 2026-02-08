if(timer == 30) scr_dialogue_show("This is the Last Call")
if(timer == 90) scr_dialogue_show("Operate the homeless shelter to the best of your ability")
if(timer == 120) scr_dialogue_show("Use resources wisely... Funding is quite limited")
if(timer == 180) scr_dialogue_show("This is the Last Call")

if(keyboard_check_pressed(vk_space)) {
	room_goto(Room1)
}
timer++;