key_left = keyboard_check(vk_left) ||  keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) ||  keyboard_check(ord("D"));
hs = key_right - key_left;
x+=hs*10;