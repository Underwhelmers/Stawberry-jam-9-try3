function TentEncBodySkinTexture(_id, _descriptor) constructor {
	identifier = _id;
	descriptor = _descriptor;
}

function scr_setup_tent_enc_body_skin_textures() {
	TentEncBodySkinTexture.SCALED   = new TentEncBodySkinTexture("scaled","scaled");
	TentEncBodySkinTexture.ROUGH    = new TentEncBodySkinTexture("rough","rough");
	TentEncBodySkinTexture.SMOOTH   = new TentEncBodySkinTexture("smooth","smooth");
	TentEncBodySkinTexture.SALLOW   = new TentEncBodySkinTexture("sallow","sallow");
	TentEncBodySkinTexture.WRINKLED = new TentEncBodySkinTexture("wrinkled","wrinkled");
}