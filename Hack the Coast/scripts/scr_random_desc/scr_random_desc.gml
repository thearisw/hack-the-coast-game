function scr_random_desc() {
    var _desc = {};

    // 1. Random Age
    _desc.age = irandom_range(18, 75);

    // 2. Random Sex
    var _sexes = ["Male", "Female"];
    _desc.sex = _sexes[irandom(array_length(_sexes) - 1)];

    // 3. Random Short Backstory
    var _stories = [
        "Lost everything in the flood.",
        "Separated from family during the surge.",
        "Former teacher looking for work.",
        "Escaped a collapsing high-rise.",
        "Doesn't want to talk about it...",
        "Hasn't slept in three days.",
        "Was traveling when the crisis hit."
    ];
    _desc.backstory = _stories[irandom(array_length(_stories) - 1)];

    // 4. Chance of Disability (e.g., 15% chance)
    _desc.has_disability = (random(100) < 15);
    
    if (_desc.has_disability) {
        var _disabilities = ["Limited Mobility", "Visually Impaired", "Hard of Hearing"];
        _desc.disability_type = _disabilities[irandom(array_length(_disabilities) - 1)];
    } else {
        _desc.disability_type = "None";
    }

    return _desc;
}