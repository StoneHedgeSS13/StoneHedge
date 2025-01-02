/datum/job/roguetown/greatdruid
	title = "Great Druid"
	f_title = "Great Druidess"
	flag = GREATDRUID
	department_flag = GROVE
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_sexes = list(MALE, FEMALE)
	spells = list (
		/obj/effect/proc_holder/spell/invoked/diagnose/secular,
		/obj/effect/proc_holder/spell/targeted/shapeshift,
		/obj/effect/proc_holder/spell/aoe_turf/conjure/Wolf,
		/obj/effect/proc_holder/spell/invoked/infestation5e,
		/obj/effect/proc_holder/spell/self/primalsavagery5e,)
	allowed_races = RACES_ALL_KINDSPLUS
	outfit = /datum/outfit/job/roguetown/greatdruid
	tutorial = "As the leader of the Breuddwyd Grove, you are both a spiritual guide and the commander of its guardians. Your connection to Nature and Sylvarn has elevated you to this position of authority, where you maintain order through both mystical wisdom and martial force. You are responsible for defending the Town and enforcing its laws, leading the Grove's rangers and druids in protecting both the wilderness and civilization. While you bridge the gap between the natural and magical worlds, your primary duty is to ensure peace and justice prevail in both the town and the woodland paths."

	display_order = JDO_GREATDRUID
	selection_color = JCOLOR_GROVE
	give_bank_account = 800
	min_pq = 15
	max_pq = null

/datum/outfit/job/roguetown/greatdruid
	name = "Great Druid"
	jobtype = /datum/job/roguetown/greatdruid
	allowed_patrons = list(/datum/patron/divine/sylvarn)

/datum/job/roguetown/greatdruid/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(istype(H.cloak, /obj/item/clothing/cloak/templar/dendor))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "Breuddwyd Grove Tabard ([index])"

/datum/outfit/job/roguetown/greatdruid/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/boots/forestershoes
	cloak = /obj/item/clothing/cloak/templar/dendor
	pants = /obj/item/clothing/under/roguetown/loincloth/brown
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/rogueweapon/whip/druidic
	beltr = /obj/item/flashlight/flare/torch/lantern
	backl = /obj/item/storage/backpack/rogue/satchel
	backr = /obj/item/rogueweapon/woodstaff/wise
	head = /obj/item/clothing/head/roguetown/helmet/leather/volfhelm/greatdruid
	neck = /obj/item/clothing/neck/roguetown/psicross/dendor/grove
	gloves = /obj/item/clothing/gloves/roguetown/leather/advanced
	armor = /obj/item/clothing/suit/roguetown/armor/leather/studded
	shirt = /obj/item/clothing/suit/roguetown/shirt/robe/dendor
	backpack_contents = list(
		/obj/item/reagent_containers/glass/bottle/rogue/antipoisonpot = 2,
		/obj/item/reagent_containers/glass/bottle/rogue/majorhealthpot = 2,
		/obj/item/roguekey/grove = 1,
		/obj/item/rogueweapon/huntingknife/skin = 1,
	)
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 4, TRUE)

		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/magic/druidic, 6, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 6, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 5, TRUE)

		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/labor/farming, 6, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 4, TRUE)

		H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 4, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/druidic, 3, TRUE)
		H.change_stat("intelligence", 6)
		H.change_stat("wisdom", 6)
		H.change_stat("perception", 4)
	if(isseelie(H))
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/seelie_dust)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/summon_rat)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/conjure_vines)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/seelie_kiss)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/splash)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/roustame)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/animate_object)

	ADD_TRAIT(H, TRAIT_SEEDKNOW, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_VINE_WALKER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_BOG_TREKKING, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_WILD_EATER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_KNEESTINGER_IMMUNITY, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_ALCHEMYKNOWLEDGE, TRAIT_GENERIC)
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_spells(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
