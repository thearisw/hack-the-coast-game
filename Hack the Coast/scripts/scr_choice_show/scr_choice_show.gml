function scr_choice_show(_options, objid) {
    with(instance_create_layer(room_width/2, room_height-10, "UI", oChoiceBox)) {
		options = _options;
		parentid = objid;
	}
}
