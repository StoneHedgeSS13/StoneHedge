
/obj/item/storage/backpack/backpack/bagpack
	name = "rucksack"
	desc = "A sack tied with some rope. Can be flung over your shoulders, if it's tied shut."
	icon = 'modular_rmh/icons/clothing/storage.dmi'
	icon_state = "rucksack_untied"
	item_state = "rucksack"
	component_type = /datum/component/storage/concrete/grid/sack
	max_integrity = 100
	sewrepair = TRUE
	var/tied = FALSE

/obj/item/storage/backpack/backpack/bagpack/attack_hand_secondary(mob/user)
	tied = !tied
	to_chat(user, span_info("I [tied ? "tighten" : "loosen"] the rucksack."))
	playsound(src, 'sound/foley/equip/rummaging-01.ogg', 100)
	update_icon()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(tied)
		STR.click_gather = FALSE
		STR.allow_quick_gather = FALSE
		STR.allow_quick_empty = FALSE
	else
		STR.click_gather = TRUE
		STR.allow_quick_gather = TRUE
		STR.allow_quick_empty = TRUE

/obj/item/storage/backpack/backpack/bagpack/equipped(mob/living/carbon/human/user, slot)
	. = ..()
	if(!tied && (slot == ITEM_SLOT_BACK_L || slot == ITEM_SLOT_BACK_R))
		var/datum/component/storage/STR = GetComponent(/datum/component/storage)
		var/list/things = STR.contents()
		if(length(things))
			visible_message(span_warning("The loose bag empties as it is swung around [user]'s shoulder!"))
			STR.quick_empty(user)

/obj/item/storage/backpack/backpack/bagpack/update_icon()
	. = ..()
	if(tied)
		icon_state = "rucksack_tied_sling"
	else
		icon_state = "rucksack_untied"
