/obj/item/clothing/neck/roguetown
	name = "necklace"
	desc = ""
	icon = 'icons/roguetown/clothing/neck.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/neck.dmi'
	bloody_icon_state = "bodyblood"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/clothing/neck/roguetown/coif
	name = "coif"
	icon_state = "coif"
	item_state = "coif"
	flags_inv = HIDEHAIR
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_HEAD
	blocksound = SOFTHIT
	body_parts_covered = NECK|HAIR|EARS|HEAD
	armor = list("blunt" = 33, "slash" = 12, "stab" = 22, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT)
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE
	sewrepair = TRUE

/obj/item/clothing/neck/roguetown/coif/AdjustClothes(mob/user)
	if(loc == user)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			if(toggle_icon_state)
				icon_state = "[initial(icon_state)]_t"
			flags_inv = null
			body_parts_covered = NECK
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_neck()
				H.update_inv_head()
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			flags_inv = HIDEHAIR
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_neck()
					H.update_inv_head()

/obj/item/clothing/neck/roguetown/shawl
	name = "shawl"
	desc = "A shawl worn by those who inhabit the deserts to help keep the sun off their heads."
	icon_state = "shawl"
	item_state = "shawl"
	flags_inv = HIDEEARS|HIDEHAIR
	slot_flags = ITEM_SLOT_NECK
	blocksound = SOFTHIT
	body_parts_covered = NECK|HAIR|EARS|HEAD
	armor = list("blunt" = 33, "slash" = 12, "stab" = 22, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT)
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE
	sewrepair = TRUE

/obj/item/clothing/neck/roguetown/shawl/AdjustClothes(mob/user)
	if(loc == user)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			if(toggle_icon_state)
				icon_state = "[initial(icon_state)]_t"
			flags_inv = null
			body_parts_covered = NECK
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_neck()
				H.update_inv_head()
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			flags_inv = HIDEEARS|HIDEHAIR
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_neck()
					H.update_inv_head()

/obj/item/clothing/neck/roguetown/chaincoif
	name = "steel chain coif"
	icon_state = "chaincoif"
	item_state = "chaincoif"
	flags_inv = HIDEHAIR
	resistance_flags = FIRE_PROOF
	armor = list("blunt" = 30, "slash" = 60, "stab" = 45, "bullet" = 10, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

	max_integrity = 200
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_HEAD
	body_parts_covered = NECK|HAIR|EARS|HEAD
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT)
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE
	blocksound = CHAINHIT
	anvilrepair = /datum/skill/craft/blacksmithing
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/neck/roguetown/chaincoif/AdjustClothes(mob/user)
	if(loc == user)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			if(toggle_icon_state)
				icon_state = "[initial(icon_state)]_t"
			flags_inv = null
			body_parts_covered = NECK
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_neck()
				H.update_inv_head()
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			flags_inv = HIDEHAIR
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_neck()
					H.update_inv_head()


/obj/item/clothing/neck/roguetown/chaincoif/iron
	name = "iron chain coif"
	icon_state = "ichaincoif"
	anvilrepair = /datum/skill/craft/blacksmithing
	smeltresult = /obj/item/ingot/iron
	max_integrity = 150

/obj/item/clothing/neck/roguetown/bervor
	name = "bervor"
	desc = "A steel bervor designed to protect the neck."
	icon_state = "bervor"
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	anvilrepair = /datum/skill/craft/blacksmithing
	smeltresult = /obj/item/ingot/steel
	max_integrity = 300
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_NECK
	body_parts_covered = NECK|EARS|MOUTH|NOSE
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = PLATEHIT

/obj/item/clothing/neck/roguetown/gorget
	name = "gorget"
	desc = "An iron gorget to protect the neck."
	icon_state = "gorget"
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	smeltresult = /obj/item/ingot/iron
	anvilrepair = /datum/skill/craft/blacksmithing
	max_integrity = 150
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_NECK
	body_parts_covered = NECK
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = PLATEHIT
	clothing_flags = CANT_SLEEP_IN

/obj/item/clothing/neck/roguetown/gorget/leather
	name = "hardened leather gorget"
	desc = "Sturdy, durable, flexible. Will protect your neck from some good lumbering."
	icon_state = "lgorget"
	armor = list("blunt" = 70, "slash" = 60, "stab" = 30, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 150
	slot_flags = ITEM_SLOT_NECK
	body_parts_covered = NECK
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST) //This one will help against chopping
	blocksound = SOFTHIT
	sewrepair = TRUE
	smeltresult = null
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide/cured
	clothing_flags = null

/obj/item/clothing/neck/roguetown/gorget/studdedleather
	name = "studded leather gorget"
	desc = "Sturdy, durable, flexible. Will protect your neck from some good lumbering and stabs."
	icon_state = "lgorget"
	armor = list("blunt" = 100, "slash" = 80, "stab" = 70, "bullet" = 80, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 200
	slot_flags = ITEM_SLOT_NECK
	body_parts_covered = NECK
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST) //being stabbed in the neck sucks.
	blocksound = SOFTHIT
	sewrepair = TRUE
	smeltresult = null
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide/cured
	clothing_flags = null

/obj/item/clothing/neck/roguetown/gorget/servant
	name = "enchanted servant collar"
	desc = "This collar makes me obligated to heed to orders from the citizens of the Town, and restricts my movements..."

/obj/item/clothing/neck/roguetown/gorget/servant/equipped(mob/living/carbon/human/user, slot)
	. = ..()
	if(!(src in user.held_items))
		ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)

/obj/item/clothing/neck/roguetown/gorget/servant/equipped(mob/living/carbon/human/user, slot)
	. = ..()
	if(slot == SLOT_NECK)
		ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)
		ADD_TRAIT(user, TRAIT_PACIFISM, CURSED_ITEM_TRAIT)
		user.visible_message(span_warning("[user] is bound by the collar's enchantment."), \
			span_warning("This collar makes me heed to orders from the citizens of the Town, unless those orders will result in self harm, forced sexual interactions, or orders that will indirectly or directly harm the town or its population. It also restricts my movement."))
		to_chat(user, span_alert("Roleplay accordingly to your collar's effects."))

/obj/item/clothing/neck/roguetown/gorget/servant/canStrip(mob/living/carbon/human/stripper, mob/living/carbon/human/owner)
	if(stripper.job in list("Great Druid", "Druid", "Druidess", "Great Druidess", "Hedge Warden", "Hedge Knight", "Ovate"))
		REMOVE_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)
		return TRUE
	return FALSE

/obj/item/clothing/neck/roguetown/gorget/servant/dropped(mob/user)
	. = ..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/prisoner = user
	if(prisoner.get_item_by_slot(SLOT_NECK) != src)
		REMOVE_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)
		REMOVE_TRAIT(user, TRAIT_PACIFISM, CURSED_ITEM_TRAIT)


/obj/item/clothing/neck/roguetown/gorget/servant/imprisoned
	name = "enchanted prisoner collar"
	desc = "This collar makes me obligated to heed to orders from anyone, and restricts my movements..."

/obj/item/clothing/neck/roguetown/gorget/servant/imprisoned/equipped(mob/living/carbon/human/user, slot)
	. = ..()
	if(slot == SLOT_NECK)
		user.visible_message(span_warning("[user] is bound by the collar's enchantment."), \
			span_warning("This collar makes me heed to orders from anyone, unless those orders will result in self harm or forced sexual interactions."))
		to_chat(user, span_alert("Roleplay accordingly to your collar's effects."))



/obj/item/clothing/neck/roguetown/psicross
	name = "divine Symbol"
	desc = "This focus allows for divine practitioners to ask for favor and channel it."
	icon_state = "psicross"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_HIP|ITEM_SLOT_WRISTS
	sellprice = 10
	experimental_onhip = TRUE
	anvilrepair = /datum/skill/craft/blacksmithing

/obj/item/clothing/neck/roguetown/psicross/astrata
	name = "Amulet of the Sun"
	desc = "It glistens with a sheen like the Dragons above."
	icon_state = "astrata"

/obj/item/clothing/neck/roguetown/psicross/noc
	name = "amulet of Moon"
	desc = "It sparkles with a sheen like the Dragons above."
	icon_state = "noc"

/obj/item/clothing/neck/roguetown/psicross/dendor
	name = "amulet of Nature"
	desc = "The nature spirits are said to favor those who wear this trinket."
	icon_state = "dendor"

/obj/item/clothing/neck/roguetown/psicross/necra
	name = "amulet of Death"
	desc = "She watches her faithful with cold eyes."
	icon_state = "necra"

/obj/item/clothing/neck/roguetown/psicross/ravox
	name = "amulet of Battle"
	desc = "His blades of flame dance the inferno that unbinds the mortal soul."
	icon_state = "ravox"

/obj/item/clothing/neck/roguetown/psicross/eora
	name = "amulet of Love"
	desc = "Said to be held close to their acolytes hearts."
	icon_state = "eora"

/obj/item/clothing/neck/roguetown/psicross/pestra
	name = "amulet of Medicine"
	desc = "Worn by those who know the arts of preservation and perseverance."
	icon_state = "pestra"

/obj/item/clothing/neck/roguetown/psicross/xylix
	name = "amulet of Arts"
	desc = "Worn by Harlequins and Musicians alike."
	icon_state = "xylix"

/obj/item/clothing/neck/roguetown/psicross/malum
	name = "amulet of the Forge"
	desc = "Favored by those of the forge."
	icon_state = "malum"

/obj/item/clothing/neck/roguetown/psicross/ravox
	name = "amulet of Battle"
	desc = "A symbol of the eternal dance."
	icon_state = "ravox"

/obj/item/clothing/neck/roguetown/psicross/abyssor
	name = "amulet of Tides"
	desc = "Those who call to the tides wear this symbol."
	icon_state = "abyssor"

/obj/item/clothing/neck/roguetown/psicross/wood
	name = "wooden divine symbol"
	icon_state = "psicrossw"
	sellprice = 0

/obj/item/clothing/neck/roguetown/psicross/talisman
	name = "divine Talisman"
	icon_state = "talisman"
	sellprice = 0

/obj/item/clothing/neck/roguetown/psicross/silver
	name = "silver divine symbol"
	icon_state = "psicrossiron"
	sellprice = 50

/obj/item/clothing/neck/roguetown/psicross/silver/pickup(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	if(!H.mind)
		return
	var/datum/antagonist/vampirelord/V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
	var/datum/antagonist/werewolf/W = H.mind.has_antag_datum(/datum/antagonist/werewolf/)
	if(ishuman(H))
		if(H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			to_chat(H, span_userdanger("I can't pick up the silver, it is my BANE!"))
			H.Knockdown(20)
			H.adjustFireLoss(60)
			H.Paralyze(20)
			H.fire_act(1,5)
		if(V_lord)
			if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
				to_chat(H, span_userdanger("I can't pick up the silver, it is my BANE!"))
				H.Knockdown(10)
				H.Paralyze(10)
		if(W && W.transformed == TRUE)
			to_chat(H, span_userdanger("I can't equip the silver, it is my BANE!"))
			H.Knockdown(20)
			H.Paralyze(20)

/obj/item/clothing/neck/roguetown/psicross/silver/mob_can_equip(mob/living/M, mob/living/equipper, slot, disable_warning = FALSE, bypass_equip_delay_self = FALSE)
	. = ..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(!H.mind)
			return TRUE
		var/datum/antagonist/vampirelord/V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
		var/datum/antagonist/werewolf/W = H.mind.has_antag_datum(/datum/antagonist/werewolf/)
		if(H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			to_chat(H, span_userdanger("I can't equip the silver, it is my BANE!"))
			H.Knockdown(20)
			H.adjustFireLoss(60)
			H.Paralyze(20)
			H.fire_act(1,5)
		if(V_lord)
			if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
				to_chat(H, span_userdanger("I can't equip the silver, it is my BANE!"))
				H.Knockdown(10)
				H.Paralyze(10)
		if(W && W.transformed == TRUE)
			to_chat(H, span_userdanger("I can't equip the silver, it is my BANE!"))
			H.Knockdown(20)
			H.Paralyze(20)

/obj/item/clothing/neck/roguetown/psicross/g
	name = "golden divine symbol"
	desc = "This symbol is made from gold, known to be favored for its conductive properties."
	icon_state = "psicrossg"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	sellprice = 100

/obj/item/clothing/neck/roguetown/talkstone
	name = "talkstone"
	desc = ""
	icon_state = "talkstone"
	item_state = "talkstone"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	allowed_race = CLOTHED_RACES_TYPES
	sellprice = 98
	anvilrepair = /datum/skill/craft/blacksmithing

/obj/item/clothing/neck/roguetown/horus
	name = "all-seeing eye"
	desc = "This amulet can see the true worth of things. Said to be gifted by she who knows."
	icon_state = "horus"
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_HIP|ITEM_SLOT_WRISTS
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	sellprice = 30
	anvilrepair = /datum/skill/craft/blacksmithing

/obj/item/clothing/neck/roguetown/shalal
	name = "desert rider medal"
	desc = ""
	icon_state = "shalal"
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_HIP|ITEM_SLOT_WRISTS
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	sellprice = 15
	anvilrepair = /datum/skill/craft/blacksmithing

/obj/item/clothing/neck/roguetown/collar/feldcollar
	name = "high collar"
	desc = "A high collar which covers half the face up to the nose."
	icon_state = "feldcollar"
	flags_inv = HIDEFACE|HIDEFACIALHAIR

/obj/item/clothing/neck/roguetown/collar/surgcollar
	name = "high collar"
	desc = "A high collar which covers half the face up to the nose."
	icon_state = "surgcollar"
	flags_inv = HIDEFACE|HIDEFACIALHAIR

/obj/item/clothing/neck/roguetown/mantle/wizardmantle
	name = "wizard mantle"
	desc = "A short cloak worn around the neck of wizards, typically those who specialize in water magics."
	icon_state = "wizardmantle"

/obj/item/clothing/neck/roguetown/nephilbervor
	name = "nephilim neckguard"
	desc = "An neckguard once worn by the descendents of giants."
	icon_state = "nephilimneckguard"
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	anvilrepair = /datum/skill/craft/blacksmithing
	smeltresult = /obj/item/ash
	max_integrity = 350
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_NECK
	body_parts_covered = NECK|MOUTH
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = PLATEHIT

/obj/item/clothing/neck/roguetown/psicross/ornate
	name = "ornate amulet"
	desc = ""
	icon_state = "ornate"
	item_state = "ornate"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	sellprice = 150

/obj/item/clothing/neck/roguetown/psicross/skull
	name = "skull necklace"
	desc = ""
	icon_state = "skullnecklace"
	item_state = "skullnecklace"
	//dropshrink = 0.75
	sellprice = 1

/obj/item/clothing/neck/roguetown/psicross/gskull
	name = "golden skull necklace"
	desc = ""
	icon_state = "skullamulet"
	item_state = "skullamulet"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	sellprice = 100

/obj/item/clothing/neck/roguetown/slavecollar
	name = "slave collar"
	desc = ""
	icon_state = "bervor"
	color = "#ff8400ff"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_NECK
	sellprice = 10

/obj/item/clothing/neck/roguetown/luckcharm
	name = "luck charm"
	desc = "A rabbit's foot necklace. Some say it brings good luck."
	icon_state = "luckcharm"
	sellprice = 15
	slot_flags = ITEM_SLOT_NECK
	var/goodluckactivated = FALSE
/obj/item/clothing/neck/roguetown/luckcharm/equipped(mob/living/carbon/human/user, slot)
	. = ..()
	if(slot == SLOT_NECK)
		user.change_stat("fortune", 1) //how much luck stat it gives when equipped
		goodluckactivated = TRUE
	return
/obj/item/clothing/neck/roguetown/luckcharm/dropped(mob/living/carbon/human/user)
	. = ..()
	if(goodluckactivated == TRUE)
		user.change_stat("fortune", -1) //how much luck stat taken away when unequipped
		goodluckactivated = FALSE
	return
