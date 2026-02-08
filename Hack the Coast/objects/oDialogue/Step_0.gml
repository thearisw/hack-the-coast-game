var dt = delta_time / 1000000;

// Typewriter effect
if (char_index < string_length(text)) {
    timer += dt;
    if (timer >= type_speed) {
        timer = 0;
        char_index++;
    }
} else {
    life_timer += dt;
    if (life_timer >= life_after) {
        instance_destroy();
    }
}
