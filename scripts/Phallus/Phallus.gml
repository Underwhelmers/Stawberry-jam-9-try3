function Phallus(_name, _length, _width, _fluid_stored = "nothing") constructor {
    name = _name;
    length = _length;
    width = _width;
	
	fluid_stored = _fluid_stored;
    volume_stored = 0;
    
	area = width*width*pi*0.25;
    // (You can later add methods such as try_ejaculate or pull_out here if needed.)
}
