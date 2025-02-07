function TentEncPrecond(_nested , _params, _callback) constructor {
	own_params = _params;
	callback = _callback;
	nested = _nested;
	
	// this is not thread safe.
	_check_fulfilled_by = false;
	static fulfilled_by = function(_encounter) {
		if (_check_fulfilled_by)
			return false;
			
		_check_fulfilled_by = true;
		for (var i = 0; i < array_length(nested); i++) {
			if (! nested[i].fulfilled_by(_encounter)) {
				_check_fulfilled_by = false;
				return false;
			}
		}
		
		_check_fulfilled_by = false;
		return callback(own_params, _encounter);
	}
}


function scr_setup_tent_enc_preconds() {
	TentEncPrecond._ATTRIBUTE_HAS_ALL = function(_ATTRIBUTE,_tags) {
		return new TentEncPrecond([],
			{ ATTRIBUTE: _ATTRIBUTE, tags: _tags },
			function(_params, _enc) {
				var _enctags = _enc[$ _params.ATTRIBUTE].tags;
				for (var i = 0; i < array_length(_params.tags); i++) {
					if(! _enctags.is_valid(_params.tags[i]))
						return false;
				}
				return true;
			}
		);
	};
	TentEncPrecond._ATTRIBUTE_HAS_ANY = function(_ATTRIBUTE,_tags) {
		return new TentEncPrecond([],
			{ ATTRIBUTE: _ATTRIBUTE, tags: _tags },
			function(_params, _enc) {
				var _enctags = _enc[$ _params.ATTRIBUTE].tags;
				for (var i = 0; i < array_length(_params.tags); i++) {
					if(_enctags.is_valid(_params.tags[i]))
						return true;
				}
				return false;
			}
		);
	};
	TentEncPrecond._ATTRIBUTE_HAS = function(_ATTRIBUTE, _tag) {
		return new TentEncPrecond([],
			{ ATTRIBUTE: _ATTRIBUTE, tag: _tag },
			function(_params, _enc) {
				return _enc[$ _params.ATTRIBUTE].tags.is_valid(_params.tag);
			}
		);
	};
	TentEncPrecond._ATTRIBUTE_USING = function(_ATTRIBUTE, _tag) {
		return new TentEncPrecond([],
			{ ATTRIBUTE: "used_tags_for_"+_ATTRIBUTE, tag: _tag },
			function(_params, _enc) {
				return _enc[$ _params.ATTRIBUTE].is_valid(_params.tag);
			}
		)
	}
	TentEncPrecond._ATTRIBUTE_UNUSED = function(_ATTRIBUTE, _tag) {
		return new TentEncPrecond([TentEncPrecond._ATTRIBUTE_HAS(_ATTRIBUTE,_tag)],
			{ ATTRIBUTE: "used_tags_for_"+_ATTRIBUTE, tag: _tag },
			function(_params, _enc) {
				return !_enc[$ _params.ATTRIBUTE].is_valid(_params.tag);
			}
		)
	}
	
	TentEncPrecond.PLAYER_HAS     = function(_tag ) { return TentEncPrecond._ATTRIBUTE_HAS    ("player", _tag ); }
	TentEncPrecond.PLAYER_HAS_ALL = function(_tags) { return TentEncPrecond._ATTRIBUTE_HAS_ALL("player", _tags); }
	TentEncPrecond.PLAYER_HAS_ANY = function(_tags) { return TentEncPrecond._ATTRIBUTE_HAS_ANY("player", _tags); }
	TentEncPrecond.PLAYER_UNUSED  = function(_tag ) { return TentEncPrecond._ATTRIBUTE_UNUSED ("player", _tag ); }
	TentEncPrecond.PLAYER_USING   = function(_tag ) { return TentEncPrecond._ATTRIBUTE_USING  ("player", _tag ); }
	
	TentEncPrecond.PARTNER_HAS     = function(_tag ) { return TentEncPrecond._ATTRIBUTE_HAS    ("partner", _tag ); }
	TentEncPrecond.PARTNER_HAS_ALL = function(_tags) { return TentEncPrecond._ATTRIBUTE_HAS_ALL("partner", _tags); }
	TentEncPrecond.PARTNER_HAS_ANY = function(_tags) { return TentEncPrecond._ATTRIBUTE_HAS_ANY("partner", _tags); }
	TentEncPrecond.PARTNER_UNUSED  = function(_tag ) { return TentEncPrecond._ATTRIBUTE_UNUSED ("partner", _tag ); }
	TentEncPrecond.PARTNER_USING   = function(_tag ) { return TentEncPrecond._ATTRIBUTE_USING  ("partner", _tag ); }
	
	TentEncPrecond.PLAYER_HAS_TARGET_FOR = function(_tag) {
		return new TentEncPrecond([TentEncPrecond.PLAYER_HAS(_tag)],
			{ tag: _tag },
			function(_params, _enc) {
				return _enc.player_target_for.is_valid(_params.tag);
			}
		)
	}
	
	TentEncPrecond.PLAYER_TARGET_FOR_IS = function(_tag, _targ) {
		return new TentEncPrecond([
				TentEncPrecond.PLAYER_HAS_TARGET_FOR(_tag),
				TentEncPrecond.PARTNER_HAS(_targ),
			],
			{ tag: _tag, targ: _targ },
			function(_params, _enc) {
				return _enc.player_target_for.get(_params.tag).is_valid(_params.targ);
			}
		)
	}
}
