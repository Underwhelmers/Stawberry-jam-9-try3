function TentEncBodyBuild(_descriptor, _soulder, _hip, _spine, _muscle, _fat) constructor {
	descriptor = _descriptor;   // Descriptor
	shoulder_width = _shoulder; // Relative unit
	hip_width = _hip;           // Relative unit
	spine_curvature = _spine;   // Curvature factor (0 means straight)
	muscle_tone = _muscle;      // 0 (soft) to 1 (highly defined)
	fat_distribution = _fat;    // Fat distribution on belly, hip and chest
}


function scr_setup_tent_enc_body_builds() {
    // Athletic build: balanced proportions, moderate muscle and fat.
    TentEncBodyBuild.ATHLETIC = function() {
        return new TentEncBodyBuild(
            "athletic", 0.45, 0.5, 0.1, 0.7, 
            new TentEncBodyBuildFatDistribution(0.3, 0.4, 0.2)
        );
    };
    
    // Slim build: slightly narrower shoulders and hips, lower muscle tone.
    TentEncBodyBuild.SLIM = function() {
        return new TentEncBodyBuild(
            "slim", 0.4, 0.45, 0.05, 0.5,
            new TentEncBodyBuildFatDistribution(0.2, 0.3, 0.15)
        );
    };
    
    // Curvy build: fuller hips/chest and a more pronounced waist.
    TentEncBodyBuild.CURVY = function() {
        return new TentEncBodyBuild(
            "curvy", 0.5, 0.6, 0.15, 0.6,
            new TentEncBodyBuildFatDistribution(0.35, 0.5, 0.3)
        );
    };
    
    // Muscular build: higher muscle tone and broader shoulders.
    TentEncBodyBuild.MUSCULAR = function() {
        return new TentEncBodyBuild(
            "muscular", 0.55, 0.5, 0.1, 0.9,
            new TentEncBodyBuildFatDistribution(0.25, 0.35, 0.2)
        );
    };
    
    // Short Stack: compact, stocky proportions.
    TentEncBodyBuild.SHORT_STACK = function() {
        return new TentEncBodyBuild(
            "short stack", 0.5, 0.55, 0.1, 0.65,
            new TentEncBodyBuildFatDistribution(0.4, 0.45, 0.35)
        );
    };
}
