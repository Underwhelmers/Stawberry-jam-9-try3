function string_capitalize(_string) {
	if (string_length(_string) == 0)
		return "";
	
    var _out = string_upper(string_char_at(_string, 1));
    _out += string_copy(_string, 2, string_length(_string) - 1);
    return _out;
}