/// obj_clock : Step

// delta_time is microseconds since last frame
dt = delta_time / 1000000;

// clamp to avoid huge jumps on lag / window drag
dt = min(dt, 0.05);

time_s += dt;
