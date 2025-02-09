function TentEncBodyUbication(_id, _descriptor, _parents = []) constructor {
	identifier = _id;
	descriptor = _descriptor;
	parents = _parents;
	
	childs = [];
	for (var i = 0; i < array_length(parents); i++) {
		array_push(parents[i].childs,self);
	}
	
	ds_list_add(global.all_tentenc_body_ubications,self);
}


function scr_setup_tent_enc_body_ubications() {
    // Create a global list to hold all ubications.
    global.all_tentenc_body_ubications = ds_list_create();
	TentEncBodyUbication.VISIBLE = new TentEncBodyUbication("visible", "visible");
	TentEncBodyUbication.INNERS  = new TentEncBodyUbication("inners" , "inners");
	ds_list_clear(global.all_tentenc_body_ubications);
	
    // ======================================================
    // Head & Face Regions
    // ======================================================
    TentEncBodyUbication.HEAD   = new TentEncBodyUbication("head", "head"  , [TentEncBodyUbication.VISIBLE]);
    TentEncBodyUbication.FACE   = new TentEncBodyUbication("face", "face"  , [TentEncBodyUbication.HEAD]);
    TentEncBodyUbication.EYES   = new TentEncBodyUbication("eyes", "eyes"  , [TentEncBodyUbication.FACE]);
    TentEncBodyUbication.EARS   = new TentEncBodyUbication("ears", "ears"  , [TentEncBodyUbication.FACE]);
    TentEncBodyUbication.NOSE   = new TentEncBodyUbication("nose", "nose"  , [TentEncBodyUbication.FACE]);
    TentEncBodyUbication.MOUTH  = new TentEncBodyUbication("mouth", "mouth", [TentEncBodyUbication.FACE]);
    TentEncBodyUbication.HAIR   = new TentEncBodyUbication("hair", "hair"  , [TentEncBodyUbication.HEAD]);
    
    // ======================================================
    // Torso Regions
    // ======================================================
    TentEncBodyUbication.TORSO   = new TentEncBodyUbication("torso"  , "torso"  , [TentEncBodyUbication.VISIBLE]);
    TentEncBodyUbication.CHEST   = new TentEncBodyUbication("chest"  , "chest"  , [TentEncBodyUbication.TORSO]);
    TentEncBodyUbication.BREASTS = new TentEncBodyUbication("breasts", "breasts", [TentEncBodyUbication.CHEST]);
    TentEncBodyUbication.NIPPLES = new TentEncBodyUbication("nipples", "nipples", [TentEncBodyUbication.BREASTS]);
    TentEncBodyUbication.BELLY   = new TentEncBodyUbication("belly"  , "belly"  , [TentEncBodyUbication.TORSO]);
    TentEncBodyUbication.BACK    = new TentEncBodyUbication("back"   , "back"   , [TentEncBodyUbication.TORSO]);
    
    // ======================================================
    // Neck & Shoulders
    // ======================================================
    TentEncBodyUbication.NECK           = new TentEncBodyUbication("neck", "neck", [TentEncBodyUbication.HEAD]);
    TentEncBodyUbication.SHOULDERS      = new TentEncBodyUbication("shoulders", "shoulders", [TentEncBodyUbication.TORSO]);
    TentEncBodyUbication.LEFT_SHOULDER  = new TentEncBodyUbication("left_shoulder", "left shoulder", [TentEncBodyUbication.SHOULDERS]);
    TentEncBodyUbication.RIGHT_SHOULDER = new TentEncBodyUbication("right_shoulder", "right shoulder", [TentEncBodyUbication.SHOULDERS]);
    
    // ======================================================
    // Pelvic Regions
    // ======================================================
    TentEncBodyUbication.HIPS     = new TentEncBodyUbication("hips", "hips", [TentEncBodyUbication.VISIBLE]);
    TentEncBodyUbication.GROINS   = new TentEncBodyUbication("groins", "groins", [TentEncBodyUbication.HIPS]);
    TentEncBodyUbication.BUTTOCKS = new TentEncBodyUbication("buttocks", "buttocks", [TentEncBodyUbication.HIPS]);
    
	// ======================================================
    // Sexual Organs for Males
    // ======================================================
    TentEncBodyUbication.PENIS = new TentEncBodyUbication("penis", "penis", [TentEncBodyUbication.GROINS]);
    TentEncBodyUbication.BALLS = new TentEncBodyUbication("balls", "balls", [TentEncBodyUbication.GROINS]);
    
    // ======================================================
    // Sexual Organs for Females
    // ======================================================
    TentEncBodyUbication.PUSSY    = new TentEncBodyUbication("pussy"   , "pussy"   , [TentEncBodyUbication.GROINS]);
    TentEncBodyUbication.LABIA    = new TentEncBodyUbication("labia"   , "labia"   , [TentEncBodyUbication.PUSSY]);
    TentEncBodyUbication.CLITORIS = new TentEncBodyUbication("clitoris", "clitoris", [TentEncBodyUbication.PUSSY]);
    
    // ======================================================
    // Additional Crucial Areas for Intercourse
    // ======================================================
    TentEncBodyUbication.PERINEUM = new TentEncBodyUbication("perineum", "perineum", [TentEncBodyUbication.GROINS]);
    TentEncBodyUbication.ANUS     = new TentEncBodyUbication("anus"    , "anus"    , [TentEncBodyUbication.GROINS, TentEncBodyUbication.BUTTOCKS]);
    
    // ======================================================
    // Left Arm & Hand Subdivisions
    // ======================================================
	TentEncBodyUbication.LEFT_ARM        = new TentEncBodyUbication("left_arm"      , "left arm"      , [TentEncBodyUbication.VISIBLE]);
    TentEncBodyUbication.LEFT_UPPER_ARM  = new TentEncBodyUbication("left_upper_arm", "left upper arm", [TentEncBodyUbication.LEFT_ARM, TentEncBodyUbication.SHOULDERS]);
    TentEncBodyUbication.LEFT_ELBOW      = new TentEncBodyUbication("left_elbow"    , "left elbow"    , [TentEncBodyUbication.LEFT_ARM]);
    TentEncBodyUbication.LEFT_FOREARM    = new TentEncBodyUbication("left_forearm"  , "left forearm"  , [TentEncBodyUbication.LEFT_ARM]);
    TentEncBodyUbication.LEFT_HAND       = new TentEncBodyUbication("left_hand"     , "left hand"     , [TentEncBodyUbication.LEFT_ARM]);
    TentEncBodyUbication.LEFT_FINGERS    = new TentEncBodyUbication("left_fingers"  , "left fingers"  , [TentEncBodyUbication.LEFT_HAND]);
    
    // ======================================================
    // Right Arm & Hand Subdivisions
    // ======================================================
	TentEncBodyUbication.RIGHT_ARM        = new TentEncBodyUbication("right_arm"      , "right arm"      , [TentEncBodyUbication.VISIBLE]);
    TentEncBodyUbication.RIGHT_UPPER_ARM  = new TentEncBodyUbication("right_upper_arm", "right upper arm", [TentEncBodyUbication.RIGHT_ARM, TentEncBodyUbication.SHOULDERS]);
    TentEncBodyUbication.RIGHT_ELBOW      = new TentEncBodyUbication("right_elbow"    , "right elbow"    , [TentEncBodyUbication.RIGHT_ARM]);
    TentEncBodyUbication.RIGHT_FOREARM    = new TentEncBodyUbication("right_forearm"  , "right forearm"  , [TentEncBodyUbication.RIGHT_ARM]);
    TentEncBodyUbication.RIGHT_HAND       = new TentEncBodyUbication("right_hand"     , "right hand"     , [TentEncBodyUbication.RIGHT_ARM]);
    TentEncBodyUbication.RIGHT_FINGERS    = new TentEncBodyUbication("right_fingers"  , "right fingers"  , [TentEncBodyUbication.RIGHT_HAND]);
    
    // ======================================================
    // Left Leg & Lower Limb Subdivisions
    // ======================================================
    TentEncBodyUbication.LEFT_LEG   = new TentEncBodyUbication("left_leg"  , "left leg"  , [TentEncBodyUbication.VISIBLE]);
    TentEncBodyUbication.LEFT_THIGH = new TentEncBodyUbication("left_thigh", "left thigh", [TentEncBodyUbication.LEFT_LEG, TentEncBodyUbication.HIPS]);
    TentEncBodyUbication.LEFT_KNEE  = new TentEncBodyUbication("left_knee" , "left knee" , [TentEncBodyUbication.LEFT_LEG]);
    TentEncBodyUbication.LEFT_CALF  = new TentEncBodyUbication("left_calf" , "left calf" , [TentEncBodyUbication.LEFT_LEG]);
    TentEncBodyUbication.LEFT_FOOT  = new TentEncBodyUbication("left_foot" , "left foot" , [TentEncBodyUbication.LEFT_LEG]);
    TentEncBodyUbication.LEFT_TOES  = new TentEncBodyUbication("left_toes" , "left toes" , [TentEncBodyUbication.LEFT_FOOT]);
    
    // ======================================================
    // Right Leg & Lower Limb Subdivisions
    // ======================================================
	TentEncBodyUbication.RIGHT_LEG   = new TentEncBodyUbication("right_leg"  , "right leg"  , [TentEncBodyUbication.VISIBLE]);
    TentEncBodyUbication.RIGHT_THIGH = new TentEncBodyUbication("right_thigh", "right thigh", [TentEncBodyUbication.RIGHT_LEG, TentEncBodyUbication.HIPS]);
    TentEncBodyUbication.RIGHT_KNEE  = new TentEncBodyUbication("right_knee" , "right knee" , [TentEncBodyUbication.RIGHT_LEG]);
    TentEncBodyUbication.RIGHT_CALF  = new TentEncBodyUbication("right_calf" , "right calf" , [TentEncBodyUbication.RIGHT_LEG]);
    TentEncBodyUbication.RIGHT_FOOT  = new TentEncBodyUbication("right_foot" , "right foot" , [TentEncBodyUbication.RIGHT_LEG]);
    TentEncBodyUbication.RIGHT_TOES  = new TentEncBodyUbication("right_toes" , "right toes" , [TentEncBodyUbication.RIGHT_FOOT]);
	
    // ======================================================
    // Inners
    // ======================================================
	TentEncBodyUbication.VAGINA   = new TentEncBodyUbication("vagina"  , "vagina"  , [TentEncBodyUbication.INNERS]);
	TentEncBodyUbication.CERVIX   = new TentEncBodyUbication("cervix"  , "cervix"  , [TentEncBodyUbication.INNERS]);
	TentEncBodyUbication.UTERUS   = new TentEncBodyUbication("uterus"  , "uterus"  , [TentEncBodyUbication.INNERS]);
	
	TentEncBodyUbication.RECTUM   = new TentEncBodyUbication("rectum"  , "rectum"  , [TentEncBodyUbication.INNERS]);
	TentEncBodyUbication.GUTS     = new TentEncBodyUbication("guts"    , "guts"    , [TentEncBodyUbication.INNERS]);
	TentEncBodyUbication.STOMACH  = new TentEncBodyUbication("stomach" , "stomach" , [TentEncBodyUbication.INNERS]);
	TentEncBodyUbication.THROAT   = new TentEncBodyUbication("throat"  , "throat"  , [TentEncBodyUbication.INNERS]);
}
