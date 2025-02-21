function scene_object(_name) constructor {
	name = _name;
	description = "Is hard to describe what doesn't exists.";
	
	static enumerate = function() {
		scr_inform("A "+name);
	}
	static inspect = function() { scr_inform(self.description); }
	static use = function() { scr_inform("You can't use that."); }
	static attack = function() { scr_inform("You can't attack that."); }
	static move = function() { scr_inform("You can't move that."); }
	static take = function() { scr_inform("You can't take that."); }
	static drop = function() { scr_inform("You can't drop that."); }
	static consume = function() { scr_inform("You can't consume that."); }
}