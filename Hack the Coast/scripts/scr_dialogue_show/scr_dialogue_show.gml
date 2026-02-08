function scr_dialogue_show(_text) {
    // We don't need to calculate x/y here anymore because 
    // the object determines its own position on the GUI layer!
    
    var d = instance_create_layer(0, 0, "UI", oDialogue);
    d.text = _text;
    
    return d;
}
function scr_dialogue_show_spec(_text,x,y) {
    // We don't need to calculate x/y here anymore because 
    // the object determines its own position on the GUI layer!
    
    var d = instance_create_layer(x, y, "UI", oDialogueSpec);
    d.text = _text;
    
    return d;
}