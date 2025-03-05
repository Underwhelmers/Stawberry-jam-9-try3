function ecs_setup_action_give_item() {
    ecs_setup_system_multiplayer_action(
        "give {name2} to {name1}",
        [["is_npc", "inventory"], ["is_item","in_inventory"]],
        function(entities) {
            var npc = entities[0];
            var item = entities[1];
            
            // Transfer item to NPC's inventory
            npc.inventory.add_item(item);
            scr_inform("You gave {0} to {1}.", item.name, npc.name);
            
            // Adjust relationship based on item value or NPC preference
            if (struct_exists(npc, "relationship")) {
                npc.relationship.affinity = min(1, npc.relationship.affinity + 0.2);
            }
            scr_chat((npc.name), "Thanks for the {0}!", item.name);
        }
    );
}