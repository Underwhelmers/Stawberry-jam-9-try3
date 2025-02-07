function Randomizer(_min, _max, _interpolator = Interpolator.linear) constructor {
	minval = _min;
	gap = _max-_min;
	interpolator = _interpolator;
	
	static next = function() {
		return minval + gap * interpolator.test();
	}
	static inext = function() {
		return minval + floor(gap * frac(interpolator.test()));
	}
}
