/mob/living/carbon/human/species/halforc/orc_raider
	name = "Orc Raider"

	icon = 'icons/roguetown/mob/monster/orc.dmi'
	icon_state = "orc"
	race = /datum/species/halforc/orc_raider
	gender = MALE
	bodyparts = list(/obj/item/bodypart/chest, /obj/item/bodypart/head/orc, /obj/item/bodypart/l_arm/,
					 /obj/item/bodypart/r_arm, /obj/item/bodypart/r_leg, /obj/item/bodypart/l_leg)
	rot_type = /datum/component/rot/corpse/halforc/orc_raider
	var/orc_outfit = /datum/outfit/job/roguetown/npc/halforc/orc_raider
	ambushable = FALSE
	erpable = TRUE
	hornychance = 0 //I don't know how to give them genitals
	base_intents = list(INTENT_HELP, INTENT_DISARM, INTENT_GRAB, /datum/intent/unarmed/claw)
	possible_rmb_intents = list()
	//If someone ends up writing custom messages for orcs, lewd talk could be used ig -yack
	//lewd_talk = TRUE
	//skin color is "e8b59b"
	skin_tone = "e8b59b"
	hair_color = "291e01"
	var/bounty = 60

/mob/living/carbon/human/species/halforc/orc_raider/unarmed
	orc_outfit = null

/mob/living/carbon/human/species/halforc/orc_raider/unarmed
	orc_outfit = null

/mob/living/carbon/human/species/halforc/orc_raider/npc
	aggressive = 1
	mode = AI_IDLE
	dodgetime = 150 //slow dodgers, relies on their gear and durability
	flee_in_pain = FALSE //Actual Psychos

	wander = FALSE

/mob/living/carbon/human/species/halforc/orc_raider/npc/ambush

	wander = TRUE

/mob/living/carbon/human/species/halforc/orc_raider/savage_orc

/mob/living/carbon/human/species/halforc/orc_raider/savage_orc/after_creation()
	equipOutfit(new /datum/outfit/job/roguetown/npc/halforc/orc_raider)

/obj/item/bodypart/head/orc/update_icon_dropped()
	return

/obj/item/bodypart/head/orc/get_limb_icon(dropped, hideaux = FALSE)
	return

/obj/item/bodypart/head/orc/skeletonize()
	. = ..()
	icon_state = "orc_skel_head"
	sellprice = 2


/datum/species/halforc/orc_raider
	name = "Orc"
	id = "orc"
	species_traits = list(NO_UNDERWEAR,NOEYESPRITES)
	inherent_traits = list(TRAIT_NOROGSTAM,TRAIT_RESISTCOLD,TRAIT_RESISTHIGHPRESSURE,TRAIT_RESISTLOWPRESSURE,TRAIT_RADIMMUNE) //Removed the critweakness because they're hardier than goblins
	nojumpsuit = 1
	sexes = 0 //Someone can fix this when sprites are made
	offset_features = list(OFFSET_HANDS = list(0,-4), OFFSET_HANDS_F = list(0,-4))
	damage_overlay_type = ""
	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes,
		ORGAN_SLOT_EARS = /obj/item/organ/ears/halforc,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
		ORGAN_SLOT_ANUS = /obj/item/organ/filling_organ/anus,
		ORGAN_SLOT_HORNS = /obj/item/organ/horns/halforc,
		)
	offset_features = list(
		OFFSET_ID = list(0,1), OFFSET_GLOVES = list(0,1), OFFSET_WRISTS = list(0,1),\
		OFFSET_CLOAK = list(0,1), OFFSET_FACEMASK = list(0,1), OFFSET_HEAD = list(0,1), \
		OFFSET_FACE = list(0,1), OFFSET_BELT = list(0,1), OFFSET_BACK = list(0,1), \
		OFFSET_NECK = list(0,1), OFFSET_MOUTH = list(0,1), OFFSET_PANTS = list(0,0), \
		OFFSET_SHIRT = list(0,1), OFFSET_ARMOR = list(0,1), OFFSET_HANDS = list(0,1), OFFSET_UNDIES = list(0,1), \
		OFFSET_ID_F = list(0,-1), OFFSET_GLOVES_F = list(0,0), OFFSET_WRISTS_F = list(0,0), OFFSET_HANDS_F = list(0,0), \
		OFFSET_CLOAK_F = list(0,0), OFFSET_FACEMASK_F = list(0,-1), OFFSET_HEAD_F = list(0,-1), \
		OFFSET_FACE_F = list(0,-1), OFFSET_BELT_F = list(0,0), OFFSET_BACK_F = list(0,-1), \
		OFFSET_NECK_F = list(0,-1), OFFSET_MOUTH_F = list(0,-1), OFFSET_PANTS_F = list(0,0), \
		OFFSET_SHIRT_F = list(0,0), OFFSET_ARMOR_F = list(0,0), OFFSET_UNDIES_F = list(0,-1), \
		)
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	var/raceicon = "orc"
	fixed_mut_color = "e8b59b"
	custom_clothes = TRUE

/datum/species/halforc/orc_raider/regenerate_icons(mob/living/carbon/human/H)
//	H.cut_overlays()
	H.icon_state = ""
	if(H.notransform)
		return 1
	H.update_inv_hands()
	H.update_inv_handcuffed()
	H.update_inv_legcuffed()
	H.update_fire()
	H.update_body()
	var/mob/living/carbon/human/species/halforc/orc_raider/G = H
	G.update_wearable()
	H.update_transform()
	return TRUE

/mob/living/carbon/human/species/halforc/orc_raider/update_body()
	remove_overlay(BODY_LAYER)
	if(!dna || !dna.species)
		return
	var/datum/species/halforc/orc_raider/G = dna.species
	if(!istype(G))
		return
	icon_state = ""
	var/list/standing = list()
	var/mutable_appearance/body_overlay
	var/obj/item/bodypart/chesty = get_bodypart("chest")
	var/obj/item/bodypart/headdy = get_bodypart("head")
	if(!headdy)
		if(chesty && chesty.skeletonized)
			body_overlay = mutable_appearance(icon, "orc_skel_decap", -BODY_LAYER)
		else
			body_overlay = mutable_appearance(icon, "[G.raceicon]_decap", -BODY_LAYER)
	else
		if(chesty && chesty.skeletonized)
			body_overlay = mutable_appearance(icon, "orc_skel", -BODY_LAYER)
		else
			body_overlay = mutable_appearance(icon, "[G.raceicon]", -BODY_LAYER)

	if(body_overlay)
		standing += body_overlay
	if(standing.len)
		overlays_standing[BODY_LAYER] = standing

	apply_overlay(BODY_LAYER)
	dna.species.update_damage_overlays()

/mob/living/carbon/human/species/halforc/orc_raider/proc/update_wearable()
	remove_overlay(ARMOR_LAYER)

	var/list/standing = list()
	var/mutable_appearance/body_overlay
	if(wear_armor)
		body_overlay = mutable_appearance(icon, "[wear_armor.item_state]", -ARMOR_LAYER)
		if(body_overlay)
			standing += body_overlay
	if(wear_pants)
		body_overlay = mutable_appearance(icon, "[wear_pants.item_state]", -ARMOR_LAYER)
		if(body_overlay)
			standing += body_overlay
	if(head)
		body_overlay = mutable_appearance(icon, "[head.item_state]", -ARMOR_LAYER)
		if(body_overlay)
			standing += body_overlay
	if(standing.len)
		overlays_standing[ARMOR_LAYER] = standing

	apply_overlay(ARMOR_LAYER)

/mob/living/carbon/human/species/halforc/orc_raider/update_inv_head()
	update_wearable()
/mob/living/carbon/human/species/halforc/orc_raider/update_inv_pants()
  	update_wearable()
/mob/living/carbon/human/species/halforc/orc_raider/update_inv_armor()
	update_wearable()

/datum/species/halforc/orc_raider/update_damage_overlays(mob/living/carbon/human/H)
	return

/mob/living/carbon/human/species/halforc/orc_raider/Initialize()
	if(prob(50))
		gender = FEMALE
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(after_creation)), 1 SECONDS)

/mob/living/carbon/human/species/halforc/orc_raider/handle_combat()
	if(mode == AI_HUNT)
		if(prob(2))
			emote("laugh")
	. = ..()

/mob/living/carbon/human/species/halforc/orc_raider/after_creation()
	..()
	if(src.dna && src.dna.species)
		src.dna.species.soundpack_m = new /datum/voicepack/male/halforc/orc_raider()
		src.dna.species.soundpack_f = new /datum/voicepack/male/halforc/orc_raider()
		var/obj/item/headdy = get_bodypart("head")
		if(headdy)
			headdy.icon = 'icons/roguetown/mob/monster/orc.dmi'
			headdy.icon_state = "[src.dna.species.id]_head"
			headdy.sellprice = 60
	src.grant_language(/datum/language/orcish)
	var/obj/item/organ/eyes/eyes = src.getorganslot(ORGAN_SLOT_EYES)
	if(eyes)
		eyes.Remove(src,1)
		QDEL_NULL(eyes)
	eyes = new /obj/item/organ/eyes/night_vision/wild_goblin
	eyes.Insert(src)
	if(src.charflaw)
		QDEL_NULL(src.charflaw)
	update_body()
	faction = list("orcs")
	name = "orc"
	real_name = "orc"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
//	ADD_TRAIT(src, TRAIT_NOBREATH, TRAIT_GENERIC)
//	blue breathes underwater, need a new specific one for this maybe organ cheque
//	ADD_TRAIT(src, TRAIT_TOXIMMUNE, TRAIT_GENERIC)
	if(orc_outfit)
		var/datum/outfit/O = new orc_outfit
		if(O)
			equipOutfit(O)

/datum/component/rot/corpse/halforc/orc_raider/process()
	var/amt2add = 10 //1 second
	if(last_process)
		amt2add = ((world.time - last_process)/10) * amt2add
	last_process = world.time
	amount += amt2add
	var/mob/living/carbon/C = parent
	if(!C)
		qdel(src)
		return
	if(C.stat != DEAD)
		qdel(src)
		return
	var/should_update = FALSE
	if(amount > 8 MINUTES)
		C.visible_message(span_notice("The Orc decomposes..."))
		qdel(C)
		/*
		for(var/obj/item/bodypart/B in C.bodyparts)
			if(!B.skeletonized)
				B.skeletonized = TRUE
				should_update = TRUE*/
	else if(amount > 4 MINUTES)
		for(var/obj/item/bodypart/B in C.bodyparts)
			if(!B.rotted)
				B.rotted = TRUE
				should_update = TRUE
			if(B.rotted)
				var/turf/open/T = C.loc
				if(istype(T))
					T.add_pollutants(/datum/pollutant/rot, 1)
	if(should_update)
		if(amount > 8 MINUTES)
			C.update_body()
			qdel(src)
			return
		else if(amount > 4 MINUTES)
			C.update_body()

/datum/outfit/job/roguetown/npc/halforc/orc_raider/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = 16
	H.STASPD = 8
	H.STACON = 16
	H.STAEND = 15
	H.STAINT = 9
	var/loadout = rand(1,5)
	switch(loadout)

		if(1) //axe
			if(H.mind)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 3, TRUE) //Just in cast a player takes over an npc
			r_hand = /obj/item/rogueweapon/stoneaxe/battle
			armor = /obj/item/clothing/suit/roguetown/armor/leather/studded/orc
			if(prob(33))
				armor = /obj/item/clothing/suit/roguetown/armor/chainmail/orc
			if(prob(33))
				armor = /obj/item/clothing/suit/roguetown/armor/carapace/cuirass/orc
			pants = /obj/item/clothing/under/roguetown/trou/leather/orc
			if(prob(80))
				head = /obj/item/clothing/head/roguetown/helmet/orc
			if(prob(50))
				l_hand = /obj/item/rogueweapon/shield/wood

		if(2) //flail
			if(H.mind)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 3, TRUE)
			r_hand = /obj/item/rogueweapon/flail/sflail
			armor = /obj/item/clothing/suit/roguetown/armor/leather/studded/orc
			if(prob(33))
				armor = /obj/item/clothing/suit/roguetown/armor/chainmail/orc
			if(prob(33))
				armor = /obj/item/clothing/suit/roguetown/armor/carapace/cuirass/orc
			pants = /obj/item/clothing/under/roguetown/trou/leather/orc
			if(prob(80))
				head = /obj/item/clothing/head/roguetown/helmet/orc
			if(prob(50))
				l_hand = /obj/item/rogueweapon/shield/wood

		if(3) //maces
			if(H.mind)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
			r_hand = /obj/item/rogueweapon/mace/steel
			armor = /obj/item/clothing/suit/roguetown/armor/leather/studded/orc
			if(prob(33))
				armor = /obj/item/clothing/suit/roguetown/armor/chainmail/orc
			if(prob(33))
				armor = /obj/item/clothing/suit/roguetown/armor/carapace/cuirass/orc
			pants = /obj/item/clothing/under/roguetown/trou/leather/orc
			if(prob(80))
				head = /obj/item/clothing/head/roguetown/helmet/orc
			if(prob(50))
				l_hand = /obj/item/rogueweapon/shield/wood

		if(4) //sword
			if(H.mind)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
			r_hand = /obj/item/rogueweapon/sword/long
			armor = /obj/item/clothing/suit/roguetown/armor/leather/studded/orc
			if(prob(33))
				armor = /obj/item/clothing/suit/roguetown/armor/chainmail/orc
			if(prob(33))
				armor = /obj/item/clothing/suit/roguetown/armor/carapace/cuirass/orc
			pants = /obj/item/clothing/under/roguetown/trou/leather/orc
			if(prob(80))
				head = /obj/item/clothing/head/roguetown/helmet/orc
			if(prob(50))
				l_hand = /obj/item/rogueweapon/shield/wood

		if(5) //naked berserker, huge weapon no armor
			ADD_TRAIT(H, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
			H.change_stat("strength", 2)
			H.change_stat("endurance", 2)
			H.change_stat("intelligence", -3)
			H.change_stat("speed", 4)
			r_hand = /obj/item/rogueweapon/greataxe
			if(prob(33))
				r_hand = /obj/item/rogueweapon/greatsword
			if(prob(33))
				r_hand = /obj/item/rogueweapon/mace/goden/steel
			if(H.mind)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
			pants = /obj/item/clothing/under/roguetown/trou/leather/orc

///
///
/// Genital Slop goes here, I don't know how that shit works
///
///
