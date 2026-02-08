function scr_dialogue_show(_text) {
    var d = instance_create_layer(room_width/2, room_height-20, "UI", oDialogue);
    d.text = _text;
}
