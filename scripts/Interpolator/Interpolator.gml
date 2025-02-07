function Interpolator(_func) constructor {
	callback = _func;
	
	static test = function() {
		return callback(random(1));
	}
}
function scr_setup_interpolators() {
	Interpolator.linear = new Interpolator(function(_val) { return _val; });
	Interpolator.inv_linear = new Interpolator(function(_val) { return 1-_val; });
	
	Interpolator.squared = new Interpolator(function(_val) { return _val*_val; });
	Interpolator.inv_squared = new Interpolator(function(_val) { return 1-_val*_val; });
	
	Interpolator.cubed = new Interpolator(function(_val) { return _val*_val*_val; });
	Interpolator.inv_cubed = new Interpolator(function(_val) { return 1-_val*_val*_val; });
	
	Interpolator.flip_squared = new Interpolator(function(_val) { return 2*_val-_val*_val; });
	Interpolator.inv_flip_squared = new Interpolator(function(_val) { return 1-2*_val+_val*_val; });
	
	Interpolator.flip_cubed = new Interpolator(function(_val) { var _inv = (1-_val); return 1-_inv*_inv*_inv; });
	Interpolator.inv_flip_cubed = new Interpolator(function(_val) { var _inv = (1-_val); return _inv*_inv*_inv; });
	
	// k = 10 Steepness factor; adjust as needed
    Interpolator.normal = new Interpolator(function(_val) {
		var k = 10;
        return 1 / (1 + exp(-k * (_val - 0.5)));
    });
    
    Interpolator.inv_normal = new Interpolator(function(_val) {
		var k = 10;
        return 1 - 1 / (1 + exp(-k * (_val - 0.5)));
    });
}
