function scr_dialogue_show(_text, _x, _y) {
    var d = instance_create_layer(_x, _y, "UI", oDialogue);
    d.text = _text;
}
