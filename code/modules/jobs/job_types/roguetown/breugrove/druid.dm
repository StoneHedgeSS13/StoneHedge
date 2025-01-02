/datum/job/roguetown/druid
	title = "Druid"
	f_title = "Druidess"
	flag = DRUID
	department_flag = GROVE
	faction = "Station"
	total_positions = 5
	spawn_positions = 5

	allowed_sexes = list(MALE, FEMALE)
	spells = list (
		/obj/effect/proc_holder/spell/invoked/diagnose/secular,
		/obj/effect/proc_holder/spell/targeted/shapeshift,
		/obj/effect/proc_holder/spell/aoe_turf/conjure/Wolf,
		/obj/effect/proc_holder/spell/invoked/infestation5e,
		/obj/effect/proc_holder/spell/self/primalsavagery5e,)
	allowed_races = RACES_ALL_KINDSPLUS
	outfit = /datum/outfit/job/roguetown/druid
	tutorial = "You are a Druid of the Breuddwyd Grove, a sacred keeper of both natural and traditional law. Drawing power from the ancient spirits of the land, you maintain harmony between civilization and wilderness. As one of the Grove's spiritual authorities and Town's legal authorities, you interpret the wisdom written in both legal scrolls and forest leaves. Your judgments flow from the eternal laws of nature - as a stream shapes the stones, so too does justice shape society. While wielding primal magic and communing with beasts, your paramount duty is to preserve balance: mediating between town and wild, settling disputes through ancient rites, and ensuring both human law and nature's code are respected. Like the great oak that bridges earth and sky, you stand between the ordered realm of civilization and the raw power of the wilderness, drawing wisdom from both to maintain the sacred harmony."

	display_order = JDO_DRUID
	give_bank_account = 400
	min_pq = 10
	max_pq = null

/datum/outfit/job/roguetown/druid
	name = "Druid"
	jobtype = /datum/job/roguetown/druid
	allowed_patrons = list(/datum/patron/divine/sylvarn)

/datum/job/roguetown/druid/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
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

/datum/outfit/job/roguetown/druid/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/boots/forestershoes
	pants = /obj/item/clothing/under/roguetown/loincloth/brown
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/rogueweapon/whip/druidic
	beltr = /obj/item/flashlight/flare/torch/lantern
	backl = /obj/item/storage/backpack/rogue/satchel
	backr = /obj/item/rogueweapon/woodstaff/wise
	head = /obj/item/clothing/head/roguetown/antlerhood
	neck = /obj/item/clothing/neck/roguetown/psicross/dendor/grove
	gloves = /obj/item/clothing/gloves/roguetown/leather/advanced
	cloak = /obj/item/clothing/cloak/templar/dendor
	armor = /obj/item/clothing/suit/roguetown/armor/leather/hide
	shirt = /obj/item/clothing/suit/roguetown/shirt/robe/dendor
	backpack_contents = list(
		/obj/item/rogueweapon/sickle = 1,
		/obj/item/reagent_containers/glass/bottle/rogue/antipoisonpot = 1,
		/obj/item/reagent_containers/glass/bottle/rogue/majorhealthpot = 1,
		/obj/item/roguekey/grove = 1,
		/obj/item/rogueweapon/huntingknife/skin = 1,
	)
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)

		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/magic/druidic, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 4, TRUE)

		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/labor/farming, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 3, TRUE)

		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/druidic, 2, TRUE)
		H.change_stat("intelligence", 4)
		H.change_stat("wisdom", 4)
		H.change_stat("perception", 2)
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
