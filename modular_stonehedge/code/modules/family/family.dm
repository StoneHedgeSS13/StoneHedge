
#define FAMILY_FILE "data/families.json"

GLOBAL_DATUM_INIT(families, /datum/family, new)

/datum/preferences/proc/create_family_datum()
	family_datum = new()

// mob proc and not a client one because we need a reference(name) to the character
/// Add a family member from a player character's family, requires the target character and the relation, IE, "sister", only applies family for the mob that you call this proc on, not the target in the arugment
/mob/proc/add_family(mob/target, relation)
	return GLOB.add_family(src, target, relation)

/// Remove a family member from a player character's family
/mob/proc/remove_family(mob/target, relation)
	return GLOB.remove_family(src, target, relation)

/mob/proc/get_spouse_relation()
	if(FEMALE)
		return "wife"
	if(MALE)
		return "husband"
	return "spouse"

/mob/proc/get_child_relation()
	if(FEMALE)
		return "daughter"
	if(MALE)
		return "son"
	return "son"

/mob/proc/get_parent_relation()
	switch(gender)
		if(FEMALE)
			return "mother"
		if(MALE)
			return "father"
	return "parent"

/mob/proc/get_sibling_relation()
	if(FEMALE)
		return "sister"
	if(MALE)
		return "brother"
	return "sibling"

/datum/family
	var/list/families

/// read persistent family data on datum creation
/datum/family/New()
	if(!fexists(FAMILY_FILE))
		families = list()
		return

	var/file = file(filename)
	if(!file)
		failed_parsing("get file")
		return

	var/file_text = file2text(file)
	if(!file_text)
		failed_parsing("get text from file from")
		return
	
	var/json = json_decode(file_text)
	if(!json)
		failed_parsing("parse json from")
		return
	
	var/list/parse_family_list = json_decode(json)
	if(!length(parse_family_list))
		failed_parsing("failed to decode json from")
		return
	families = parse_family_list

/datum/family/proc/failed_parsing(fail_verb = "parse")
	families = list()
	stack_trace("Failed to [fail_verb] [FAMILY_FILE]")

/datum/family/proc/can_modify_family(mob/source, mob/target, relation)
	if(!target || !relation || relation == "")
		stack_trace("invalid args passed to /mob/proc/add_family")
		return FALSE
	if(!source.client || !target.client || !target.ckey) // expected fails, so no logging
		return FALSE
	if(!source.client.prefs || !target.client.prefs)
		stack_trace("[client] or [target.client] are somehow missing their prefs datum?")
		return FALSE
	if(!source.client.prefs.family_datum || !target.client.prefs.family_datum)
		stack_trace("[client] or [target.client] are somehow missing their family datum?")
		return FALSE
	return TRUE

/// Find the family that target is in, no sanity since it assumes target to be already checked
/datum/family/proc/find_family(ckey, name)
	// json format for families.json
	// [ckey: {
	//	charnames: {
	//		relations: [
	//			{ckey, char, relation}
	// 		]
	// }}]
	if(!families[ckey])
		families[ckey] = list()
	if(!families[ckey][name])
		families[ckey][name] = list()
	return families[ckey][name]

/datum/family/proc/get_relations(ckey, name)
	var/list/family = find_family(ckey, name)
	if(!family["relations"])
		family["relations"] = list()
	return family["relations"]

/datum/family/proc/find_relation_family(list/relation)
	return find_family(relation["ckey"], relation["character"])

/datum/family/proc/add_family(mob/source, mob/target, relation_source)
	if(!can_modify_family(source, target, relation))
		return FALSE
	
	var/list/source_relations = get_relations(source.ckey, source.real_name)
	source_relations += list(generate_relation(target, relation))
	return TRUE

/datum/family/proc/generate_relation(mob/target, relation)
	return list("ckey" = target.ckey, "character" = target.real_name, "gender" = target.gender)

/datum/family/proc/remove_family(mob/source, mob/target, relation)
	if(!can_modify_family(target, relation))
		return FALSE
	
	for(var/list_entry in client.prefs.family)
		if(list_entry["ckey"] != target.ckey)
			continue
		if(list_entry["character"] != target.real_name)
			continue
		if(list_entry["relation"] != relation)
			continue
		// client.prefs.family -= list_entry
		return TRUE
	return FALSE
