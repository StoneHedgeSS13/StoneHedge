//HATS

/obj/item/clothing/head/courtphysician
	name = "sanguine hat"
	desc = "A hat for keeping the splattered blood out of your face, for when your trade is required."
	icon_state = "dochat1"
	item_state = "dochat1"
	detail_tag = "_detail"
	detail_color = CLOTHING_RED
	icon = 'modular_rmh/icons/clothing/physician.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/onmob/physician.dmi'
	salvage_result = /obj/item/natural/silk
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/head/courtphysician/Initialize()
	. = ..()
	update_icon()

/obj/item/clothing/head/courtphysician/update_icon()
	. = ..()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/head/courtphysician/female
	name = "sanguine cap"
	desc = "A cap for keeping the splattered blood out of your hair, for when your trade is required."
	icon_state = "dochat2"
	item_state = "dochat2"
	detail_tag = "_detail"
	detail_color = CLOTHING_RED
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/head/roguetown/courtphysician/female/Initialize()
	. = ..()
	update_icon()

/obj/item/clothing/head/roguetown/courtphysician/female/update_icon()
	. = ..()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)


/obj/item/clothing/head/physician
	name = "physician hat"
	desc = ""
	icon_state = "courthat"
	item_state = "courthat"
	icon = 'modular_rmh/icons/clothing/physician.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/onmob/physician.dmi'
	salvage_result = /obj/item/natural/silk
	misc_flags = CRAFTING_TEST_EXCLUDE

//NECK

/obj/item/clothing/neck/physician
	name = "physician collar"
	desc = ""
	icon_state = "courtcollar"
	item_state = "courtcollar"
	icon = 'modular_rmh/icons/clothing/physician.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/onmob/physician.dmi'
	misc_flags = CRAFTING_TEST_EXCLUDE

//MASKS

/obj/item/clothing/face/courtphysician
	name = "head physician's mask"
	desc = "This one is made with actual bone! Don't ask whose."
	icon = 'modular_rmh/icons/clothing/physician.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/onmob/physician.dmi'
	icon_state = "docmask"
	item_state = "docmask"
	body_parts_covered = FACE|EARS|EYES|MOUTH|NECK
	salvage_result = /obj/item/alch/bone
	resistance_flags = FLAMMABLE
	gas_transfer_coefficient = 0.3
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/face/physician
	name = "physician's mask"
	icon_state = "courtmask"
	item_state = "courtmask"
	icon = 'modular_rmh/icons/clothing/physician.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/onmob/physician.dmi'
	body_parts_covered = FACE|EARS|EYES|MOUTH|NECK
	salvage_result = /obj/item/alch/bone
	resistance_flags = FLAMMABLE
	gas_transfer_coefficient = 0.3
	misc_flags = CRAFTING_TEST_EXCLUDE

//GLOVES

/obj/item/clothing/gloves/leather/courtphysician
	name = "sanguine gloves"
	desc = "Carefully sewn leather gloves, unrestricting to your ability to wield surgical tools, and stylish!"
	icon_state = "docgloves"
	item_state = "docgloves"
	icon = 'modular_rmh/icons/clothing/physician.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/onmob/physician.dmi'
	sleeved = 'modular_rmh/icons/clothing/onmob/helpers/physician_sleeves.dmi'
	detail_tag = "_detail"
	detail_color = CLOTHING_RED
	armor = ARMOR_LEATHER
	resistance_flags = null
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	anvilrepair = null
	sewrepair = TRUE
	salvage_result = /obj/item/natural/hide/cured
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/gloves/leather/courtphysician/female
	name = "sanguine sleeves"
	desc = "Carefully sewn leather gloves with silk sleeves covering them, unrestricting to your ability to wield surgical tools, and stylish!"
	icon_state = "docsleeves"
	item_state = "docsleeves"
	icon = 'modular_rmh/icons/clothing/physician.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/onmob/physician.dmi'
	sleeved = 'modular_rmh/icons/clothing/onmob/helpers/physician_sleeves.dmi'
	detail_tag = "_detail"
	detail_color = CLOTHING_RED
	salvage_result = /obj/item/natural/silk
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/gloves/leather/courtphysician/female/Initialize()
	. = ..()
	update_icon()

/obj/item/clothing/gloves/leather/courtphysician/female/update_icon()
	. = ..()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

//ARMOR

/obj/item/clothing/armor/leather/courtphysician
	name = "sanguine coat"
	desc = "A padded coat made of a leather, perhaps this may keep the bloodstains away."
	icon_state = "doccoat"
	item_state = "doccoat"
	color = null
	boobed = FALSE
	icon = 'modular_rmh/icons/clothing/physician.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/onmob/physician.dmi'
	sleeved = 'modular_rmh/icons/clothing/onmob/helpers/physician_sleeves.dmi'
	detail_tag = "_detail"
	detail_color = CLOTHING_RED
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/armor/leather/courtphysician/Initialize()
	. = ..()
	update_icon()

/obj/item/clothing/armor/leather/courtphysician/update_icon()
	. = ..()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/armor/leather/courtphysician/female
	name = "sanguine jacket"
	desc = "An elegant jacket made of silk and padded with leather on the inside. It would be a shame to dirty this, but it is inevitable."
	icon_state = "docjacket"
	item_state = "docjacket"
	color = null
	boobed = FALSE
	icon = 'modular_rmh/icons/clothing/physician.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/onmob/physician.dmi'
	sleeved = 'modular_rmh/icons/clothing/onmob/helpers/physician_sleeves.dmi'
	detail_tag = "_detail"
	detail_color = CLOTHING_RED
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/armor/leather/courtphysician/female/Initialize()
	. = ..()
	update_icon()

/obj/item/clothing/armor/leather/courtphysician/female/update_icon()
	. = ..()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

//SHIRTS

/obj/item/clothing/shirt/undershirt/courtphysician
	name = "sanguine vest"
	desc = "A silk vest, perhaps it will make it another dae without being bloodied."
	boobed = FALSE
	icon_state = "docvest"
	item_state = "docvest"
	icon = 'modular_rmh/icons/clothing/physician.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/onmob/physician.dmi'
	sleeved = 'modular_rmh/icons/clothing/onmob/helpers/physician_sleeves.dmi'
	detail_tag = "_detail"
	detail_color = CLOTHING_RED
	salvage_result = /obj/item/natural/silk
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/shirt/undershirt/courtphysician/Initialize()
	. = ..()
	update_icon()

/obj/item/clothing/shirt/undershirt/courtphysician/update_icon()
	. = ..()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/shirt/undershirt/courtphysician/female
	name = "sanguine blouse"
	desc = "A silk blouse, elegant, but it does you no good in surgery."
	boobed = FALSE
	icon_state = "docblouse"
	item_state = "docblouse"
	icon = 'modular_rmh/icons/clothing/physician.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/onmob/physician.dmi'
	sleeved = 'modular_rmh/icons/clothing/onmob/helpers/physician_sleeves.dmi'
	detail_tag = "_detail"
	detail_color = CLOTHING_RED
	salvage_result = /obj/item/natural/silk
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/shirt/undershirt/courtphysician/female/Initialize()
	. = ..()
	update_icon()

/obj/item/clothing/shirt/undershirt/courtphysician/female/update_icon()
	. = ..()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)


/obj/item/clothing/shirt/robe/physician
	name = "physician robe"
	desc = ""
	icon_state = "courtrobe"
	item_state = "courtrobe"
	icon = 'modular_rmh/icons/clothing/physician.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/onmob/physician.dmi'
	sleeved = 'modular_rmh/icons/clothing/onmob/helpers/physician_sleeves.dmi'
	misc_flags = CRAFTING_TEST_EXCLUDE

//PANTS

/obj/item/clothing/pants/trou/leather/courtphysician
	name = "sanguine trousers"
	desc = "A pair of formal trousers, clean to the best of the servant's ability, but some bloodstains are impossible to rid them of"
	icon_state = "docpants"
	salvage_result = /obj/item/natural/silk
	item_state = "docpants"
	icon = 'modular_rmh/icons/clothing/physician.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/onmob/physician.dmi'
	sleeved = 'modular_rmh/icons/clothing/onmob/helpers/physician_sleeves.dmi'
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/pants/skirt/courtphysician
	name = "sanguine skirt"
	desc = "An elegant velvet skirt that does you no good when running to someones aid."
	icon_state = "docskirt"
	item_state = "docskirt"
	icon = 'modular_rmh/icons/clothing/physician.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/onmob/physician.dmi'
	sleeved = 'modular_rmh/icons/clothing/onmob/helpers/physician_sleeves.dmi'
	detail_tag = "_detail"
	detail_color = CLOTHING_RED
	alternate_worn_layer = (SHIRT_LAYER)
	salvage_result = /obj/item/natural/silk
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/pants/skirt/courtphysician/Initialize()
	. = ..()
	update_icon()

/obj/item/clothing/pants/skirt/courtphysician/update_icon()
	. = ..()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)


//SHOES

/obj/item/clothing/shoes/courtphysician
	name = "sanguine shoes"
	desc = "Leather shoes, the solemn tap of these bears grim news, or salvation."
	icon_state = "docshoes"
	item_state = "docshoes"
	icon = 'modular_rmh/icons/clothing/physician.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/onmob/physician.dmi'
	sleeved = 'modular_rmh/icons/clothing/onmob/helpers/physician_sleeves.dmi'
	salvage_result = /obj/item/natural/hide/cured
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/shoes/heels/courtphysician/female
	name = "sanguine heels"
	desc = "Leather heels, the solemn tap of these bears grim news, or salvation."
	icon_state = "docheels"
	item_state = "docheels"
	icon = 'modular_rmh/icons/clothing/physician.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/onmob/physician.dmi'
	sleeved = 'modular_rmh/icons/clothing/onmob/helpers/physician_sleeves.dmi'
	detail_tag = "_detail"
	detail_color = CLOTHING_RED
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/shoes/heels/courtphysician/female/Initialize()
	. = ..()
	update_icon()

/obj/item/clothing/shoes/heels/courtphysician/female/update_icon()
	. = ..()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)
