/obj/item/clothing/suit/roguetown/armor/plate/orc //Big Bad Boss Gear
	name = "warlord plate"
	icon_state = "warlord_armor_item"
	item_state = "warlord_armor"
	armor = list("blunt" = 60, "slash" = 75, "stab" = 60, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 400
	icon = 'icons/roguetown/mob/monster/orc.dmi'
	smeltresult = /obj/item/ingot/iron
	allowed_race = list(/mob/living/carbon/human/species/halforc/orc_raider)
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
	flags_inv = HIDEBOOB
	sellprice = 0

/obj/item/clothing/suit/roguetown/armor/chainmail/orc
	name = "orc chainvest"
	icon_state = "orc_chainvest_item"
	item_state = "orc_chainvest"
	armor = list("blunt" = 40, "slash" = 60, "stab" = 50, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 200
	icon = 'icons/roguetown/mob/monster/orc.dmi'
	body_parts_covered = CHEST|GROIN|ARMS|VITALS
	flags_inv = HIDEBOOB
	allowed_race = list(/mob/living/carbon/human/species/halforc/orc_raider)
	sellprice = 0
  
/obj/item/clothing/suit/roguetown/armor/carapace/cuirass/orc
	name = "orc cuirass armor"
	icon_state = "marauder_armor_item"
	item_state = "marauder_armor"
	armor = list("blunt" = 60, "slash" = 75, "stab" = 60, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 30, "acid" = 0)
	max_integrity = 400
	icon = 'icons/roguetown/mob/monster/orc.dmi'
	body_parts_covered = CHEST|GROIN|VITALS
	flags_inv = HIDEBOOB
	allowed_race = list(/mob/living/carbon/human/species/halforc/orc_raider)
	sellprice = 0

/obj/item/clothing/suit/roguetown/armor/leather/studded/orc
	name = "Orc Studded"
	icon_state = "studded_armor_item"
	item_state = "studded_armor"
	armor = list("blunt" = 60, "slash" = 50, "stab" = 50, "bullet" = 40, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 300
	icon = 'icons/roguetown/mob/monster/orc.dmi'
	body_parts_covered = CHEST|GROIN|ARMS|VITALS
	flags_inv = HIDEBOOB
	allowed_race = list(/mob/living/carbon/human/species/halforc/orc_raider)
	sellprice = 0

/obj/item/clothing/under/roguetown/trou/leather/orc
	name = "orc trousers"
	desc = "smells funny."
	icon = 'icons/roguetown/mob/monster/orc.dmi'
	icon_state = "orc_leather_item"
	item_state = "orc_leather"
	armor = list("blunt" = 40, "slash" = 40, "stab" = 40, "bullet" = 25, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0) //no free leg shots for you
	max_integrity = 200
	flags_inv = HIDECROTCH
	allowed_race = list(/mob/living/carbon/human/species/halforc/orc_raider)
	sellprice = 0

/obj/item/clothing/head/roguetown/helmet/orc
	name = "orc helmet"
	icon = 'icons/roguetown/mob/monster/orc.dmi'
	icon_state = "marauder_helm_item"
	item_state = "marauder_helm"
	armor = list("blunt" = 70, "slash" = 75, "stab" = 50, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 200
	allowed_race = list(/mob/living/carbon/human/species/halforc/orc_raider)
	sellprice = 0

/obj/item/clothing/head/roguetown/helmet/heavy/orc
	name = "orc warlord helmet"
	icon = 'icons/roguetown/mob/monster/orc.dmi'
	icon_state = "warlord_armor_item"
	item_state = "warlord_armor"
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	allowed_race = list(/mob/living/carbon/human/species/halforc/orc_raider)
	sellprice = 0
	max_integrity = 400
	smeltresult = /obj/item/ingot/iron
