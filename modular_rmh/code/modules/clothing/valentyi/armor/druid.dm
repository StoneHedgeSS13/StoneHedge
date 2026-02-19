/obj/item/clothing/armor/leather/advanced/druid
	name = "druid armor"
	desc = "A carefully layered armor of cured leather, living oak bark, and woven leaves. Flexible yet resilient, it carries the quiet strength of the forest."

	icon = 'modular_rmh/icons/clothing/vladegeg/armor/druid.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/vladegeg/armor/onmob/druid.dmi'
	sleeved = 'modular_rmh/icons/clothing/vladegeg/armor/onmob/helpers/druid_sleeves.dmi'

	icon_state = "druid"
	item_state = "druid"

	smeltresult = /obj/item/fertilizer/ash
	sellprice = VALUE_LEATHER_ARMOR + 40

	max_integrity = INTEGRITY_STANDARD + 50
	item_weight = 3.6

	body_parts_covered = CHEST|GROIN|VITALS|LEGS|ARMS
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST)

	armor = list(
		"blunt" = 80,
		"slash" = 55,
		"stab" = 35,
		"piercing" = 15,
		"fire" = -10,
		"acid" = 10
	)

	salvage_result = /obj/item/natural/hide/cured
	misc_flags = CRAFTING_TEST_EXCLUDE
