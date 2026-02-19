/datum/job/advclass/combat/adventurer_fighter/enforcer
	title = "Enforcer"
	tutorial = "Once feared enforcers along the Sword Coast, these warriors clad in black wield blade and shield with deadly precision, \
	parrying strikes to protect their allies and dominate the battlefield."

	outfit = /datum/outfit/adventurer_fighter/enforcer
	category_tags = list(CAT_ADVENTURER_FIGHTER)
	give_bank_account = TRUE

	jobstats = list(
		STATKEY_CON = 3,
		STATKEY_END = 2,
		STATKEY_PER = 1,
		STATKEY_INT = -1,
		STATKEY_SPD = -1,
	) //4 - Statline - The Idea is that they're tanky and supposed to be able to block hits for a longer time, hence higher CON and END

	skills = list(
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/climbing = 3,
		/datum/skill/misc/sneaking = 2,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/combat/swords = 3,
		/datum/skill/combat/shields = 3,
		/datum/skill/combat/knives = 2,
		/datum/skill/misc/reading = 1,
		/datum/skill/misc/athletics = 3,
		/datum/skill/misc/medicine = 2,
		/datum/skill/labor/mathematics = 3, //They use math to calculate the trajectory of attacks, so they can parry behind them, trust, ook told me
	)

	traits = list(
		TRAIT_NOPAINSTUN,
		TRAIT_BREADY,
		TRAIT_BLINDFIGHTING,
		TRAIT_UNDODGING, //They can't dodge at all. This also mean that if they don't have anything to parry with, they're done.
	)

/datum/outfit/adventurer_fighter/enforcer
	name = "Enforcer"
	var/is_leader = FALSE //does nothing except give you a cooler blade.

/datum/outfit/adventurer_fighter/enforcer/pre_equip(mob/living/carbon/human/H)
	shirt = /obj/item/clothing/shirt/undershirt/easttats
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	backr = /obj/item/storage/backpack/satchel
	if(H.gender == MALE)
		cloak = /obj/item/clothing/cloak/eastcloak1
		pants = /obj/item/clothing/pants/trou/leather/eastpants1
		armor = /obj/item/clothing/shirt/undershirt/eastshirt1
		gloves = /obj/item/clothing/gloves/eastgloves2
		shoes = /obj/item/clothing/shoes/boots
	else
		armor = /obj/item/clothing/armor/basiceast/captainrobe
		shoes = /obj/item/clothing/shoes/rumaclan


/datum/outfit/adventurer_fighter/enforcer/post_equip(mob/living/carbon/human/H, visuals_only)
	. = ..()
	if(prob(10) && !is_leader)
		is_leader = TRUE
		var/obj/item/weapon/sword/katana/mulyeog/rumacaptain/P = new(get_turf(src))
		H.equip_to_appropriate_slot(P)
		var/obj/item/weapon/scabbard/kazengun/gold/L = new(get_turf(src))
		H.equip_to_appropriate_slot(L)
	else
		var/obj/item/weapon/sword/katana/mulyeog/rumahench/P = new(get_turf(src))
		H.equip_to_appropriate_slot(P)
		var/obj/item/weapon/scabbard/kazengun/steel/L = new(get_turf(src))
		H.equip_to_appropriate_slot(L)
