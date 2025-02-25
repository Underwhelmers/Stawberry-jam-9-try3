function scr_process_command(input) {
	var command = scr_command_parser(input);
	
	switch(command.action) {
		case "look": action_look(command); break;
		/*
		case "move to": player_move_to(input); break;
		case "look at": player_look_at(input); break;
		case "talk to": player_talk_to(input); break;
		case "flirt with": player_flirt_with(input); break;
		case "whisper to": player_whisper_to(input); break;
		case "touch": player_touch(input); break;
		case "kiss": player_kiss(input); break;
		case "caress": player_caress(input); break;
		case "hold": player_hold(input); break;
		case "undress": player_undress(input); break;
		case "undress self": player_undress(input); break;
		case "lift": player_lift(input); break;
		case "expose": player_expose(input); break;
		case "tease": player_tease(input); break;
		case "rub": player_rub(input); break;
		case "squeeze": player_squeeze(input); break;
		case "lick": player_lick(input); break;
		case "finger": player_finger(input); break;
		case "stroke": player_stroke(input); break;
		case "suck": player_suck(input); break;
		case "grind against": player_grind_against(input); break;
		case "insert into": player_insert_into(input); break;
		case "thrust into": player_thrust_into(input); break;
		case "pull out of": player_pull_out_of(input); break;
		case "switch to": player_switch_to(input); break;
		case "suck": player_suck(input); break;
		case "lick": player_lick(input); break;
		case "lick clean": player_lick_clean(input); break;
		case "deep throat": player_deep_throat(input); break;
		case "gag on": player_gag_on(input); break;
		case "cuddle": player_cuddle(input); break;
		case "rest with": player_rest_with(input); break;
		case "clean": player_clean(input); break;
		case "dress": player_dress(input); break;
		case "climax": player_climax(input); break;
		case "edge": player_climax(input); break;
		case "aim at": player_aim_at(input); break;
		case "restrain": player_restrain(input); break;
		case "release": player_release(input); break;
		case "spank": player_spank(input); break;
		case "ride": player_ride(input); break;
		case "check": player_check(input); break;
		case "free": player_free(input); break;
		case "free": player_free(input); break;*/
		default: scr_inform(command.toString()); break;
	}
}