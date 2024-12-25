/datum/job/roguetown/physician
	title = "Guild Physician"
	flag = PHYSICIAN
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2

	allowed_races = RACES_ALL_KINDSPLUS
	allowed_sexes = list(MALE, FEMALE)
	display_order = JDO_PHYSICIAN
	tutorial = "You were a child born into good wealth - But poor health. \
		Perhaps in another life, you would have turned out to be a powerful mage, wise archivist or a shrewd steward, \
		but leprosy took away your younger years. \
		Out of desperation, you followed the ways of Hermeir and managed to be cured."
	outfit = /datum/outfit/job/roguetown/physician
	whitelist_req = FALSE

	give_bank_account = 25
	min_pq = 5
	max_pq = null

	cmode_music = 'sound/music/combat_physician.ogg'

/datum/outfit/job/roguetown/physician
	name = "Physician"
	jobtype = /datum/job/roguetown/physician

/datum/outfit/job/roguetown/physician/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/roguehood/surghood
	mask = /obj/item/clothing/mask/rogue/feldmask
	neck = /obj/item/clothing/neck/roguetown/psicross/pestra
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/surgrobe
	shirt = /obj/item/clothing/suit/roguetown/shirt/vest
	gloves = /obj/item/clothing/gloves/roguetown/surggloves
	pants = /obj/item/clothing/under/roguetown/tights/black
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	belt = /obj/item/storage/belt/rogue/leather/black
	beltl = /obj/item/reagent_containers/glass/bottle/waterskin
	beltr = /obj/item/storage/keyring/physician
	id = /obj/item/clothing/ring/quartzs
	r_hand = /obj/item/rogueweapon/woodstaff
	backl = /obj/item/storage/backpack/rogue/backpack
	backpack_contents = list(
		/obj/item/reagent_containers/glass/alembic = 1,
		/obj/item/storage/fancy/ifak = 1,
		/obj/item/reagent_containers/glass/bottle/rogue/healthpot = 1,
		/obj/item/clothing/mask/rogue/physician = 1,
		/obj/item/storage/box/matches = 1, /// for carterizer and ring.
		/obj/item/flashlight/flare/torch/lantern/ring = 1, //lantern+
		/obj/item/storage/fancy/skit = 1,
	)
	ADD_TRAIT(H, TRAIT_EMPATH, "[type]")
	ADD_TRAIT(H, TRAIT_SELF_AWARE, "[type]") //can see exact numbers for diagnose
	ADD_TRAIT(H, TRAIT_NOSTINK, "[type]")
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 2, TRUE) //for the staff
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 6, TRUE)
		H.change_stat("intelligence", 2) /// bumped these up by one and added some con. I cant rework everyclass but this one made me sad.
		H.change_stat("fortune", 1)
		H.change_stat("constitution", 2) // regular health checks to self. I dunno man give em something. miricles already shits all over surgery healin.
		H.change_stat("speed", 2) // to get to the scene of injuries faster
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/docheal)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/stable)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/purge)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/debride)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/cpr)

