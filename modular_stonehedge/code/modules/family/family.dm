GLOBAL_DATUM_INIT(families, /datum/family, new)

/datum/family
	var/list/families
	var/list/family_offer = list()

/datum/family/New()
	. = ..()
	if(!length(families))
		load_families()

/datum/family/proc/load_families()
	if(!fexists(FAMILY_FILE))
		families = list()
		text2file(json_encode(families), FAMILY_FILE)
		return

	var/file = file(FAMILY_FILE)
	if(!file)
		failed_parsing("get file")
		return

	var/file_text = file2text(file)
	if(!file_text)
		failed_parsing("get text from file from")
		return
	
	var/parse_family_list = json_decode(file_text)
	if(!parse_family_list)
		failed_parsing("parse json from")
		return

	families = parse_family_list

/datum/family/proc/save_families()
	text2file(json_encode(families), FAMILY_FILE)

/datum/family/proc/failed_parsing(fail_verb = "parse")
	families = list()
	stack_trace("Failed to [fail_verb] [FAMILY_FILE]")

/datum/family/proc/can_modify_family(client/source, client/target, relation)
	if(!istype(source))
		stack_trace("[source] must be a client!")
		return FALSE
	if(!istype(target))
		stack_trace("[target] must be a client!")
		return FALSE
	if(!source.prefs)
		stack_trace("[source] is somehow missing its prefs datum?")
		return FALSE
	if(!target.prefs)
		stack_trace("[target] is somehow missing its prefs datum?")
		return FALSE
	if(!length(families))
		load_families()
	if(!is_valid_id(source.prefs.family_id))
		stack_trace("[source] is somehow missing their unique family id?")
		return FALSE
	if(!is_valid_id(target.prefs.family_id))
		stack_trace("[target] is somehow missing their unique family id?")
		return FALSE
	return TRUE

/datum/family/proc/error_if_null(nullcheck, owner, error_message)
	if(!nullcheck)
		stack_trace("[owner] [error_message]")
		return FALSE
	return TRUE

/datum/family/proc/is_valid_id(string)
	if(string && string != "")
		return TRUE
	return FALSE

/// Find the family that target is in, no sanity since it assumes target to be already checked
/datum/family/proc/find_player_info(family_id)
	// json format for families.json
	//	[family_id: {
	// 		ckey: string, character: string, gender: string, motherhood_stage: number, unknown_children: number
	//		relations: [
	//			{id, relation}
	//			{id, relation}, 
	// 		]
	// }]
	if(!families[family_id])
		return list()
	return families[family_id]

/datum/family/proc/get_family_info(family_id)
	if(!length(families))
		load_families()
	return find_player_info(family_id)

/datum/family/proc/add_family(client/source, client/target, relation, name, gender)
	if(!can_modify_family(source, target, relation))
		return FALSE
	var/source_id = source.prefs.family_id
	var/list/source_info = find_player_info(source_id)
	if(!source_info)
		source_info[source_id] = generate_player_info(source, name, gender)

	for(var/list/relationship as anything in source_info["relations"])
		if(relation_matches(target, relationship, relationship["relation"])) // please no duplicates of the same relation type
			return FALSE

	source_info["relations"] += generate_relation(target, relation)
	return TRUE

/datum/family/proc/generate_player_info(client/target, name, gender)
	return list(
		"ckey" = target.ckey,
		"character" = name,
		"gender" = gender,
	)

/datum/family/proc/generate_relation(client/target, relation)
	return list(
		"id" = target.prefs.family_id,
		"relation" = relation,
	)

/// Remove family relatiopn from source of target with the relation string
/datum/family/proc/remove_family(client/source, client/target, relation)
	if(!can_modify_family(target, relation))
		return FALSE
	if(!remove_from_relations(source, target, relation))
		return FALSE
	CallAsync(src, save_families())
	return FALSE

/datum/family/proc/remove_from_relations(client/source, client/target, relation)
	var/list/source_relations = get_family_info(target.prefs.family_id)
	var/found_relation = FALSE // even though there should be only one identical relation, we remove all matching relations here because I have trust issues
	for(var/list/list_entry as anything in source_relations)
		if(relation_matches(target, list_entry, relation))
			continue
		source_relations -= list_entry
		found_relation = TRUE
	return found_relation

/datum/family/proc/relation_matches(client/target, list/family, relation)
	if(family["id"] != target.prefs.family_id || family["relation"] != relation)
		return FALSE
	return TRUE

/datum/family/proc/assign_family(client/target)
	if(!target?.prefs?.family_id)
		return
	var/target_family_id = target.prefs.family_id
	if(!ishuman(target))
		CRASH("tried to assign family properties to a non-human mob!")
	var/mob/living/carbon/human/human_target = target
	var/list/relations = get_family_info(target_family_id)
	if(!length(relations))
		return
	var/list/relatives = list()
	for(var/mob/player as anything in GLOB.player_list)
		// track down any mobs that match relatives
		var/family_id = target?.prefs?.family_id 
		if(!family_id && family_id == "")
			continue
		for(var/list/relation in relations)
			if(family_id != relation["id"])
				continue
			relatives[player] += relation["relation"]
	human_target.relatives = relatives
	var/stage = check_motherhood(target_family_id)
	handle_motherhood(stage)
	// update_family_hud(target, relatives)


