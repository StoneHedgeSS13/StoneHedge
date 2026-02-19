/datum/job/advclass/combat/adventurer_rogue/antiquarian
	title = "Shadow Antiquarian"
	tutorial = "A streetwise antiquarian, skilled in stealth, subterfuge, and minor magics, \
	who recovers relics and secrets from Faerûn's alleys and ruins."

	outfit = /datum/outfit/adventurer_rogue/antiquarian
	category_tags = list(CAT_ADVENTURER_ROGUE)
	give_bank_account = TRUE

// The idea is that they're a slippery bastard. Cantrip focused, stealth-focused. They rely on their spells.
	languages = list(/datum/language/thievescant)

	skills = list(
		/datum/skill/combat/axesmaces = SKILL_LEVEL_JOURNEYMAN, // Needed just for NPC's.
		/datum/skill/misc/swimming = SKILL_LEVEL_MASTER,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_EXPERT, // They're not meant to kill.
		/datum/skill/misc/climbing = SKILL_LEVEL_MASTER,
		/datum/skill/craft/crafting = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/reading = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/sneaking = SKILL_LEVEL_LEGENDARY,
		/datum/skill/misc/stealing = SKILL_LEVEL_LEGENDARY,
		/datum/skill/misc/lockpicking = SKILL_LEVEL_MASTER,
		/datum/skill/misc/sewing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/bombs = SKILL_LEVEL_JOURNEYMAN // To craft Smoke Bombs.
	)

	traits = list(
		TRAIT_DEADNOSE,
		TRAIT_THIEVESGUILD,
		TRAIT_DODGEEXPERT,
		TRAIT_LIGHT_STEP
	)

	jobstats = list(
		STATKEY_CON = -1,
		STATKEY_END = -1,
		STATKEY_STR = -2 // These are all relatively low, the class requires cantrips to work around these.
	)

	spells = list(
		/datum/action/cooldown/spell/undirected/conjure_item/smoke_bomb,
		/datum/action/cooldown/spell/undirected/adrenalinerush,
		/datum/action/cooldown/spell/undirected/secondsight,
		/datum/action/cooldown/spell/undirected/jaunt/ethereal_jaunt,
		/datum/action/cooldown/spell/undirected/conjure_item/summon_lockpick,
		/datum/action/cooldown/spell/projectile/flashpowder,
		/datum/action/cooldown/spell/aoe/snuff,
		/datum/action/cooldown/spell/undirected/conjure_item/calling_card
	)


/datum/outfit/adventurer_rogue/antiquarian
	name = "Shadow Antiquarian"
	head = /obj/item/clothing/head/roguehood/faceless
	mask = /obj/item/clothing/face/antiq
	neck = /obj/item/clothing/neck/coif
	cloak = /obj/item/clothing/cloak/raincloak/colored/mortus
	armor = /obj/item/clothing/armor/leather/splint
	shirt = /obj/item/clothing/shirt/tunic/colored/purple
	wrists = null
	gloves = /obj/item/clothing/gloves/bandages/pugilist
	pants = /obj/item/clothing/pants/trou/leather
	shoes = /obj/item/clothing/shoes/boots/leather
	backr = /obj/item/storage/backpack/satchel
	backl = null
	belt = /obj/item/storage/belt/leather/black/adventurers_subclasses
	beltl = /obj/item/weapon/mace/cudgel
	beltr = null
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/lockpick = 1,
		/obj/item/grapplinghook = 1,
		/obj/item/reagent_containers/glass/bottle/stronghealthpot = 1,
	)

/datum/outfit/adventurer_rogue/antiquarian/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)

/datum/job/advclass/combat/adventurer_rogue/antiquarian/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	if(alert("Do you wish for a random title? You will not receive one if you click No.", "", "Yes", "No") == "Yes")
		var/prev_real_name = spawned.real_name
		var/prev_name = spawned.name
		var/title
		var/list/titles = list("The Keeper", "The Phantom", "The Crow", "The Raven", "The Magpie", "The Courier", "The Mask", "The Shadow", "The Ghost", "The Fence", "The Intruder", "The Infiltrator", "The Filcher", "The Grifter", "He Who Walks", "The Invisible", "The Watcher", "The Master Thief", "The Dark Project", "The Lurker", "Prince of Shadows", "The Night Watch", "The Antiquarian", "Acquisitions Expert", "Cleptologist", "The Specialist", "The Stalker", "Of Deadly Shadows", "The Trickster", "The Respectable Citizen", "The Locksmith", "The Acquirer", "The Collector", "The Skeleton Key", "The Art Critic", "Recovery Specialist" ) //Dude, Trust.
		title = pick(titles)
		spawned.real_name = "[prev_real_name], [title]"
		spawned.name = "[prev_name], [title]"
