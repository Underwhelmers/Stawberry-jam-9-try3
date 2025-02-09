function TentEncBodySpecie(_possible, _specie_shared) constructor {
	available_skin_textures = _possible.skin_texture;
	eyes_features = _specie_shared.eyes;
	skin_features = _specie_shared.skin;
	hair_features = _specie_shared.hair;
	
	static random_height = function() {
		
	}
};

function scr_setup_tent_enc_body_specie() {
    // Create a human species with sample arrays of textures and features.
    TentEncBodySpecie.HUMAN = new TentEncBodySpecie({
		skin_texture: [
            TentEncBodySkinTexture.SMOOTH,
            TentEncBodySkinTexture.ROUGH
        ]},{
			eyes: [],
			hair: [],
			skin: []
		}
    );
    
    // Kobolds have a more exotic look.
    TentEncBodySpecie.KOBOLD = new TentEncBodySpecie({
		skin_texture: [
			TentEncBodySkinTexture.SCALED,
			TentEncBodySkinTexture.ROUGH
	    ]}, {
			eyes: ["vertical slid pupil", "inner eyelid"],
			skin: ["a mottled pattern", "small scars"],
			hair: ["spiky tufts"],
		}
    );
    
    // Goblins carry a scruffy, patchy look.
    TentEncBodySpecie.GOBLIN = new TentEncBodySpecie({
		skin_texture: [
			TentEncBodySkinTexture.ROUGH,
            TentEncBodySkinTexture.SALLOW,
            TentEncBodySkinTexture.WRINKLED
	    ]}, {
			eyes: ["sly", "mischievous"],
			skin: ["a patchy complexion", "a few scars"],
			hair: ["messy hair"],
		}
    );
    
    // Faeries are a touch otherworldly.
    TentEncBodySpecie.FAERY = new TentEncBodySpecie({
		skin_texture: [
			TentEncBodySkinTexture.SMOOTH
	    ]}, {
			eyes: ["sparkling", "otherworldly"],
			skin: ["a soft iridescence", "a fine layer of glowing dust"],
			hair: ["flowing, shimmering locks"],
		}
    );
}
