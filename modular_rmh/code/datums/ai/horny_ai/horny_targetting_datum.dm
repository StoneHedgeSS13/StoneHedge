/datum/horny_targetting_datum

/datum/horny_targetting_datum/proc/can_horny(mob/living/living_mob, atom/target)
	return

///Returns something the target might be hiding inside of
/datum/horny_targetting_datum/proc/find_hidden_mobs_horny(mob/living/living_mob, atom/target)
	var/atom/target_hiding_location
	if(istype(target.loc, /obj/structure/closet))
		target_hiding_location = target.loc
	return target_hiding_location

/datum/horny_targetting_datum/basic

/datum/horny_targetting_datum/basic/can_horny(mob/living/living_mob, atom/the_target)
	if(isturf(the_target) || !the_target) // bail out on invalids
		return FALSE
	if(issimple(living_mob))
		var/mob/living/simple_animal/attacker = living_mob
		if(attacker.binded == TRUE)
			return FALSE
	if(ismob(the_target)) //Target is in godmode, ignore it.
		var/mob/M = the_target
		if(M.status_flags & GODMODE)
			return FALSE
		if(M:stat == DEAD)
			return FALSE
	if(living_mob.see_invisible < the_target.invisibility)//Target's invisible to us, forget it
		return FALSE

	if(isturf(the_target.loc) && living_mob.z != the_target.z)
		return FALSE

	/*if(isliving(the_target)) //Targetting vs living mobs
		var/mob/living/L = the_target
		if(istype(the_target, /mob/living/simple_animal/hostile))
			var/mob/living/simple_animal/hostile/simp = the_target
			if(the_target in simp.friends) // won't attack whomever summoned it
				return FALSE
		//if(faction_check(living_mob, L) || L.stat)
		//	return FALSE
		return TRUE*/

	if(ishuman(the_target))
		var/mob/living/carbon/human/th = the_target
		if((th.has_quirk(/datum/quirk/peculiarity/monsterhuntermale) && living_mob.gender == MALE) || (th.has_quirk(/datum/quirk/peculiarity/monsterhunterfemale) && living_mob.gender == FEMALE))
			return TRUE
	return FALSE
