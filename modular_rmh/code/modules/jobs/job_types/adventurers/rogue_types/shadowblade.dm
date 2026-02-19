/datum/job/advclass/combat/adventurer_rogue/shadowblade
	title = "Shadowblade"
	tutorial = "Once enforcers of the Underdark, these drow now walk the surface as mercenaries, striking from shadows with deadly precision."

	allowed_races = list(SPEC_ID_DROW)
	outfit = /datum/outfit/adventurer_rogue/shadowblade
	category_tags = list(CAT_ADVENTURER_ROGUE)
	give_bank_account = TRUE

	skills = list(
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/climbing = 2,
		/datum/skill/misc/athletics = 2,
		/datum/skill/misc/sneaking = 1,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/combat/unarmed = 1,
		/datum/skill/combat/knives = 2,
		/datum/skill/misc/reading = 1,
		/datum/skill/misc/riding = 1,
	)

	traits = list(
		TRAIT_STEELHEARTED,
		TRAIT_MEDIUMARMOR,
		TRAIT_DODGEEXPERT,
	)


/datum/job/advclass/combat/adventurer_rogue/shadowblade/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	if(spawned.gender == FEMALE)
		// Female: melee defense-oriented brute
		spawned.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
		spawned.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
		spawned.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)

		spawned.adjust_stat_modifier(STATMOD_JOB, STATKEY_STR, 2)
		spawned.adjust_stat_modifier(STATMOD_JOB, STATKEY_CON, 1)
		spawned.adjust_stat_modifier(STATMOD_JOB, STATKEY_END, 1)
		spawned.adjust_stat_modifier(STATMOD_JOB, STATKEY_INT, -1)
		spawned.adjust_stat_modifier(STATMOD_JOB, STATKEY_SPD, -1)

	if(spawned.gender == MALE)
		// Male: squishy hit-and-runner
		spawned.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		spawned.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
		spawned.adjust_skillrank(/datum/skill/misc/lockpicking, 3, TRUE)
		spawned.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
		spawned.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		spawned.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		spawned.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		spawned.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		spawned.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		spawned.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		spawned.adjust_skillrank(/datum/skill/craft/traps, 3, TRUE)

		spawned.adjust_stat_modifier(STATMOD_JOB, STATKEY_END, 1)
		spawned.adjust_stat_modifier(STATMOD_JOB, STATKEY_PER, 2)
		spawned.adjust_stat_modifier(STATMOD_JOB, STATKEY_SPD, 2)

/datum/outfit/adventurer_rogue/shadowblade
	name = "Shadowblade"
	head = null
	mask = null
	neck = null
	cloak = null
	armor = null
	shirt = null
	wrists = null
	gloves = null
	pants = /obj/item/clothing/pants/trou/shadowpants
	shoes = /obj/item/clothing/shoes/boots
	backr = null
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/black/adventurers_subclasses
	beltl = null
	beltr = null
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/key/mercenary,
		/obj/item/storage/belt/pouch/coins/poor,
		/obj/item/weapon/knife/dagger/steel/dirk
	)

/datum/outfit/adventurer_rogue/shadowblade/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	if(equipped_human.gender == FEMALE)
		mask = /obj/item/clothing/face/facemask/shadowfacemask
		neck = /obj/item/clothing/neck/gorget
		armor = /obj/item/clothing/armor/cuirass/iron/shadowplate
		wrists = /obj/item/clothing/wrists/bracers/leather
		gloves = /obj/item/clothing/gloves/chain/iron/shadowgauntlets
		backr = /obj/item/weapon/shield/tower/spidershield
		beltr = /obj/item/weapon/whip/spiderwhip

	if(equipped_human.gender == MALE)
		mask = /obj/item/clothing/face/shepherd/shadowmask
		neck = /obj/item/clothing/neck/chaincoif/iron
		cloak = /obj/item/clothing/cloak/half/shadowcloak
		armor = /obj/item/clothing/armor/gambeson/shadowrobe
		shirt = /obj/item/clothing/shirt/shadowshirt
		gloves = /obj/item/clothing/gloves/fingerless/shadowgloves
		backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/short
		beltr = /obj/item/ammo_holder/quiver/arrows
		beltl = /obj/item/weapon/sword/sabre/stalker
		scabbards = list(/obj/item/weapon/scabbard/sword)
