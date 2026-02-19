/mob/living/carbon/Initialize()
	. = ..()

	addtimer(CALLBACK(src, PROC_REF(make_bodyparts_undismemberable)), 10)

/mob/living/carbon/proc/make_bodyparts_undismemberable()
	if(!client)
		return

	for(var/obj/item/bodypart/chest/C in src.bodyparts)
		C.dismemberable = 0
	for(var/obj/item/bodypart/head/H in src.bodyparts)
		H.dismemberable = 0
	for(var/obj/item/bodypart/l_arm/LA in src.bodyparts)
		LA.dismemberable = 0
	for(var/obj/item/bodypart/r_arm/RA in src.bodyparts)
		RA.dismemberable = 0
	for(var/obj/item/bodypart/l_leg/LL in src.bodyparts)
		LL.dismemberable = 0
	for(var/obj/item/bodypart/r_leg/RL in src.bodyparts)
		RL.dismemberable = 0
