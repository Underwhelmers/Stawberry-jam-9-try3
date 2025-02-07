function Kobold() constructor {
	name = generate_phrase_with_variants("new_kobold_name");
	aspect = new KoboldAspect();
	body_size = random_range(0.3,0.6);
	
	pussy = Cavity.generate_vagina(body_size);
	Cavity.digestive_track_for(self);
}