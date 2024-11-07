

// /mob/proc/can_modify_family(mob/target, relation)
// 	if(!target || !relation || relation == "")
// 		stack_trace("invalid args passed to /mob/proc/add_family")
// 		return FALSE
// 	if(!client || !target.client || !target.ckey)
// 		return FALSE
// 	if(!client.prefs || !target.client.prefs)
// 		stack_trace("[client] or [target.client] are somehow missing their prefs datum?")
// 		return FALSE
// 	return TRUE

// // mob proc and not a client one because we need a reference(name) to the character
// /// Add a family member from a player character's family, requires the target character and the relation, IE, "sister", only applies family for the mob that you call this proc on, not the target in the arugment
// /mob/proc/add_family(mob/target, relation)
// 	if(!can_modify_family(target, relation))
// 		return FALSE

// 	var/list/new_family_entry_owner = list("ckey" = target.ckey, "character" = target.name, "relation" = relation)
// 	// potentially could have made a new datum just for family stuff, but meh, it wouldn't be much more than holding a few lists
// 	client.prefs.family += new_family_entry
// 	return TRUE

// /// Remove a family member from a player character's family
// /mob/proc/remove_family(mob/target, relation)
// 	if(!can_modify_family(target, relation))
// 		return FALSE
	
// 	for(var/list_entry in client.prefs.family)
// 		if(list_entry["ckey"] != target.ckey)
// 			continue
// 		if(list_entry["character"] != target.name)
// 			continue
// 		if(list_entry["relation"] != relation)
// 			continue
// 		client.prefs.family -= list_entry
// 		return TRUE

// 	return FALSE

// /mob/proc/get_spouse_relation()
// 	switch(gender)
// 		if(FEMALE)
// 			return "wife"
// 		if(MALE)
// 			return "husband"
// 	return "spouse"
