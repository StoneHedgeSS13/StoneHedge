#define MAX_STAGE 4

#define CHOOSE_CHILD_VERB_NAME "Choose Child"
#define CHILD_VERB_CATEGORY "OOC"

#define BECOME_CHILD_VERB_NAME "Become Child"
// iffy code, i don't like it
/// returns a stage(number) of motherhood
/datum/family/proc/check_motherhood(family_id)
	var/list/relations = get_family_info(family_id)
	if(!length(relations))
		return 0
	if(!relations["motherhood_stage"])
		return 0
	return relations["motherhood_stage"]

/datum/family/proc/set_motherhood_stage(mob/target, stage = 1)
	if(!can_modify_family(target) || !isnum(stage) || !ishuman(target))
		return FALSE
	if(!target?.client?.prefs?.family_id)
		return FALSE
	var/list/relations = get_family_info(target.client.prefs.family_id)
	if(stage == MAX_STAGE)
		relations["motherhood_stage"] = 0
		var/children = relations["unknown_children"]
		if(!isnum(children))
			children = 0
		target.client.verbs += /client/proc/choose_child
		relations["unknown_children"] = children + 1
		to_chat(target, span_love("You will be a mother soon! Use the verb [CHOOSE_CHILD_VERB_NAME] in the [CHILD_VERB_CATEGORY] category to give a player the choice to play as your child!"))
	relations["motherhood_stage"] = clamp(stage, 0, MAX_STAGE)

/datum/family/proc/handle_motherhood(mob/target, stage = 1)
	if(stage < 1)
		return
	var/mob/living/carbon/human/humie = target
	var/obj/item/organ/filling_organ/vagina/vag = locate() in humie.internal_organs
	vag.be_impregnated(TRUE)
	if(stage == 1)
		return
	vag.set_preggo_stage(stage - 1)

// purposefully not giving you a list of clients
/client/proc/choose_child(ckey as text)
	set name = CHOOSE_CHILD_VERB_NAME
	set category = CHILD_VERB_CATEGORY
	set desc = "Input a ckey to allow the player to make a character that is related to you as a child. Anonymity will still work here."

	if(!ckey || ckey == "")
		to_chat(src, span_warn("Invalid ckey!"))
		return

	var/client/found_client
	for(var/client/client as anything in GLOB.clients)
		if(client.ckey != ckey)
			break
		found_client = client

	if(!found_client)
		to_chat(src, span_warn("Could not find ckey [ckey]"))
		return

	to_chat(src, span_love("Ckey valid, [ckey] will now be able to create a character that is your child, as long as they choose within this round."))
	to_chat(src, span_love("This will tie them to your current loaded character"))
	found_client.verbs += /client/proc/become_child
	var/keyname = found_client.ckey
	if(ckey in GLOB.anonymize)
		keyname = get_fake_key(ckey)

	GLOB.families.family_offer[src] = list("receiver_client" = found_client, "mother_name" = prefs.real_name)
	to_chat(found_client, span_love("You have been offered to become the child of [keyname]."))
	to_chat(found_client, span_love("Use the verb [BECOME_CHILD_VERB_NAME] in the [CHILD_VERB_CATEGORY] category \
		and choose one of your character slots to become a child of [keyname]. This offer will only be valid within this round."))

/client/proc/become_child(ckey as text)
	set name = BECOME_CHILD_VERB_NAME
	set category = CHILD_VERB_CATEGORY
	set desc = "Choose a savefile to become the child of a player."

	var/client/found_client
	var/client/found_real_name
	for(var/client/client as anything in GLOB.families.family_offer)
		if(GLOB.families.family_offer[client]["receiver_client"] == src && GLOB.families.family_offer[client]["mother_name"])
			found_client = client
			found_real_name = GLOB.families.family_offer[client]["mother_name"]
			break

	if(!found_client)
		to_chat(src, to_chat(span_warn("No valid family offer found!")))
		verbs -= /client/proc/become_child
		return

	var/list/choices = list()
	if(!prefs.path)
		to_chat(src, to_chat(span_warn("Savefile broken!")))
		return

	var/savefile/S = new /savefile(prefs.path)
	if(!S)
		to_chat(src, to_chat(span_warn("Savefile broken!")))
		return

	for(var/i = 1, i <= prefs.max_save_slots, i++)
		var/name
		S.cd = "/character[i]"
		S["real_name"] >> name
		if(!name)
			name = "Slot[i]"
		choices[name] = i

	var/choice = input(src, "CHOOSE A CHILD", "DREAM KEEP") as null|anything in choices
	if(!choice)
		return

	choice = choices[choice]
	if(!prefs.load_character(choice))
		to_chat(src, span_love("No character found in slot [choice], creating a new character."))
		prefs.random_character()
		prefs.save_character()

	// no mob so we don't use the helpers
	GLOB.families.add_family(src, found_client, child_relation(prefs.gender), prefs.real_name)
	// assuming mother can only be female
	GLOB.families.add_family(found_client, src, parent_relation(FEMALE), found_real_name)
	GLOB.families.family_offer -= found_client
	verbs -= /client/proc/become_child
	to_chat(found_client, span_love("You have succesfully joined the family of "))

#undef MAX_STAGE

#undef CHILD_VERB_CATEGORY
#undef CHOOSE_CHILD_VERB_NAME

#undef BECOME_CHILD_VERB_NAME
