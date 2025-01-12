/datum/job/roguetown/veteran
	title = "Guildmaster"
	flag = VETERAN
	department_flag = MERCENARIES
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_sexes = list(MALE, FEMALE) //same as town guard
	allowed_races = RACES_ALL_KINDSPLUS // same as town guard
	tutorial = "A legend of your field, many a towns are alive thanks only to your hands and your long forgotten companions. You have left your print in the world, but it will all be in vain if there are not more like you to defend your legacy. Take these greenhorns, organize them, tell them what to do, and teach them how to fight. You'll make the world a safer place one newbie at a time."
	display_order = JDO_VET
	whitelist_req = FALSE

	outfit = /datum/outfit/job/roguetown/veteran
	give_bank_account = 2500
	min_pq = 15
	max_pq = null

	cmode_music = 'sound/music/combat_guard.ogg'

/datum/job/roguetown/veteran/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(istype(H.cloak, /obj/item/clothing/cloak/half/vet))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "Guildmaster cloak ([index])"


/datum/outfit/job/roguetown/veteran/pre_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	cloak = /obj/item/clothing/cloak/half/vet
	r_hand = /obj/item/scomstone
	l_hand = /obj/item/class_selector/veteran //this is where they equip shit.
	H.verbs |= /mob/proc/haltyell
