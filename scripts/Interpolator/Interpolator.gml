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
	
	Interpolator.normal = new Interpolator(function(_val) {
        var u = max(_val, 0.0000000001); // Avoid log(0)
        var z = sqrt(-2 * ln(u)) * cos(2 * pi * _val); // Standard normal transform
        return clamp((z + 3) / 6, 0, 1); // Normalize from approx [-3,3] to [0,1]
    });
}
