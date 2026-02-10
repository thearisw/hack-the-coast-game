function create_menu(_context) {
    if (instance_exists(oChoiceBox)) return;

    var _opts = [];

    if (_context == "bed_menu") {
        _opts[0] = "Strict (Cap 10)";
        _opts[1] = "Overcrowd (Unlim)";
        scr_choice_show(_opts, noone, "bed_menu");
    }
    else if (_context == "food_menu") {
        _opts[0] = "Normal Rations";
        _opts[1] = "Half Rations";
        scr_choice_show(_opts, noone, "food_menu");
    }
    else if (_context == "staff_menu") {
        _opts[0] = "Balanced Shifts";
        _opts[1] = "Overwork (Double)";
        scr_choice_show(_opts, noone, "staff_menu");
    }
}