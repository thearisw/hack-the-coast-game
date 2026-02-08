function scr_choice_show(_options, _x, _y) {
	c=false;
    with(instance_create_layer(_x, _y, "UI", oChoiceBox)) {
		options = _options;
		other.c = selected;
	}
    return c;
}
