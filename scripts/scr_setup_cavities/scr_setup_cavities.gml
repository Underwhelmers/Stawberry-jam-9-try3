function scr_setup_cavities() {
    Cavity.generate_vagina = function(_body_size) {
        var _uterus = new Cavity("uterus", false);
        var _cervix = new Cavity("cervix", false);
        var _vagina = new Cavity("vagina", true);

        new CavityChain([_vagina, _cervix, _uterus]);

        // Override dimensions with type-specific values in cm
        _vagina.max_width = 3 * _body_size * random_range(0.9, 1.1); // cm
        _vagina.max_depth = 10 * _body_size * random_range(0.9, 1.1); // cm
        _vagina.capacity = pi * _vagina.max_width*_vagina.max_width * 0.25 * _vagina.max_depth;

        _cervix.max_width = 1.5 * _body_size * random_range(0.9, 1.1); // cm
        _cervix.max_depth = 3 * _body_size * random_range(0.9, 1.1); // cm
        _cervix.capacity = pi * _cervix.max_width*_cervix.max_width * 0.25 * _cervix.max_depth;

        _uterus.max_width = 8 * _body_size * random_range(0.9, 1.1); // cm
        _uterus.max_depth = 5 * _body_size * random_range(0.9, 1.1); // cm
        _uterus.capacity = pi * _uterus.max_width*_uterus.max_width * 0.25 * _uterus.max_depth;

        return _vagina;
    };

    Cavity.generate_digestive_track = function(_body_size) {
        var _anus = new Cavity("anus", true);
        var _rectum = new Cavity("rectum", false);
        var _guts = new Cavity("guts", false);
        var _stomach = new Cavity("stomach", false);
        var _throat = new Cavity("throat", false);
        var _mouth = new Cavity("mouth", true);

        new CavityChain([_anus, _rectum, _guts, _stomach, _throat, _mouth]);
		var _rnd = new Randomizer(0.9 * _body_size,1.1 * _body_size,Interpolator.normal)

        // Override dimensions with type-specific values in cm
        _anus.max_width = 3.5 * _body_size * random_range(0.9, 1.1); // cm
        _anus.max_depth = 7 * _body_size * random_range(0.9, 1.1); // cm
        _anus.capacity = pi * _anus.max_width*_anus.max_width * 0.25 * _anus.max_depth;

        _rectum.max_width = 3 * _body_size * random_range(0.9, 1.1); // cm
        _rectum.max_depth = 10 * _body_size * random_range(0.9, 1.1); // cm
        _rectum.capacity = pi * _rectum.max_width*_rectum.max_width * 0.25 * _rectum.max_depth;

        _guts.max_width = 4 * _body_size * random_range(0.9, 1.1); // cm
        _guts.max_depth = 40 * _body_size * random_range(0.9, 1.1); // cm
        _guts.capacity = pi * _guts.max_width*_guts.max_width * 0.25 * _guts.max_depth;

        _stomach.max_width = 12 * _body_size * random_range(0.9, 1.1); // cm
        _stomach.max_depth = 15 * _body_size * random_range(0.9, 1.1); // cm
        _stomach.capacity = pi * _stomach.max_width*_stomach.max_width * 0.25 * _stomach.max_depth;

        _throat.max_width = 2.5 * _body_size * random_range(0.9, 1.1); // cm
        _throat.max_depth = 15 * _body_size * random_range(0.9, 1.1); // cm
        _throat.capacity = pi * _throat.max_width*_throat.max_width * 0.25 * _throat.max_depth;

        _mouth.max_width = 5 * _body_size * random_range(0.9, 1.1); // cm
        _mouth.max_depth = 8 * _body_size * random_range(0.9, 1.1); // cm
        _mouth.capacity = pi * _mouth.max_width*_mouth.max_width * 0.25 * _mouth.max_depth;

        return {
			anus: _anus,
			mouth: _mouth
		}
    };
}