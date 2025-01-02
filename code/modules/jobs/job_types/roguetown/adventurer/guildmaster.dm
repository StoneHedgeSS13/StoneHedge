/datum/job/roguetown/veteran
	title = "Guildmaster"
	flag = VETERAN
	department_flag = MERCENARIES
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_sexes = list(MALE, FEMALE) //same as town guard
	allowed_races = RACES_ALL_KINDSPLUS // same as town guard
	tutorial = "You've known combat your entire life. There isn't a way to kill a man or beast you havent practiced in the tapestries of adventuring itself. You would call yourself a hero, given how you made much of this legacy through those you didn't leave behind. those belong to the men left rotting in the fields of where you practiced your ancient trade. You've slept better at night ever since you found purpose here..."
	display_order = JDO_VET
	whitelist_req = FALSE

	outfit = /datum/outfit/job/roguetown/veteran
	give_bank_account = 1500
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
