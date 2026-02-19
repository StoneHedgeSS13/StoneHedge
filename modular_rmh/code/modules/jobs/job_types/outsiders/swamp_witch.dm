/datum/job/swamp_witch
	title = "Swamp Witch"
	tutorial = "A reclusive spellcaster living in the misty swamps near the Dark Forest. \
	She forages rare herbs, brews potent potions, and tends to her cauldron by day, \
	offering aid — or a cup of tea — to passing adventurers."
	department_flag = OUTSIDERS
	faction = FACTION_NEUTRAL
	total_positions = 1
	spawn_positions = 1
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_SWAMP_WITCH

	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	allowed_races = ALL_RACES_LIST
	allowed_sexes = list(FEMALE)

	selection_color = JCOLOR_OUTSIDERS
	advclass_cat_rolls = list(CAT_SWAMP_WITCH = 20)
	give_bank_account = 30

	job_subclasses = list(
		/datum/job/advclass/swamp_witch/alchemist,
		/datum/job/advclass/swamp_witch/cinder,
		/datum/job/advclass/swamp_witch/hex,
		/datum/job/advclass/swamp_witch/wild,
	)

	exp_types_granted = list(EXP_TYPE_MAGICK)


/datum/job/swamp_witch/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	var/holder = spawned.patron?.devotion_holder
	if(holder)
		var/datum/devotion/devotion = new holder()
		devotion.make_cleric()
		devotion.grant_to(spawned)

//SUBCLASSES
/datum/job/advclass/swamp_witch/alchemist
	title = "Alchemist Witch"
	tutorial = "You practice witchcraft through brews, tinctures, and mutagenic concoctions. \
	Your power simmers in cauldrons rather than spellbooks."

	outfit = /datum/outfit/swamp_witch/alchemist
	category_tags = list(CAT_SWAMP_WITCH)

	magic_user = TRUE
	spell_points = 20
	attunements_max = 5
	attunements_min = 1

	jobstats = list(
		STATKEY_INT = 3,
		STATKEY_PER = 1,
		STATKEY_SPD = -1
	)

	skills = list(
		/datum/skill/craft/alchemy = 4,
		/datum/skill/magic/arcane = 2,
		/datum/skill/misc/medicine = 3,
		/datum/skill/labor/farming = 3,
		/datum/skill/misc/reading = 3,
	)

	traits = list(
		TRAIT_GOODLOVER,
		TRAIT_BEAUTIFUL,
		TRAIT_FORAGER,
		TRAIT_LEGENDARY_ALCHEMIST,
	)

	spells = list(
		/datum/action/cooldown/spell/undirected/shapeshift/crow,
		/datum/action/cooldown/spell/undirected/touch/prestidigitation,
		/datum/action/cooldown/spell/undirected/conjure_item/light,
		/datum/action/cooldown/spell/healing,
		/datum/action/cooldown/spell/healing/greater,
		/datum/action/cooldown/spell/essence/toxic_cleanse,
		/datum/action/cooldown/spell/essence/purify_water,
		/datum/action/cooldown/spell/essence/neutralize,
		/datum/action/cooldown/spell/status/guidance,
		/datum/action/cooldown/spell/status/haste,
		/datum/action/cooldown/spell/undirected/conjure_item/poison_bomb,
		/datum/action/cooldown/spell/undirected/conjure_item/aphrodisiac_bomb,
		/datum/action/cooldown/spell/undirected/conjure_item/destroy_clothes_bomb,
		/datum/action/cooldown/spell/undirected/conjure_item/sleeping_bomb,
		/datum/action/cooldown/spell/projectile/acid_splash,
	)

/datum/outfit/swamp_witch/alchemist
	name = "Alchemist Witch"
	head = /obj/item/clothing/head/wizhat/witch
	mask = null
	neck = null
	cloak = /obj/item/clothing/cloak/cape/colored/wizard
	armor = null
	shirt = /obj/item/clothing/shirt/dress/gen/sexy/colored/black
	wrists = null
	gloves = /obj/item/clothing/gloves/leather/thaumgloves
	pants = null
	shoes = /obj/item/clothing/shoes/heels
	backr = null
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather
	beltl = null
	beltr = null
	ring = /obj/item/clothing/ring/active/nomag
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/scrying = 1,
		/obj/item/chalk = 1,
		/obj/item/reagent_containers/glass/bottle/killersice = 1,
		/obj/item/book/granter/spellbook/adept = 1,
		/obj/item/weapon/knife/dagger/silver/arcyne = 1,
		/obj/item/storage/belt/pouch/coins/mid,
		/obj/item/reagent_containers/glass/bottle/beer/emberwine,
	)

/datum/outfit/swamp_witch/alchemist/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)

// ─────────────────────────────

/datum/job/advclass/swamp_witch/cinder
	title = "Cinder Witch"
	tutorial = "You channel destructive rites of flame and ash. \
	Fire listens to you — sometimes eagerly, sometimes hungrily."

	outfit = /datum/outfit/swamp_witch/cinder
	category_tags = list(CAT_SWAMP_WITCH)

	magic_user = TRUE
	spell_points = 30
	attunements_max = 10
	attunements_min = 5

	jobstats = list(
		STATKEY_END = 2,
		STATKEY_INT = 1,
		STATKEY_END = 1
	)

	skills = list(
		/datum/skill/magic/arcane = 3,
		/datum/skill/misc/athletics = 2,
		/datum/skill/misc/climbing = 2,
		/datum/skill/combat/knives = 1,
		/datum/skill/combat/whipsflails = 2,
	)

	traits = list(
		TRAIT_GOODLOVER,
		TRAIT_BEAUTIFUL,
		TRAIT_NOFIRE,
	)

	spells = list(
		/datum/action/cooldown/spell/undirected/touch/prestidigitation,
		/datum/action/cooldown/spell/undirected/conjure_item/light,
		/datum/action/cooldown/spell/status/guidance,
		/datum/action/cooldown/spell/essence/silence,
		/datum/action/cooldown/spell/essence/toxic_cleanse,
		/datum/action/cooldown/spell/aoe/snuff,
		/datum/action/cooldown/spell/essence/spark,
		/datum/action/cooldown/spell/essence/flame_jet,
		/datum/action/cooldown/spell/conjure/bonfire,
		/datum/action/cooldown/spell/projectile/fire_flare,
		/datum/action/cooldown/spell/projectile/fireball,
	)

/datum/outfit/swamp_witch/cinder
	name = "Cinder Witch"
	head = /obj/item/clothing/head/desert_sorceress
	mask = null
	neck = null
	cloak = null
	armor = null
	shirt = /obj/item/clothing/shirt/undershirt/desert_sorceress
	wrists = null
	gloves = /obj/item/clothing/gloves/leather
	pants = /obj/item/clothing/pants/loincloth/desert_sorceress
	shoes = /obj/item/clothing/shoes/heels
	backr = null
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather
	beltl = /obj/item/weapon/whip
	beltr = null
	ring = /obj/item/clothing/ring/active/nomag
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/scrying = 1,
		/obj/item/chalk = 1,
		/obj/item/reagent_containers/glass/bottle/killersice = 1,
		/obj/item/book/granter/spellbook/adept = 1,
		/obj/item/weapon/knife/dagger/silver/arcyne = 1,
		/obj/item/storage/belt/pouch/coins/mid,
	)

/datum/outfit/swamp_witch/cinder/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)

// ─────────────────────────────

/datum/job/advclass/swamp_witch/hex
	title = "Hex Witch"
	tutorial = "You weave curses, misfortune, and binding words. \
	Your magic clings, lingers, and festers long after the spell is spoken."

	outfit = /datum/outfit/swamp_witch/hex
	category_tags = list(CAT_SWAMP_WITCH)

	magic_user = TRUE
	spell_points = 30
	attunements_max = 10
	attunements_min = 5

	jobstats = list(
		STATKEY_END = 3,
		STATKEY_INT = 1,
		STATKEY_STR = -1
	)

	skills = list(
		/datum/skill/magic/arcane = 3,
		/datum/skill/misc/sneaking = 2,
		/datum/skill/misc/reading = 2,
		/datum/skill/combat/knives = 1
	)

	traits = list(
		TRAIT_GOODLOVER,
		TRAIT_BEAUTIFUL,
	)

	spells = list(
		/datum/action/cooldown/spell/undirected/shapeshift/crow,
		/datum/action/cooldown/spell/undirected/touch/prestidigitation,
		/datum/action/cooldown/spell/undirected/conjure_item/light,
		/datum/action/cooldown/spell/status/guidance,
		/datum/action/cooldown/spell/essence/silence,
		/datum/action/cooldown/spell/essence/neutralize,
		/datum/action/cooldown/spell/find_flaw,
		/datum/action/cooldown/spell/cone/staggered/eldritch_blast,
		/datum/action/cooldown/spell/status/infestation,
		/datum/action/cooldown/spell/mimicry,
		/datum/action/cooldown/spell/aoe/on_turf/ensnare,
		/datum/action/cooldown/spell/conjure/web,
		/datum/action/cooldown/spell/enchantment/green_flame,
		/datum/action/cooldown/spell/enrapture,
		/datum/action/cooldown/spell/forced_orgasm,
	)

/datum/outfit/swamp_witch/hex
	name = "Hex Witch"
	head = /obj/item/clothing/head/wizhat/witch
	mask = null
	neck = null
	cloak = null
	armor = null
	shirt = /obj/item/clothing/shirt/undershirt/witch_cloth
	wrists = /obj/item/clothing/wrists/goldbracelet
	gloves = /obj/item/clothing/gloves/leather
	pants = null
	shoes = /obj/item/clothing/shoes/anklets
	backr = null
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/cloth/lady
	beltl = null
	beltr = null
	ring = /obj/item/clothing/ring/active/nomag
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/scrying = 1,
		/obj/item/chalk = 1,
		/obj/item/reagent_containers/glass/bottle/killersice = 1,
		/obj/item/book/granter/spellbook/adept = 1,
		/obj/item/weapon/knife/dagger/silver/arcyne = 1,
		/obj/item/storage/belt/pouch/coins/mid,
	)

/datum/outfit/swamp_witch/hex/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)

// ─────────────────────────────

/datum/job/advclass/swamp_witch/wild
	title = "Wild Magic Witch"
	tutorial = "You harness the raw, untamed currents of magic. \
	Spells you cast can have unpredictable side effects, ranging from minor quirks to chaotic surges. \
	Caution and improvisation are your allies — and your enemies."

	outfit = /datum/outfit/swamp_witch/wild
	category_tags = list(CAT_SWAMP_WITCH)

	magic_user = TRUE
	spell_points = 25
	attunements_max = 10
	attunements_min = 5

	jobstats = list(
		STATKEY_END = 2,
		STATKEY_INT = 2,
		STATKEY_PER = 1
	)

	skills = list(
		/datum/skill/magic/arcane = 3,
		/datum/skill/misc/reading = 2,
		/datum/skill/misc/athletics = 1
	)

	traits = list(
		TRAIT_GOODLOVER,
		TRAIT_BEAUTIFUL,
		TRAIT_WILDMAGIC,
	)

	spells = list(
		/datum/action/cooldown/spell/undirected/shapeshift/crow,
		/datum/action/cooldown/spell/undirected/touch/prestidigitation,
		/datum/action/cooldown/spell/undirected/conjure_item/light,
		/datum/action/cooldown/spell/status/guidance,
		/datum/action/cooldown/spell/essence/silence,
		/datum/action/cooldown/spell/essence/neutralize,
		/datum/action/cooldown/spell/mimicry,
	)

/datum/outfit/swamp_witch/wild
	name = "Wild Magic Witch"
	head = /obj/item/clothing/head/wizhat/witch
	mask = null
	neck = null
	cloak = /obj/item/clothing/cloak/cape/colored/wizard
	armor = /obj/item/clothing/armor/corset
	shirt = /obj/item/clothing/shirt/undershirt/lowcut
	wrists = null
	gloves = /obj/item/clothing/gloves/leather
	pants = /obj/item/clothing/pants/skirt/colored/black
	shoes = /obj/item/clothing/shoes/nobleboot/thighboots
	backr = null
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather
	beltl = null
	beltr = null
	ring = /obj/item/clothing/ring/active/nomag
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/scrying = 1,
		/obj/item/chalk = 1,
		/obj/item/reagent_containers/glass/bottle/killersice = 1,
		/obj/item/book/granter/spellbook/adept = 1,
		/obj/item/weapon/knife/dagger/silver/arcyne = 1,
		/obj/item/storage/belt/pouch/coins/mid,
	)

/datum/outfit/swamp_witch/wild/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)
