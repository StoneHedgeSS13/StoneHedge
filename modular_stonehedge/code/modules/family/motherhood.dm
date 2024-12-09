

/datum/family/proc/check_motherhood(family_id)
	var/list/relations = get_family_info(family_id)
	if(!length(relations))
		return FALSE
	if(!relations["motherhood_stage"])
		return FALSE
	if(relations["motherhood_stage"] <= 0)
		return
	
	
	return TRUE

/datum/family/proc/set_motherhood_stage(mob/target, stage = 1)
	if(!can_modify_family(target) || !isnum(stage) || !ishuman(target))
		return FALSE
	var/mob/living/carbon/human/humie = target
	var/list/relations = get_family_info(family_id)
	relations["motherhood_stage"] = stage
	for(var/obj/item/organ/filling_organ/filler in humie.internal_organs)
		
