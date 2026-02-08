dt = min(delta_time / 1000000, 0.05);

// phase timing (real seconds)
global.phase_t += dt;

// phase lengths (real seconds)
var intake_len = 45;
var day_len    = 30;
var night_len  = 15;

// minutes/sec rates (in-game time scaling)
var rate_intake = 120 / intake_len; // 11:00->13:00
var rate_day    = 420 / day_len;    // 13:00->20:00
var rate_night  = 900 / night_len;  // 20:00->11:00

var rate = rate_intake;

if (global.phase == global.P_DAY)   rate = rate_day;
if (global.phase == global.P_NIGHT) rate = rate_night;

// advance in-game time
global.game_min += dt * rate;
global.game_min = global.game_min mod 1440;

// phase transitions
if (global.phase == global.P_INTAKE && global.phase_t >= intake_len) {
    global.phase = global.P_DAY; global.phase_t = 0;
}
else if (global.phase == global.P_DAY && global.phase_t >= day_len) {
    global.phase = global.P_NIGHT; global.phase_t = 0;
}
else if (global.phase == global.P_NIGHT && global.phase_t >= night_len) {
    global.phase = global.P_INTAKE; global.phase_t = 0;
}
