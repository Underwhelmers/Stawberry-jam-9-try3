function NpcInteractionSystems() constructor {
	
}

function ecs_setup_system_player_npc_interaction(_verb, _reqs, _effect) {
	var inst = ecs_setup_system_player_action(_verb, _reqs,
		function(entity, args) {
			var resp = scr_apply_traits(entity, "on_interaction", { behaviour_is_overriten: false });
            resp = scr_apply_traits(entity, args.system_event, resp);
            if (resp.behaviour_is_overriten) return;
			
			args.ecs_setup_system_player_npc_interaction(entity, args);
		}
	);
	inst.execute_args.ecs_setup_system_player_npc_interaction = _effect;
	return inst;
}


function scr_setup_player_actions_with_npcs() {	
	NpcInteractionSystems_setup_001_Greet();
    NpcInteractionSystems_setup_002_StartConversationWith();
	NpcInteractionSystems_setup_003_AskNameTo();
    NpcInteractionSystems_setup_004_AskAboutTraitTo();
	NpcInteractionSystems_setup_005_FlirtWith();
    NpcInteractionSystems_setup_006_GiveGiftTo();
    NpcInteractionSystems_setup_007_TellPersonalStoryTo();
    NpcInteractionSystems_setup_008_ChitChatWith();
	NpcInteractionSystems_setup_009_TellSweetNothingsTo();
    NpcInteractionSystems_setup_010_AskToSitTogetherWith();
    NpcInteractionSystems_setup_011_MakeDirtyProposalTo();
    NpcInteractionSystems_setup_012_StartTouching();
    NpcInteractionSystems_setup_013_GiveKissTo();
    NpcInteractionSystems_setup_014_RemoveClothesFrom();
    NpcInteractionSystems_setup_015_Caress();
    NpcInteractionSystems_setup_016_Thrust();
    NpcInteractionSystems_setup_017_Cuddle();
    NpcInteractionSystems_setup_018_TeaseFisically();
	NpcInteractionSystems_setup_019_Compliment();
	NpcInteractionSystems_setup_020_Whisper();
	NpcInteractionSystems_setup_021_HoldHands();
	NpcInteractionSystems_setup_022_Massage();
	NpcInteractionSystems_setup_023_PullCloser();
    NpcInteractionSystems_setup_024_SlowDown();
    NpcInteractionSystems_setup_025_FinishTogether();
	
	
    NpcInteractionSystems_setup_026_PushInto();
    NpcInteractionSystems_setup_027_PushOutOf();
    NpcInteractionSystems_setup_028_PullOut();
	
    NpcInteractionSystems_setup_029_AlignToFront();
    NpcInteractionSystems_setup_030_AlignToRear();
    NpcInteractionSystems_setup_031_StartBangingWith();
    NpcInteractionSystems_setup_032_AskToMoveSomewherePrivateTo();
    NpcInteractionSystems_setup_033_TeaseWithWords();
    NpcInteractionSystems_setup_034_UndressSlowly();
}