function body_part_access_has_issues(entity, body_part) {
	var _body_part_inst = entity.body[$ body_part.name];
	
	if (_body_part_inst.covered_by != undefined) {
		scr_inform("{0}'s {1} is not exposed.", entity.name, body_part.name);
		return true;
	}
	
	return false;
}