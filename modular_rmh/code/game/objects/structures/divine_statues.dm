//By SayonaraEcho

/obj/structure/fluff/statue/sune
	name = "statue of Sune"
	desc = "Sune Firehair, goddess of love, beauty, passion, and pleasure. She teaches that beauty is sacred, love is transformative, and desire is a force to be celebrated rather than denied."
	icon = 'modular_rmh/icons/obj/structures/statues/statue_sune.dmi'
	icon_state = "sune"
	max_integrity = 100 // You wanted descructible statues, you'll get them.
	deconstructible = FALSE
	density = TRUE
	blade_dulling = DULLING_BASH
	SET_BASE_PIXEL(-16, 0)

/obj/structure/fluff/statue/selune
	name = "statue of Selune"
	desc = "Selune, the Moonmaiden, goddess of the moon, stars, tides, and travelers by night. A gentle yet ancient power, she is the eternal foe of Shar and a beacon of hope, change, and protection for those who walk in darkness."
	icon = 'modular_rmh/icons/obj/structures/statues/statue_selune.dmi'
	icon_state = "selune"
	max_integrity = 100 // You wanted descructible statues, you'll get them.
	deconstructible = FALSE
	density = TRUE
	blade_dulling = DULLING_BASH
	SET_BASE_PIXEL(-16, 0)

/obj/structure/fluff/statue/selune/left
	icon_state = "selune_left"

/obj/structure/fluff/statue/selune/guard
	name = "awakened statue of Selune"
	icon_state = "selune_guard"

/obj/structure/fluff/statue/selune/guard/Initialize(mapload)
	. = ..()
	update_appearance(UPDATE_OVERLAYS)

/obj/structure/fluff/statue/selune/guard/update_overlays()
	. = ..()
	. += emissive_appearance(icon, "selune_guard_overlay", alpha = 60)

/obj/structure/fluff/statue/selune/guard_left
	name = "awakened statue of Selune"
	icon_state = "selune_guard_left"

/obj/structure/fluff/statue/selune/guard_left/Initialize(mapload)
	. = ..()
	update_appearance(UPDATE_OVERLAYS)

/obj/structure/fluff/statue/selune/guard_left/update_overlays()
	. = ..()
	. += emissive_appearance(icon, "selune_guard_left_overlay", alpha = 60)

/obj/structure/fluff/statue/eilistraee
	name = "statue of Eilistraee"
	desc = "Eilistraee, the Dark Maiden, goddess of song, dance, moonlight, and redemption. She is shown in graceful motion, dancing beneath the moon with a silver blade balanced above her hand."
	icon = 'modular_rmh/icons/obj/structures/statues/statue_eilistraee.dmi'
	icon_state = "eilistraee"
	max_integrity = 100 // You wanted descructible statues, you'll get them.
	deconstructible = FALSE
	density = TRUE
	blade_dulling = DULLING_BASH
	SET_BASE_PIXEL(-16, 0)

//By InfraredBaron

/obj/structure/fluff/statue/shar
	name = "statue of Shar"
	desc = "Shar, the Lady of Loss, is depicted seated in dark splendor. A golden crown rests upon her brow, its radiance muted by the surrounding shadows. In her hands lies a gilded sword, a symbol of quiet authority and the promise that all things — hope, memory, and light — are destined to be cut away and forgotten."
	icon = 'modular_rmh/icons/obj/structures/statues/statue_shar.dmi'
	icon_state = "shar"
	max_integrity = 100 // You wanted descructible statues, you'll get them.
	deconstructible = FALSE
	density = TRUE
	blade_dulling = DULLING_BASH
	SET_BASE_PIXEL(-16, 0)

//By Surman

/obj/structure/fluff/statue/shar_blades
	name = "statue of Shar"
	desc = "Shar, the Lady of Loss, goddess of darkness, night, secrets, and forgetfulness. Cloaked in shadow, she stands with twin blades raised in silent promise — to sever memory, hope, and truth, leaving only the comfort of oblivion."
	icon = 'modular_rmh/icons/obj/structures/statues/statue_sharblades.dmi'
	icon_state = "1"
	max_integrity = 100 // You wanted descructible statues, you'll get them.
	deconstructible = FALSE
	density = TRUE
	blade_dulling = DULLING_BASH

/obj/structure/fluff/statue/shar_blades/Initialize()
	. = ..()
	icon_state = pick("1", "2", "3", "4")
