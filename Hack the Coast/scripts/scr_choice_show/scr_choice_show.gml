function scr_choice_show(_options, _x, _y) {
    var c = instance_create_layer(_x, _y, "UI", oChoiceBox);
    c.options = _options;
    return c;
}
