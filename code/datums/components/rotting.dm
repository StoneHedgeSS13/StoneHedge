/datum/component/rot
	var/amount = 0
	var/last_process = 0
	var/datum/looping_sound/fliesloop/soundloop

/datum/component/rot/Initialize(new_amount)
	..()
	if(!isatom(parent))
		return COMPONENT_INCOMPATIBLE

	if(new_amount)
		amount = new_amount

	soundloop = new(list(parent), FALSE)

	START_PROCESSING(SSroguerot, src)

/datum/component/rot/Destroy()
	STOP_PROCESSING(SSroguerot, src)
	if(soundloop)
		soundloop.stop()
	. = ..()

/datum/component/rot/process()
	var/amt2add = 10 //1 second
	if(last_process)
		amt2add = ((world.time - last_process)/10) * amt2add
	last_process = world.time
	amount += amt2add
	return

/datum/component/rot/corpse/Initialize()
	if(!iscarbon(parent))
		return COMPONENT_INCOMPATIBLE
	. = ..()

/datum/component/rot/corpse/process()
	..()
	var/mob/living/carbon/C = parent
	var/is_zombie
	if(C.mind)
		if(C.mind.has_antag_datum(/datum/antagonist/zombie))
			is_zombie = TRUE
	if(!is_zombie)
		if(C.stat != DEAD)
			qdel(src)
			return


	if(!(C.mob_biotypes & (MOB_ORGANIC|MOB_UNDEAD)))
		qdel(src)
		return
	
	if(amount > 10 MINUTES) //screw it we're just making it over twice the wait
		if(is_zombie)
			var/datum/antagonist/zombie/Z = C.mind.has_antag_datum(/datum/antagonist/zombie)
			if(Z && !Z.has_turned && !Z.revived && C.stat == DEAD)
				Z.wake_zombie()

	var/findonerotten = FALSE
	var/shouldupdate = FALSE
	var/dustme = FALSE
	for(var/obj/item/bodypart/B in C.bodyparts)
		if(!B.skeletonized && B.is_organic_limb())
			if(!B.rotted)
				if(amount > 20 MINUTES)
					B.rotted = TRUE
					findonerotten = TRUE
					shouldupdate = TRUE
					C.change_stat("constitution", -8, "rottenlimbs")
			else
				if(amount > 30 MINUTES)
					if(!is_zombie)
						if(C.dna && C.dna.species)
							C.dna.species.species_traits |= NOBLOOD
						C.change_stat("constitution", -99)
						shouldupdate = TRUE
				else
					findonerotten = TRUE
		if(amount > 40 MINUTES)
			if(!is_zombie)
				if(B.skeletonized)
					if(!B.owner.client) //so cliented mfers dont get dusted.
						dustme = TRUE
	if(dustme)
		//stonehedge mob decomposition
		C.visible_message(span_smallgreen("[C] decomposes..."))
		var/datum/reagents/R = new/datum/reagents(5)
		R.add_reagent(/datum/reagent/toxin/organpoison, 5)
		var/datum/effect_system/smoke_spread/chem/smoke = new
		smoke.set_up(R, 2, get_turf(C), FALSE)
		smoke.start()
		//stonehedge mob decomposition end
		qdel(src)
		return C.dust(drop_items=TRUE)

	if(findonerotten)
		var/turf/open/T = C.loc
		if(istype(T))
			T.add_pollutants(/datum/pollutant/rot, 5)
			if(soundloop && soundloop.stopped && !is_zombie)
				soundloop.start()
		else
			if(soundloop && !soundloop.stopped)
				soundloop.stop()
	else
		if(soundloop && !soundloop.stopped)
			soundloop.stop()
	if(shouldupdate)
		if(findonerotten)
			if(ishuman(C))
				var/mob/living/carbon/human/H = C
				H.skin_tone = "878f79" //elf ears
			if(soundloop && soundloop.stopped && !is_zombie)
				soundloop.start()
		C.update_body()

/datum/component/rot/simple/process()
	..()
	var/mob/living/simple_animal/L = parent
	if(L.stat != DEAD)
		qdel(src)
		return
	if(amount > 15 MINUTES)
		if(soundloop && soundloop.stopped)
			soundloop.start()
		var/turf/open/T = get_turf(L)
		if(istype(T))
			T.add_pollutants(/datum/pollutant/rot, 5)
	if(amount > 20 MINUTES)
		//stonehedge simple mob decomposition
		L.visible_message(span_smallgreen("[L] decomposes..."))
		var/datum/reagents/R = new/datum/reagents(5)
		R.add_reagent(/datum/reagent/toxin/organpoison, 5)
		var/datum/effect_system/smoke_spread/chem/smoke = new
		smoke.set_up(R, 2, get_turf(L), FALSE)
		smoke.start()
		//stonehedge simple mob decomposition end
		qdel(src)
		return L.dust(drop_items=TRUE)

/datum/component/rot/gibs
	amount = MIASMA_GIBS_MOLES

/datum/looping_sound/fliesloop
	mid_sounds = list('sound/misc/fliesloop.ogg')
	mid_length = 60
	volume = 30
	extra_range = 0
