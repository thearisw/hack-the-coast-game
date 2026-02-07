key_left = keyboard_check(vk_left) ||  keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) ||  keyboard_check(ord("D"));
hs = key_left - key_right;
x+=hs*10;