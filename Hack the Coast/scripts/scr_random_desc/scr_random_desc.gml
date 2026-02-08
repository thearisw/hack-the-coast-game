function scr_random_desc(age,sex,disabilities) {
    var _desc = {};

    var _stories = [
        "Lost everything in the flood.",
        "Separated from family during the surge.",
        "Abusive parents",
        "Doesn't want to talk about it...",
        "Hasn't slept in three days.",
        "Was traveling when the crisis hit."
    ];
	if(sex==1) sex_string ="Male"
	else sex_string = "Female"
    _desc = _stories[irandom(array_length(_stories) - 1)] +"\n" +
	"Age: " + string(age)
	+"\n Sex:" + sex_string
	+"\n Disabilities: " + disabilities;

    
    return _desc;
}