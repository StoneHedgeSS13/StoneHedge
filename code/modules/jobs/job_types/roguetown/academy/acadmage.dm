/datum/job/roguetown/acadmage
	title = "Academy Mage"
	tutorial = "You are one of the Mages of Dreamkeep's Magick Academy; Ravenloft. Your priority is to teach the Apprentices in the Academy and discover new magical knowledge. \
		Having graduated from Apprentice Mage, you are expected to be a role model to the younger mages in the Academy. Your first responsibility is to the Academy. \
		Do not ruin your reputation by misusing your gifts or shirking your responsibilities."
	flag = ACADMAGE
	department_flag = ACADEMY
	selection_color = JCOLOR_ACADEMY
	faction = "Station"
	total_positions = 5
	spawn_positions = 5

	allowed_races = RACES_ALL_KINDSPLUS
	allowed_ages = ALL_AGES_LIST

	outfit = /datum/outfit/job/roguetown/acadmage
	spells = list (
		/obj/effect/proc_holder/spell/invoked/projectile/lightningbolt,
		/obj/effect/proc_holder/spell/aoe_turf/conjure/Wolf,
		/obj/effect/proc_holder/spell/invoked/projectile/fetch,
		/obj/effect/proc_holder/spell/targeted/touch/prestidigitation,
		/obj/effect/proc_holder/spell/targeted/forcewall,
		/obj/effect/proc_holder/spell/invoked/message)
	display_order = JDO_ACADMAGE
	min_pq = 5
	max_pq = null

/datum/outfit/job/roguetown/acadmage/pre_equip(mob/living/carbon/human/H)
	..()
	H.verbs += list(/mob/living/carbon/human/proc/magicreport, /mob/living/carbon/human/proc/magiclearn)
	cloak = /obj/item/clothing/suit/roguetown/shirt/robe/mageblue
	backr = /obj/item/storage/backpack/rogue/satchel
	belt =  /obj/item/storage/belt/rogue/leather/plaquesilver
	beltl = /obj/item/storage/keyring/mage
	beltr = /obj/item/storage/belt/rogue/pouch/coins/mid
	id = /obj/item/clothing/ring/keystone
	l_hand = /obj/item/class_selector/acadmage
	ADD_TRAIT(H, TRAIT_LEARNMAGIC, TRAIT_GENERIC)
