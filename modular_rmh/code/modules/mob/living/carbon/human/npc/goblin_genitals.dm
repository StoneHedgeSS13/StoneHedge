// Blood and sweat by Vide Noir
//i also made skeleton bits but couldnt make them work.
/mob/living/carbon/human/species/goblin
	//genital slop
	ball_organ = /obj/item/organ/genitals/filling_organ/testicles/goblin
	breast_organ = /obj/item/organ/genitals/filling_organ/breasts/goblin
	ass_organ = /obj/item/organ/genitals/butt/goblin
	penis_organ = /obj/item/organ/genitals/penis/goblin
	vagina_organ = /obj/item/organ/genitals/filling_organ/vagina/goblin
	breast_min = 3
	breast_max = 4
	penis_min = 2
	penis_max = 2
	ball_min = 3
	ball_max = 3
	butt_min = 3
	butt_max = 3
	skin_tone = "e8b59b"
	show_genitals = TRUE

//for genitals
/mob/living/carbon/human/species/goblin/doUnEquip(obj/item/I, force, newloc, no_move, invdrop, silent)
	. = ..()
	update_body_parts(TRUE)

//custom genital slop, could not do it a better way.

/obj/item/organ/genitals/butt/goblin
	name = "goblin butt"
	accessory_type = /datum/sprite_accessory/genitals/butt/goblin

/datum/sprite_accessory/genitals/butt/goblin
	name = "goblin butt"
	icon = 'modular_rmh/icons/mob/monster/goblinbits.dmi'
	icon_state = "goblin"

/obj/item/organ/genitals/penis/goblin
	name = "goblin penis"
	accessory_type = /datum/sprite_accessory/genitals/penis/goblin

/datum/sprite_accessory/genitals/penis/goblin
	name = "goblin penis"
	icon = 'modular_rmh/icons/mob/monster/goblinbits.dmi'
	icon_state = "goblin"

/obj/item/organ/genitals/filling_organ/testicles/goblin
	name = "goblin testicles"
	accessory_type = /datum/sprite_accessory/genitals/testicles/goblin

/datum/sprite_accessory/genitals/testicles/goblin
	name = "goblin"
	icon = 'modular_rmh/icons/mob/monster/goblinbits.dmi'
	icon_state = "goblinballs"

/obj/item/organ/genitals/filling_organ/breasts/goblin
	name = "goblin breasts"
	accessory_type = /datum/sprite_accessory/genitals/breasts/goblin

/datum/sprite_accessory/genitals/breasts/goblin
	name = "goblin"
	icon = 'modular_rmh/icons/mob/monster/goblinbits.dmi'
	icon_state = "goblinbreasts"

/obj/item/organ/genitals/filling_organ/vagina/goblin
	name = "goblin vagina"
	accessory_type = /datum/sprite_accessory/genitals/vagina/goblin

/datum/sprite_accessory/genitals/vagina/goblin
	name = "goblin"
	icon = 'modular_rmh/icons/mob/monster/goblinbits.dmi'
	icon_state = "goblinpussy"

//

/obj/item/organ/genitals/butt/goblin/sea
	name = "goblin butt"
	accessory_type = /datum/sprite_accessory/genitals/butt/goblin/sea

/datum/sprite_accessory/genitals/butt/goblin/sea
	name = "goblin butt"
	icon = 'modular_rmh/icons/mob/monster/goblinbits.dmi'
	icon_state = "goblinsea"

/obj/item/organ/genitals/penis/goblin/sea
	name = "goblin penis"
	accessory_type = /datum/sprite_accessory/genitals/penis/goblin/sea

/datum/sprite_accessory/genitals/penis/goblin/sea
	name = "goblin penis"
	icon = 'modular_rmh/icons/mob/monster/goblinbits.dmi'
	icon_state = "goblinsea"


/obj/item/organ/genitals/filling_organ/testicles/goblin/sea
	name = "goblin testicles"
	accessory_type = /datum/sprite_accessory/genitals/testicles/goblin/sea

/datum/sprite_accessory/genitals/testicles/goblin/sea
	name = "goblin"
	icon = 'modular_rmh/icons/mob/monster/goblinbits.dmi'
	icon_state = "goblinseaballs"


/obj/item/organ/genitals/filling_organ/breasts/goblin/sea
	name = "goblin breasts"
	accessory_type = /datum/sprite_accessory/genitals/breasts/goblin/sea

/datum/sprite_accessory/genitals/breasts/goblin/sea
	name = "goblin"
	icon = 'modular_rmh/icons/mob/monster/goblinbits.dmi'
	icon_state = "goblinseabreasts"


//

/obj/item/organ/genitals/butt/goblin/cave
	name = "goblin butt"
	accessory_type = /datum/sprite_accessory/genitals/butt/goblin/cave

/datum/sprite_accessory/genitals/butt/goblin/cave
	name = "goblin butt"
	icon = 'modular_rmh/icons/mob/monster/goblinbits.dmi'
	icon_state = "goblincave"


/obj/item/organ/genitals/penis/goblin/cave
	name = "goblin penis"
	accessory_type = /datum/sprite_accessory/genitals/penis/goblin/cave

/datum/sprite_accessory/genitals/penis/goblin/cave
	name = "goblin penis"
	icon = 'modular_rmh/icons/mob/monster/goblinbits.dmi'
	icon_state = "goblincave"


/obj/item/organ/genitals/filling_organ/testicles/goblin/cave
	name = "goblin testicles"
	accessory_type = /datum/sprite_accessory/genitals/testicles/goblin/cave

/datum/sprite_accessory/genitals/testicles/goblin/cave
	name = "goblin"
	icon = 'modular_rmh/icons/mob/monster/goblinbits.dmi'
	icon_state = "goblincaveballs"


/obj/item/organ/genitals/filling_organ/breasts/goblin/cave
	name = "goblin breasts"
	accessory_type = /datum/sprite_accessory/genitals/breasts/goblin/cave

/datum/sprite_accessory/genitals/breasts/goblin/cave
	name = "goblin"
	icon = 'modular_rmh/icons/mob/monster/goblinbits.dmi'
	icon_state = "goblincavebreasts"

//

/obj/item/organ/genitals/butt/goblin/hell
	name = "goblin butt"
	accessory_type = /datum/sprite_accessory/genitals/butt/goblin/hell

/datum/sprite_accessory/genitals/butt/goblin/hell
	name = "goblin butt"
	icon = 'modular_rmh/icons/mob/monster/goblinbits.dmi'
	icon_state = "goblinhell"


/obj/item/organ/genitals/penis/goblin/hell
	name = "goblin penis"
	accessory_type = /datum/sprite_accessory/genitals/penis/goblin/hell

/datum/sprite_accessory/genitals/penis/goblin/hell
	name = "goblin penis"
	icon = 'modular_rmh/icons/mob/monster/goblinbits.dmi'
	icon_state = "goblinhell"


/obj/item/organ/genitals/filling_organ/testicles/goblin/hell
	name = "goblin testicles"
	accessory_type = /datum/sprite_accessory/genitals/testicles/goblin/hell

/datum/sprite_accessory/genitals/testicles/goblin/hell
	name = "goblin"
	icon = 'modular_rmh/icons/mob/monster/goblinbits.dmi'
	icon_state = "goblinhellballs"


/obj/item/organ/genitals/filling_organ/breasts/goblin/hell
	name = "goblin breasts"
	accessory_type = /datum/sprite_accessory/genitals/breasts/goblin/hell

/datum/sprite_accessory/genitals/breasts/goblin/hell
	name = "goblin"
	icon = 'modular_rmh/icons/mob/monster/goblinbits.dmi'
	icon_state = "goblinhellbreasts"


//

/obj/item/organ/genitals/butt/goblin/moon
	name = "goblin butt"
	accessory_type = /datum/sprite_accessory/genitals/butt/goblin/moon

/datum/sprite_accessory/genitals/butt/goblin/moon
	name = "goblin butt"
	icon = 'modular_rmh/icons/mob/monster/goblinbits.dmi'
	icon_state = "goblinmoon"


/obj/item/organ/genitals/penis/goblin/moon
	name = "goblin penis"
	accessory_type = /datum/sprite_accessory/genitals/penis/goblin/moon

/datum/sprite_accessory/genitals/penis/goblin/moon
	name = "goblin penis"
	icon = 'modular_rmh/icons/mob/monster/goblinbits.dmi'
	icon_state = "goblinmoon"


/obj/item/organ/genitals/filling_organ/testicles/goblin/moon
	name = "goblin testicles"
	accessory_type = /datum/sprite_accessory/genitals/testicles/goblin/moon

/datum/sprite_accessory/genitals/testicles/goblin/moon
	name = "goblin"
	icon = 'modular_rmh/icons/mob/monster/goblinbits.dmi'
	icon_state = "goblinmoonballs"


/obj/item/organ/genitals/filling_organ/breasts/goblin/moon
	name = "goblin breasts"
	accessory_type = /datum/sprite_accessory/genitals/breasts/goblin/moon

/datum/sprite_accessory/genitals/breasts/goblin/moon
	name = "goblin"
	icon = 'modular_rmh/icons/mob/monster/goblinbits.dmi'
	icon_state = "goblinmoonbreasts"

/mob/living/carbon/human/species/goblin/hell
	ball_organ = /obj/item/organ/genitals/filling_organ/testicles/goblin/hell
	breast_organ = /obj/item/organ/genitals/filling_organ/breasts/goblin/hell
	ass_organ = /obj/item/organ/genitals/butt/goblin/hell
	penis_organ = /obj/item/organ/genitals/penis/goblin/hell

/mob/living/carbon/human/species/goblin/npc/hell
	ball_organ = /obj/item/organ/genitals/filling_organ/testicles/goblin/hell
	breast_organ = /obj/item/organ/genitals/filling_organ/breasts/goblin/hell
	ass_organ = /obj/item/organ/genitals/butt/goblin/hell
	penis_organ = /obj/item/organ/genitals/penis/goblin/hell

/mob/living/carbon/human/species/goblin/npc/ambush/hell
	ball_organ = /obj/item/organ/genitals/filling_organ/testicles/goblin/hell
	breast_organ = /obj/item/organ/genitals/filling_organ/breasts/goblin/hell
	ass_organ = /obj/item/organ/genitals/butt/goblin/hell
	penis_organ = /obj/item/organ/genitals/penis/goblin/hell

/mob/living/carbon/human/species/goblin/cave
	ball_organ = /obj/item/organ/genitals/filling_organ/testicles/goblin/cave
	breast_organ = /obj/item/organ/genitals/filling_organ/breasts/goblin/cave
	ass_organ = /obj/item/organ/genitals/butt/goblin/cave
	penis_organ = /obj/item/organ/genitals/penis/goblin/cave

/mob/living/carbon/human/species/goblin/npc/cave
	ball_organ = /obj/item/organ/genitals/filling_organ/testicles/goblin/cave
	breast_organ = /obj/item/organ/genitals/filling_organ/breasts/goblin/cave
	ass_organ = /obj/item/organ/genitals/butt/goblin/cave
	penis_organ = /obj/item/organ/genitals/penis/goblin/cave

/mob/living/carbon/human/species/goblin/npc/ambush/cave
	ball_organ = /obj/item/organ/genitals/filling_organ/testicles/goblin/cave
	breast_organ = /obj/item/organ/genitals/filling_organ/breasts/goblin/cave
	ass_organ = /obj/item/organ/genitals/butt/goblin/cave
	penis_organ = /obj/item/organ/genitals/penis/goblin/cave

/mob/living/carbon/human/species/goblin/sea
	ball_organ = /obj/item/organ/genitals/filling_organ/testicles/goblin/sea
	breast_organ = /obj/item/organ/genitals/filling_organ/breasts/goblin/sea
	ass_organ = /obj/item/organ/genitals/butt/goblin/sea
	penis_organ = /obj/item/organ/genitals/penis/goblin/sea

/mob/living/carbon/human/species/goblin/npc/sea
	ball_organ = /obj/item/organ/genitals/filling_organ/testicles/goblin/sea
	breast_organ = /obj/item/organ/genitals/filling_organ/breasts/goblin/sea
	ass_organ = /obj/item/organ/genitals/butt/goblin/sea
	penis_organ = /obj/item/organ/genitals/penis/goblin/sea

/mob/living/carbon/human/species/goblin/npc/ambush/sea
	ball_organ = /obj/item/organ/genitals/filling_organ/testicles/goblin/sea
	breast_organ = /obj/item/organ/genitals/filling_organ/breasts/goblin/sea
	ass_organ = /obj/item/organ/genitals/butt/goblin/sea
	penis_organ = /obj/item/organ/genitals/penis/goblin/sea

/mob/living/carbon/human/species/goblin/moon
	ball_organ = /obj/item/organ/genitals/filling_organ/testicles/goblin/moon
	breast_organ = /obj/item/organ/genitals/filling_organ/breasts/goblin/moon
	ass_organ = /obj/item/organ/genitals/butt/goblin/moon
	penis_organ = /obj/item/organ/genitals/penis/goblin/moon

/mob/living/carbon/human/species/goblin/npc/moon
	ball_organ = /obj/item/organ/genitals/filling_organ/testicles/goblin/moon
	breast_organ = /obj/item/organ/genitals/filling_organ/breasts/goblin/moon
	ass_organ = /obj/item/organ/genitals/butt/goblin/moon
	penis_organ = /obj/item/organ/genitals/penis/goblin/moon

/mob/living/carbon/human/species/goblin/npc/ambush/moon
	ball_organ = /obj/item/organ/genitals/filling_organ/testicles/goblin/moon
	breast_organ = /obj/item/organ/genitals/filling_organ/breasts/goblin/moon
	ass_organ = /obj/item/organ/genitals/butt/goblin/moon
	penis_organ = /obj/item/organ/genitals/penis/goblin/moon
