function PhraseBuilderByStepsNode(_callback) constructor {
	mytext = "";
	childrens = ds_map_create();
	callback = _callback;
	parent = undefined;
	args = undefined;

    static add_leaf = function(_full_text, _args) {
        var words = string_split(_full_text, " ");
        var current = self;
        
        for (var i = 0; i < array_length(words); i++) {
            var word = words[i];
            if (!ds_map_exists(current.childrens, word)) {
				var child = new PhraseBuilderByStepsNode(callback);
                child.mytext = word;
                child.parent = current;
				
                current.childrens[? word] = child;
            }
            current = current.childrens[? word];
        }
        current.args = _args;
    }

    static list = function() {
        return ds_map_keys_to_array(children);
    }

    static text = function() {
        var node = self;
        var path = [];
        
        while (node.parent != undefined) {
            array_insert(path, 0, node.mytext);
            node = node.parent;
        }
        
        return string_join(path, " ");
    }

    static select = function(_word) {
        if (ds_map_exists(childrens, _word)) {
            var node = childrens[? _word];
            if (ds_map_size(node.childrens) == 0) {
                callback(node.mytext, node.args);
            }
            return node;
        }
        return undefined;
    }
	
	static compress = function() {
		while (ds_map_size(childrens) == 1) {
			var key = ds_map_find_first(childrens);
			var child = childrens[? key];
			var oldtext = mytext;
			mytext = string("{0} {1}", mytext, key);
			
			if(parent) {
				ds_map_delete(parent.childrens, oldtext);
				ds_map_add(parent.childrens, mytext, self);
			}
			
			ds_map_destroy(childrens);
			childrens = child.childrens;
			callback = child.callback;
			args = child.args;
			
			var newchilds = ds_map_values_to_array(childrens);
			for (var i = 0, count = array_length(newchilds); i < count; i++) {
				newchilds[i].parent = self;
			}
		}
		
		var childs = ds_map_values_to_array(childrens);
		for (var i = 0, count = array_length(childs); i < count; i++) {
			childs[i].compress();
		}
	}
}
