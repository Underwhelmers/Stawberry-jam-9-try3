function TentEncEffect(_params, _callback) constructor {
	own_params = _params;
	callback = _callback;
	
	static apply_to = function(_encounter) {
		return callback(own_params, _encounter);
	}
}


function scr_setup_tent_enc_effects() {
	TentEncEffect.PLAYER_AIM_AT = function(_player_tag, _partner_tag) {
		return new TentEncEffect(
			{ player_tag: _player_tag, partner_tag: _partner_tag },
			function (_params, _enc) {
				_enc.player_target_for.set(_params.player_tag,_params.partner_tag);
			}
		)
	}
	TentEncEffect.INSERT = function(_tag) {
		return new TentEncEffect(
			{ tag: _tag },
			function (_params, _enc) {
				var _targ_tag = _enc.player_target_for.get(_params.tag);
				_enc.partner.get_aroused_with_on(_params.tag,_targ_tag);
				
				var _tool = _enc.player.tags.get(_params.tag);
				var _targ = _enc.partner.tags.get(_targ_tag);
				
				_enc.used_tags_for_player .set(_params.tag);
				_enc.used_tags_for_partner.set(_targ_tag);
				
				_targ.penetrate_using(_tool,5);
			}
		);
	}
	TentEncEffect.PULL_OUT = function(_tag) {
		return new TentEncEffect(
			{ tag: _tag },
			function (_params, _enc) {
				var _targ_tag = _enc.player_target_for.get(_params.tag);
				_enc.partner.get_aroused_with_on(_params.tag,_targ_tag);
				
				var _tool = _enc.player.tags.get(_params.tag);
				var _targ = _enc.partner.tags.get(_targ_tag);
				
				_enc.used_tags_for_player .remove(_params.tag);
				_enc.used_tags_for_partner.remove(_targ_tag);
				
				_targ.pull_out(_tool,5);
			}
		);
	}
	TentEncEffect.TEASE_WITH = function(_tag) {
		return new TentEncEffect(
			{ tag: _tag },
			function (_params, _enc) {
				var _targ_tag = _enc.player_target_for.get(_params.tag);
				_enc.partner.get_aroused_with_on(_params.tag,_targ_tag);
			}
		);
	}
	TentEncEffect.LUBRICATE_WITH = function(_tag_lubricant, _tag_target) {
		return new TentEncEffect(
			{ lubricant: _tag_lubricant, target: _tag_target },
			function (_params, _enc) {
				_enc.partner.apply_lubricant(_params.lubricant,_params.target);
			}
		);
	}
}