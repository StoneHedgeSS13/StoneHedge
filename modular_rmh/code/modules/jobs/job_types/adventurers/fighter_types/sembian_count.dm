/datum/job/advclass/combat/adventurer_fighter/sembian_count
	title = "Sembian Count"
	tutorial = "A Sembian count of the eastern Heartlands, visiting on formal state business."

	outfit = /datum/outfit/adventurer_fighter/sembian_count
	category_tags = list(CAT_ADVENTURER_FIGHTER)
	give_bank_account = TRUE
	total_positions = 1

	jobstats = list(
		STATKEY_INT = 1,
		STATKEY_END = 2
	)

	skills = list(
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/climbing = 3,
		/datum/skill/misc/riding = 3,
		/datum/skill/misc/reading = 4,
		/datum/skill/misc/music = 1,
		/datum/skill/craft/cooking = 2,
		/datum/skill/combat/bows = 1,
		/datum/skill/combat/crossbows = 2,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/combat/swords = 3,
		/datum/skill/combat/knives = 2,
		/datum/skill/labor/mathematics = 3
	)

	traits = list(
		TRAIT_MEDIUMARMOR,
		TRAIT_NOBLE,
		TRAIT_FOREIGNER
	)

	spells = list(
		/datum/action/cooldown/spell/undirected/call_bird/grenzel
	)

/datum/job/advclass/combat/adventurer_fighter/sembian_count/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	var/prev_real_name = spawned.real_name
	var/prev_name = spawned.name
	var/honorary = "Count"
	if(spawned.pronouns == SHE_HER)
		honorary = "Countess"
	spawned.real_name = "[honorary] [prev_real_name]"
	spawned.name = "[honorary] [prev_name]"

/datum/outfit/adventurer_fighter/sembian_count
	name = "Sembian Count"
	head = /obj/item/clothing/head/helmet/skullcap/grenzelhoft
	mask = null
	neck = /obj/item/clothing/neck/gorget
	cloak = /obj/item/clothing/cloak/half/colored/random
	armor = /obj/item/clothing/armor/brigandine
	shirt = /obj/item/clothing/shirt/grenzelhoft
	wrists = null
	gloves = /obj/item/clothing/gloves/angle/grenzel
	pants = /obj/item/clothing/pants/grenzelpants
	shoes = /obj/item/clothing/shoes/rare/grenzelhoft
	backr = null
	backl = null
	belt = /obj/item/storage/belt/leather/plaquesilver/adventurers_subclasses
	beltl = /obj/item/weapon/sword/sabre/dec
	beltr = /obj/item/flashlight/flare/torch/lantern
	ring = /obj/item/clothing/ring/gold
	l_hand = null
	r_hand = null

	backpack_contents = list(/obj/item/storage/belt/pouch/coins/veryrich = 1)

/datum/outfit/adventurer_fighter/sembian_count/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	if(equipped_human.gender == FEMALE)
		armor = /obj/item/clothing/armor/gambeson/heavy/dress/alt
		beltl = /obj/item/weapon/sword/rapier/dec
