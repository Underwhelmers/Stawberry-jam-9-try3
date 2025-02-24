function scr_setup_chat_texts() {
    global.chat_texts = ds_map_create();
    
    // Greet
    ds_map_add(global.chat_texts, "greet_player", "Hello!");
    ds_map_add(global.chat_texts, "greet_positive", "Hi!");
    
    // Start Conversation With
    ds_map_add(global.chat_texts, "start_conversation_with_player", "Hello!");
    ds_map_add(global.chat_texts, "start_conversation_with_positive", "Hi!");
    
    // Ask Name To
    ds_map_add(global.chat_texts, "ask_name_to_response", "My name? It's {0}.");
    
    // Ask About Trait To
    ds_map_add(global.chat_texts, "ask_about_trait_to_response", "I am '{0}'.");
    
    // Flirt With
    ds_map_add(global.chat_texts, "flirt_with_positive", "Yes?... what else?");
    ds_map_add(global.chat_texts, "flirt_with_negative", "Stay back please.");
    
    // Give Gift To
    ds_map_add(global.chat_texts, "give_gift_to_positive", "Thanks <3");
    ds_map_add(global.chat_texts, "give_gift_to_neutral", "Thanks? ._.");
    
    // Tell Personal Story To
    ds_map_add(global.chat_texts, "tell_personal_story_to_response", "Ohh, really? :O");
    
    // Chit Chat With (Tell Lots of Nothing To)
    ds_map_add(global.chat_texts, "tell_lots_of_nothing_to_response", "Mhm, mhm.");
    
    // Tell Sweet Nothings To
    ds_map_add(global.chat_texts, "tell_sweet_nothings_to_response", "Aww <3");
    
    // Ask To Sit Together With
    ds_map_add(global.chat_texts, "ask_to_sit_together_with_positive", "Come here :D.");
    ds_map_add(global.chat_texts, "ask_to_sit_together_with_negative", "Nope...");
    
    // Make Dirty Proposal To
    ds_map_add(global.chat_texts, "make_dirty_proposal_to_positive", "When?");
    ds_map_add(global.chat_texts, "make_dirty_proposal_to_negative", "Nope...");
    
    // Start Touching
    ds_map_add(global.chat_texts, "start_touching_positive", "Mmm <3");
    ds_map_add(global.chat_texts, "start_touching_negative", "Not yet ;D");
    
    // Give Kiss To
    ds_map_add(global.chat_texts, "give_kiss_to_positive", "Your lips feel amazing...");
    ds_map_add(global.chat_texts, "give_kiss_to_neutral", "Mmm, nice.");
    
    // Remove Clothes From
    ds_map_add(global.chat_texts, "remove_clothes_from_positive", "Alright, let's get comfortable.");
    ds_map_add(global.chat_texts, "remove_clothes_from_negative", "I'm not ready for that!");
    
    // Give Caress To
    ds_map_add(global.chat_texts, "give_caress_to_positive", "That feels so good...");
    ds_map_add(global.chat_texts, "give_caress_to_negative", "Hey, slow down a bit.");
    
    // Thrust
    ds_map_add(global.chat_texts, "thrust_positive_high", "I can't hold back anymore!");
    ds_map_add(global.chat_texts, "thrust_positive_low", "Oh yes, keep going!");
    ds_map_add(global.chat_texts, "thrust_negative", "Not so fast!");
    
    // Cuddle With
    ds_map_add(global.chat_texts, "cuddle_with_response", "That was... wow. Hold me.");
    
    // Tease
    ds_map_add(global.chat_texts, "tease_positive", "Oh, you're bad!");
    ds_map_add(global.chat_texts, "tease_negative", "That's not funny.");
    
    // Give Compliment To
    ds_map_add(global.chat_texts, "give_compliment_to_response", "Thanks, that's sweet.");
    
    // Whisper To
    ds_map_add(global.chat_texts, "whisper_to_positive", "That gave me chills...");
    ds_map_add(global.chat_texts, "whisper_to_negative", "What did you say?");
    
    // Hold Hands With
    ds_map_add(global.chat_texts, "hold_hands_with_positive", "I like this.");
    ds_map_add(global.chat_texts, "hold_hands_with_negative", "Not yet, okay?");
    
    // Give Massage To
    ds_map_add(global.chat_texts, "give_massage_to_positive", "Oh, that's perfect...");
    ds_map_add(global.chat_texts, "give_massage_to_negative", "Um, maybe later.");
    
    // Pull Closer
    ds_map_add(global.chat_texts, "pull_closer_positive", "Yes, don't let go!");
    ds_map_add(global.chat_texts, "pull_closer_negative", "Too close!");
    
    // Slow Down Banging
    ds_map_add(global.chat_texts, "slow_down_banging_positive", "Mmm, I like it gentle.");
    ds_map_add(global.chat_texts, "slow_down_banging_neutral", "Just... keep going.");
    
    // Finish Together With
    ds_map_add(global.chat_texts, "finish_together_with_positive", "Now together!");
    ds_map_add(global.chat_texts, "finish_together_with_negative", "I'm not there yet!");
	
	
    ds_map_add(global.chat_texts, "thrust_positive_high", "I can't hold back anymore!");
    ds_map_add(global.chat_texts, "thrust_positive_low", "Keep going!");
    ds_map_add(global.chat_texts, "thrust_negative", "Not so fast.");
    
    ds_map_add(global.chat_texts, "push_into_front_positive", "Oh, yes-there!");
    ds_map_add(global.chat_texts, "push_into_rear_positive", "Oh, that's tight!");
    ds_map_add(global.chat_texts, "push_into_negative", "Not yet.");
    ds_map_add(global.chat_texts, "push_into_choose_cavity_first", "Where?");
    
    ds_map_add(global.chat_texts, "push_out_of_positive", "Keep playing!");
    ds_map_add(global.chat_texts, "push_out_of_negative", "No, stay in!");
    
    ds_map_add(global.chat_texts, "pull_out_positive", "Oh, good timing!");
    ds_map_add(global.chat_texts, "pull_out_negative", "No, not yet!");
    
    ds_map_add(global.chat_texts, "finish_together_inside_front", "Yes, fill me now!");
    ds_map_add(global.chat_texts, "finish_together_inside_rear", "Now-deep inside!");
    ds_map_add(global.chat_texts, "finish_together_outside", "Oh, yes-together!");
    ds_map_add(global.chat_texts, "finish_together_negative", "I'm not there yet.");
	
    ds_map_add(global.chat_texts, "ask_to_move_somewhere_more_private_to_positive", "Mmm, privacy sounds perfect!");
    ds_map_add(global.chat_texts, "ask_to_move_somewhere_more_private_to_negative", "Not yet, I'm fine here.");
	
	ds_map_add(global.chat_texts, "align_to_front_response", "Alright, front it is.");
    ds_map_add(global.chat_texts, "align_to_rear_response", "Rear's all yours.");
	
    ds_map_add(global.chat_texts, "start_banging_with_positive", "Ready for this?");
    ds_map_add(global.chat_texts, "start_banging_with_negative", "Let's get warmed up first.");
}