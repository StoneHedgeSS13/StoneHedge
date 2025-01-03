// mob proc and not a client one because we need a reference(name) to the character
/// Add a family member from a player character's family, requires the target character and the relation, IE, "sister", only applies family for the mob that you call this proc on, not the target in the arugment
/mob/proc/add_family(mob/target, relation)
	return GLOB.families.add_family(client, target.client, relation, target.real_name, target.gender)

/// Remove a family member from a player character's family
/mob/proc/remove_family(mob/target, relation)
	return GLOB.families.remove_family(client, target.client, relation)

/// Assign family info onto a character
/mob/proc/assign_family()
	return GLOB.families.assign_family(src)

/mob/proc/set_persistent_motherhood_stage(stage)
	return GLOB.families.set_motherhood_stage(src, stage)

/proc/get_spouse_relation(gender)
	switch(gender)
		if(FEMALE)
			return "wife"
		if(MALE)
			return "husband"
	return "spouse"

/mob/proc/get_spouse_relation()
	return child_relation(gender)

/proc/child_relation(gender)
	switch(gender)
		if(FEMALE)
			return "daughter"
		if(MALE)
			return "son"
	return "child"

/mob/proc/get_child_relation()
	return parent_relation(gender)

/proc/parent_relation(gender)
	switch(gender)
		if(FEMALE)
			return "mother"
		if(MALE)
			return "father"
	return "parent"

/mob/proc/get_parent_relation()
	return sibling_relation(gender)

/proc/sibling_relation(gender)
	switch(gender)
		if(FEMALE)
			return "sister"
		if(MALE)
			return "brother"
	return "sibling"

/mob/proc/get_sibling_relation()
	return sibling_relation(gender)

