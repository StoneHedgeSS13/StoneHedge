/obj/item/storage/belt/rogue
	name = ""
	desc = ""
	icon = 'icons/roguetown/clothing/belts.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/belts.dmi'
	icon_state = ""
	item_state = ""
	slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_NORMAL
	attack_verb = list("whips", "lashes")
	max_integrity = 300
	equip_sound = 'sound/blank.ogg'
	content_overlays = FALSE
	bloody_icon_state = "bodyblood"
	var/heldz_items = 3
	sewrepair = TRUE
	fiber_salvage = TRUE
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide/cured
	var/datum/wound/artery/artery_wound

/obj/item/storage/belt/rogue/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		STR.max_combined_w_class = 6
		STR.max_w_class = WEIGHT_CLASS_SMALL
		STR.max_items = heldz_items

/obj/item/storage/belt/rogue/attack_right(mob/user)
	var/datum/component/storage/CP = GetComponent(/datum/component/storage)
	if(CP)
		CP.rmb_show(user)
		return TRUE
	..()

/obj/item/storage/belt/rogue/leather
	name = "belt"
	desc = "A leather belt."
	icon_state = "leather"
	item_state = "leather"
	equip_sound = 'sound/blank.ogg'
	heldz_items = 3

/*/obj/item/storage/belt/rogue/leather/dropped(mob/living/carbon/human/user)
	..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		var/list/things = STR.contents()
		for(var/obj/item/I in things)
			STR.remove_from_storage(I, get_turf(src)) */ //this should stop belts from dropping stuff but isnt

/obj/item/storage/belt/rogue/leather/plaquegold
	name = "plaque belt"
	desc = "A belt with a golden plate on its front."
	icon_state = "goldplaque"
	sellprice = 50
	sewrepair = FALSE
	anvilrepair = /datum/skill/craft/blacksmithing

/obj/item/storage/belt/rogue/leather/shalal
	name = "shalal belt"
	icon_state = "shalal"
	sellprice = 5

/obj/item/storage/belt/rogue/leather/shalalz
	name = "zybantine shalal belt"
	icon_state = "shalal_z"
	sellprice = 5

/obj/item/storage/belt/rogue/leather/black
	name = "black belt"
	icon_state = "blackbelt"
	sellprice = 10

/obj/item/storage/belt/rogue/leather/plaquesilver
	name = "plaque belt"
	desc = "A belt with a silver plate on its front."
	icon_state = "silverplaque"
	sellprice = 30
	sewrepair = FALSE
	anvilrepair = /datum/skill/craft/blacksmithing

/obj/item/storage/belt/rogue/leather/hand
	name = "steel belt"
	desc = "A belt with a steel plate on its front."
	icon_state = "steelplaque"
	sellprice = 30
	sewrepair = FALSE
	anvilrepair = /datum/skill/craft/blacksmithing

/obj/item/storage/belt/rogue/leather/rope
	name = "rope belt"
	desc = "A simple belt made of rope."
	icon_state = "rope"
	item_state = "rope"
	color = "#b9a286"
	heldz_items = 1
	salvage_result = /obj/item/rope

/obj/item/storage/belt/rogue/leather/cloth
	name = "cloth sash"
	desc = "A simple cloth sash."
	icon_state = "cloth"
	heldz_items = 1
	salvage_result = /obj/item/natural/cloth

/obj/item/storage/belt/rogue/leather/cloth/lady
	color = "#575160"

/obj/item/storage/belt/rogue/leather/cloth/bandit
	color = "#ff0000"

/obj/item/storage/belt/rogue/pouch
	name = "pouch"
	desc = "Usually used for holding coins."
	icon = 'icons/roguetown/clothing/storage.dmi'
	mob_overlay_icon = null
	icon_state = "pouch"
	item_state = "pouch"
	lefthand_file = 'icons/mob/inhands/equipment/belt_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/belt_righthand.dmi'
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_NECK
	w_class = WEIGHT_CLASS_NORMAL
	attack_verb = list("whips", "lashes")
	max_integrity = 300
	equip_sound = 'sound/blank.ogg'
	content_overlays = FALSE
	bloody_icon_state = "bodyblood"
	fiber_salvage = FALSE

/obj/item/storage/belt/rogue/pouch/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		STR.max_combined_w_class = 6
		STR.max_w_class = WEIGHT_CLASS_SMALL
		STR.max_items = 3
		STR.not_while_equipped = FALSE

/obj/item/storage/belt/rogue/pouch/coins/mid/Initialize()
	. = ..()
	var/obj/item/roguecoin/silver/pile/H = new(loc)
	if(istype(H))
		if(!SEND_SIGNAL(src, COMSIG_TRY_STORAGE_INSERT, H, null, TRUE, TRUE))
			qdel(H)
	var/obj/item/roguecoin/copper/pile/C = new(loc)
	if(istype(C))
		if(!SEND_SIGNAL(src, COMSIG_TRY_STORAGE_INSERT, C, null, TRUE, TRUE))
			qdel(C)

/obj/item/storage/belt/rogue/pouch/coins/poor/Initialize()
	. = ..()
	var/obj/item/roguecoin/copper/pile/H = new(loc)
	if(istype(H))
		if(!SEND_SIGNAL(src, COMSIG_TRY_STORAGE_INSERT, H, null, TRUE, TRUE))
			qdel(H)
	if(prob(50))
		H = new(loc)
		if(istype(H))
			if(!SEND_SIGNAL(src, COMSIG_TRY_STORAGE_INSERT, H, null, TRUE, TRUE))
				qdel(H)

/obj/item/storage/belt/rogue/pouch/coins/rich/Initialize()
	. = ..()
	var/obj/item/roguecoin/silver/pile/H = new(loc)
	if(istype(H))
		if(!SEND_SIGNAL(src, COMSIG_TRY_STORAGE_INSERT, H, null, TRUE, TRUE))
			qdel(H)
	H = new(loc)
	if(istype(H))
		if(!SEND_SIGNAL(src, COMSIG_TRY_STORAGE_INSERT, H, null, TRUE, TRUE))
			qdel(H)
	if(prob(50))
		H = new(loc)
		if(istype(H))
			if(!SEND_SIGNAL(src, COMSIG_TRY_STORAGE_INSERT, H, null, TRUE, TRUE))
				qdel(H)

/obj/item/storage/belt/rogue/pouch/food/PopulateContents()
	new /obj/item/reagent_containers/food/snacks/rogue/crackerscooked(src)

/obj/item/storage/backpack/rogue //holding salvage vars for children
	sewrepair = TRUE
	fiber_salvage = TRUE
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide/cured

/obj/item/storage/backpack/rogue/satchel
	name = "satchel"
	desc = "A bulky bag worn over the shoulder which can be used to hold many things."
	icon_state = "satchel"
	item_state = "satchel"
	icon = 'icons/roguetown/clothing/storage.dmi'
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	resistance_flags = NONE
	max_integrity = 300
	equip_sound = 'sound/blank.ogg'
	bloody_icon_state = "bodyblood"
	alternate_worn_layer = UNDER_CLOAK_LAYER

/obj/item/storage/fancy/pilltin
	name = "pill tin"
	desc = "a tin for all your pill needs, snake branded (close/open mmb)"
	icon = 'icons/roguetown/items/surgery.dmi'
	icon_state = "pilltin"
	w_class = WEIGHT_CLASS_TINY
	throwforce = 1
	slot_flags = null

/obj/item/storage/fancy/pilltin/update_icon()
	if(fancy_open)
		if(contents.len == 0)
			icon_state = "pilltin_empty"
		else
			icon_state = "pilltincustom_open"
	else
		icon_state = "pilltin"

/obj/item/storage/fancy/pilltin/examine(mob/user)
	. = ..()
	if(fancy_open)
		if(length(contents) == 1)
			. += "There is one item left."
		else
			. += "There are [contents.len <= 0 ? "no" : "[contents.len]"] items left."

/obj/item/storage/fancy/pilltin/attack_self(mob/user)
	fancy_open = !fancy_open
	update_icon()
	. = ..()

/obj/item/storage/fancy/pilltin/Entered(mob/user)
	if(!fancy_open)
		to_chat(user, span_notice("[src] needs to be opened first."))
		return
	fancy_open = TRUE
	update_icon()
	. = ..()

/obj/item/storage/fancy/pilltin/Exited(mob/user)
	fancy_open = FALSE
	update_icon()
	. = ..()

/obj/item/storage/fancy/pilltin/MiddleClick(mob/user, params)
	fancy_open = !fancy_open
	update_icon()
	to_chat(user, span_notice("[src] is now [fancy_open ? "open" : "closed"]."))

/obj/item/storage/fancy/pilltinwake
	name = "pill tin (wake)"
	desc = "a tin for all your pill needs, snake branded (close/open mmb)"
	icon = 'icons/roguetown/items/surgery.dmi'
	icon_state = "pilltin"
	w_class = WEIGHT_CLASS_TINY
	throwforce = 1
	slot_flags = null

/obj/item/storage/fancy/pilltinwake/update_icon()
	if(fancy_open)
		if(contents.len == 0)
			icon_state = "pilltin_empty"
		else
			icon_state = "pilltinwake_open"
	else
		icon_state = "pilltin"

/obj/item/storage/fancy/pilltinwake/examine(mob/user)
	. = ..()
	if(fancy_open)
		if(length(contents) == 1)
			. += "There is one item left."
		else
			. += "There are [contents.len <= 0 ? "no" : "[contents.len]"] items left."

/obj/item/storage/fancy/pilltinwake/attack_self(mob/user)
	fancy_open = !fancy_open
	update_icon()
	. = ..()

/obj/item/storage/fancy/pilltinwake/Entered(mob/user)
	if(!fancy_open)
		to_chat(user, span_notice("[src] needs to be opened first."))
		return
	fancy_open = TRUE
	update_icon()
	. = ..()

/obj/item/storage/fancy/pilltinwake/Exited(mob/user)
	fancy_open = FALSE
	update_icon()
	. = ..()

/obj/item/storage/fancy/pilltinwake/MiddleClick(mob/user, params)
	fancy_open = !fancy_open
	update_icon()
	to_chat(user, span_notice("[src] is now [fancy_open ? "open" : "closed"]."))

/obj/item/storage/fancy/pilltinwake/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		STR.max_combined_w_class = 42
		STR.max_w_class = WEIGHT_CLASS_NORMAL
		STR.max_items = 12
		STR.set_holdable(list(/obj/item/reagent_containers/pill/caffpill))

/obj/item/storage/fancy/pilltinwake/PopulateContents()
	new /obj/item/reagent_containers/pill/caffpill(src)
	new /obj/item/reagent_containers/pill/caffpill(src)
	new /obj/item/reagent_containers/pill/caffpill(src)

/obj/item/storage/fancy/pilltinpink
	name = "pill tin (pnk)"
	desc = "a tin for all your pill needs, snake branded (close/open mmb)"
	icon = 'icons/roguetown/items/surgery.dmi'
	icon_state = "pilltin"
	w_class = WEIGHT_CLASS_TINY
	throwforce = 1
	slot_flags = null

/obj/item/storage/fancy/pilltinpink/update_icon()
	if(fancy_open)
		if(contents.len == 0)
			icon_state = "pilltin_empty"
		else
			icon_state = "pilltinpink_open"
	else
		icon_state = "pilltin"

/obj/item/storage/fancy/pilltinpink/examine(mob/user)
	. = ..()
	if(fancy_open)
		if(length(contents) == 1)
			. += "There is one item left."
		else
			. += "There are [contents.len <= 0 ? "no" : "[contents.len]"] items left."

/obj/item/storage/fancy/pilltinpink/attack_self(mob/user)
	fancy_open = !fancy_open
	update_icon()
	. = ..()

/obj/item/storage/fancy/pilltinpink/Entered(mob/user)
	if(!fancy_open)
		to_chat(user, span_notice("[src] needs to be opened first."))
		return
	fancy_open = TRUE
	update_icon()
	. = ..()

/obj/item/storage/fancy/pilltinpink/Exited(mob/user)
	fancy_open = FALSE
	update_icon()
	. = ..()

/obj/item/storage/fancy/pilltinpink/MiddleClick(mob/user, params)
	fancy_open = !fancy_open
	update_icon()
	to_chat(user, span_notice("[src] is now [fancy_open ? "open" : "closed"]."))

/obj/item/storage/fancy/pilltinpink/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		STR.max_combined_w_class = 42
		STR.max_w_class = WEIGHT_CLASS_NORMAL
		STR.max_items = 12
		STR.set_holdable(list(/obj/item/reagent_containers/pill/pnkpill))

/obj/item/storage/fancy/pilltinpink/PopulateContents()
	new /obj/item/reagent_containers/pill/pnkpill(src)
	new /obj/item/reagent_containers/pill/pnkpill(src)
	new /obj/item/reagent_containers/pill/pnkpill(src)

/obj/item/storage/fancy/skit
	name = "surgery kit"
	desc = "portable and compact (close/open mmb)"
	icon = 'icons/roguetown/items/surgery.dmi'
	icon_state = "skit"
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 1
	slot_flags = null

/obj/item/storage/fancy/skit/update_icon()
	if(fancy_open)
		if(contents.len == 0)
			icon_state = "skit_empty"
		else
			icon_state = "skit_open"
	else
		icon_state = "skit"

/obj/item/storage/fancy/skit/examine(mob/user)
	if(fancy_open)
		if(length(contents) == 1)
			. += "There is one item left."
		else
			. += "There are [contents.len <= 0 ? "no" : "[contents.len]"] items left."

/obj/item/storage/fancy/skit/attack_self(mob/user)
	fancy_open = !fancy_open
	update_icon()
	. = ..()

/obj/item/storage/fancy/skit/Entered(mob/user)
	if(!fancy_open)
		to_chat(user, span_notice("[src] needs to be opened first."))
		return
	fancy_open = TRUE
	update_icon()
	. = ..()

/obj/item/storage/fancy/skit/Exited(mob/user)
	fancy_open = FALSE
	update_icon()
	. = ..()

/obj/item/storage/fancy/skit/MiddleClick(mob/user, params)
	fancy_open = !fancy_open
	update_icon()
	to_chat(user, span_notice("[src] is now [fancy_open ? "open" : "closed"]."))

/obj/item/storage/fancy/skit/ComponentInitialize()
	..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 10
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_combined_w_class = 42
	STR.set_holdable(list(
		/obj/item/rogueweapon/surgery/scalpel,
		/obj/item/rogueweapon/surgery/saw,
		/obj/item/rogueweapon/surgery/hemostat,
		/obj/item/rogueweapon/surgery/retractor,
		/obj/item/rogueweapon/surgery/bonesetter,
		/obj/item/rogueweapon/surgery/cautery,
		/obj/item/natural/worms/leech/cheele,
		/obj/item/needle,
		/obj/item/needle/thorn,
		/obj/item/needle/pestra
	))

/obj/item/storage/fancy/skit/PopulateContents()
	new /obj/item/rogueweapon/surgery/scalpel(src)
	new /obj/item/rogueweapon/surgery/saw(src)
	new /obj/item/rogueweapon/surgery/hemostat(src)
	new /obj/item/rogueweapon/surgery/hemostat(src)
	new /obj/item/rogueweapon/surgery/retractor(src)
	new /obj/item/rogueweapon/surgery/bonesetter(src)
	new /obj/item/rogueweapon/surgery/cautery(src)
	new /obj/item/natural/worms/leech/cheele(src)
	new /obj/item/needle/pestra(src)

/obj/item/storage/fancy/ifak
	name = "personal patch kit"
	desc = "A personal treatment pouch; has all you need to stop you or someone else from their souls reincarnation - at least this time. Even comes with a little guide scroll for the learning. (close/open mmb)"
	icon = 'icons/roguetown/items/surgery.dmi'
	icon_state = "ifak"
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 1
	slot_flags = null

/obj/item/storage/fancy/ifak/PopulateContents()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	for(var/i = 1 to STR.max_items)
		new spawn_type(src)

/obj/item/storage/fancy/ifak/update_icon()
	if(fancy_open)
		if(contents.len == 0)
			icon_state = "ifak_empty"
		else
			icon_state = "ifak_open"
	else
		icon_state = "ifak"

/obj/item/storage/fancy/ifak/examine(mob/user)
	. = ..()
	if(fancy_open)
		if(length(contents) == 1)
			. += "There is one item left."
		else
			. += "There are [contents.len <= 0 ? "no" : "[contents.len]"] items left."

/obj/item/storage/fancy/ifak/attack_self(mob/user)
	fancy_open = !fancy_open
	update_icon()
	. = ..()

/obj/item/storage/fancy/ifak/Entered(mob/user)
	if(!fancy_open)
		to_chat(user, span_notice("[src] needs to be opened first."))
		return
	fancy_open = TRUE
	update_icon()
	. = ..()

/obj/item/storage/fancy/ifak/Exited(mob/user)
	fancy_open = FALSE
	update_icon()
	. = ..()

/obj/item/storage/fancy/ifak/MiddleClick(mob/user, params)
	fancy_open = !fancy_open
	update_icon()
	to_chat(user, span_notice("[src] is now [fancy_open ? "open" : "closed"]."))

/obj/item/storage/fancy/ifak/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 8
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_combined_w_class = 42
	STR.set_holdable(list(
		/obj/item/reagent_containers/hypospray/medipen/sealbottle/reju,
		/obj/item/reagent_containers/hypospray/medipen/sty/detox,
		/obj/item/natural/cloth/bandage,
		/obj/item/natural/bundle/cloth/bandage,
		/obj/item/natural/bundle/cloth/bandage/full,
		/obj/item/reagent_containers/pill/pnkpill,
		/obj/item/candle,
		/obj/item/needle,
		/obj/item/needle/thorn,
		/obj/item/needle/pestra,
	))

/obj/item/storage/fancy/ifak/PopulateContents()
	new /obj/item/reagent_containers/hypospray/medipen/sealbottle/reju(src)
	new /obj/item/natural/bundle/cloth/bandage/full(src)
	new /obj/item/reagent_containers/hypospray/medipen/sty/detox(src)
	new /obj/item/reagent_containers/pill/pnkpill(src)
	new /obj/item/candle/yellow(src)
	new /obj/item/needle(src)

/obj/item/storage/backpack/rogue/satchel/heartfelt/PopulateContents()
	new /obj/item/natural/feather(src)
	new /obj/item/paper(src)

/obj/item/storage/backpack/rogue/satchel/mule/PopulateContents()
	for(var/i in 1 to 3)
		switch(rand(1,3))
			if(1)
				new /obj/item/reagent_containers/powder/moondust(src)
			if(2)
				new /obj/item/reagent_containers/powder/ozium(src)
			if(3)
				new /obj/item/reagent_containers/powder/spice(src)


/obj/item/storage/backpack/rogue/satchel/black
	color = CLOTHING_BLACK

/obj/item/storage/backpack/rogue/satchel/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		STR.max_combined_w_class = 18
		STR.max_w_class = WEIGHT_CLASS_NORMAL
		STR.max_items = 5
		STR.click_gather = TRUE
		STR.allow_quick_empty = TRUE
		STR.allow_dump_out = TRUE

/obj/item/storage/backpack/rogue/attack_right(mob/user)
	var/datum/component/storage/CP = GetComponent(/datum/component/storage)
	if(CP)
		CP.rmb_show(user)
		return TRUE

/obj/item/storage/backpack/rogue/backpack/rucksack
	name = "rucksack"
	desc = "A bulky backpack worn on the back which can store many items."
	icon_state = "rucksack"
	item_state = "rucksack"
	icon = 'icons/roguetown/clothing/storage.dmi'
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	resistance_flags = NONE
	max_integrity = 300
	equip_sound = 'sound/blank.ogg'
	bloody_icon_state = "bodyblood"
	sewrepair = TRUE

/obj/item/storage/backpack/rogue/backpack/rucksack/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		STR.max_combined_w_class = 42
		STR.max_w_class = WEIGHT_CLASS_NORMAL
		STR.max_items = 10
		STR.not_while_equipped = TRUE

/obj/item/storage/backpack/rogue/backpack
	name = "backpack"
	desc = "A bulky backpack worn on the back which can store many items."
	icon_state = "backpack"
	item_state = "backpack"
	icon = 'icons/roguetown/clothing/storage.dmi'
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK_L
	resistance_flags = NONE
	max_integrity = 300
	equip_sound = 'sound/blank.ogg'
	bloody_icon_state = "bodyblood"

/obj/item/storage/backpack/rogue/backpack/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		STR.max_combined_w_class = 42
		STR.max_w_class = WEIGHT_CLASS_NORMAL
		STR.max_items = 14
		STR.not_while_equipped = TRUE
		STR.allow_dump_out = TRUE

/obj/item/storage/belt/rogue/leather/exoticsilkbelt
	name = "Exotic Silk Belt"
	desc = "A gold adorned belt with the softest of silks barely concealing one's bits."
	icon_state = "exoticsilkbelt"
	heldz_items = 1
	sewrepair = TRUE

/obj/item/storage/belt/rogue/bone/skullbelt
	name = "skull belt"
	desc = "Worn by barbarians, tribals and madmen. Not in that particular order."
	icon_state = "skullcrotch"
	item_state = "skullcrotch"
	heldz_items = 3

/obj/item/storage/belt/rogue/leather/ornate
	name = "ornate belt"
	desc = "An ornate belt decorated with gold."
	icon_state = "ornate_belt"
	sellprice = 50
	sewrepair = FALSE
	anvilrepair = /datum/skill/craft/blacksmithing

/obj/item/storage/belt/rogue/leather/blackleather
	name = "black leather belt"
	icon_state = "blackleatherbelt"
	sewrepair = TRUE
	sellprice = 10

/obj/item/storage/belt/rogue/pickles
	name = "jar of pickles"
	desc = "Briney goodness!"
	icon = 'icons/roguetown/clothing/storage.dmi'
	icon_state = "pickles"
	slot_flags = null
	w_class = WEIGHT_CLASS_NORMAL
	max_integrity = 100
	content_overlays = FALSE
	heldz_items = 4
	sewrepair = FALSE

/obj/item/storage/belt/rogue/pickles/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		STR.max_combined_w_class = 8
		STR.max_w_class = WEIGHT_CLASS_SMALL
		STR.max_items = 4
		STR.not_while_equipped = FALSE

/obj/item/storage/belt/rogue/pickles/PopulateContents()
	new /obj/item/reagent_containers/food/snacks/grown/pickle(src)
	new /obj/item/reagent_containers/food/snacks/grown/pickle(src)
	new /obj/item/reagent_containers/food/snacks/grown/pickle(src)
	new /obj/item/reagent_containers/food/snacks/grown/pickle(src)
