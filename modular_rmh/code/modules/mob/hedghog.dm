/obj/item/reagent_containers/food/snacks/ebjik
	name = "hedgehog"
	desc = ""
	icon_state = "egek_mob"
	icon = 'modular_rmh/icons/mob/monster/egiki.dmi'
	list_reagents = list(/datum/reagent/consumable/nutriment = 5)
	foodtype = RAW
	verb_say = "squeaks"
	verb_yell = "squeaks"
	pass_flags = PASSDOORS
	obj_flags = CAN_BE_HIT
	var/dead = FALSE
	eat_effect = /datum/status_effect/debuff/uncookedfood
	max_integrity = 10
	sellprice = 0
	rotprocess = null

/obj/item/reagent_containers/food/snacks/ebjik/onbite(mob/living/carbon/human/user)
	if(loc == user)
		if(user.clan)
			if(do_after(user, 3 DECISECONDS, src))
				user.visible_message("<span class='warning'>[user] drinks from [src]!</span>",\
				"<span class='warning'>I drink from [src].</span>")
				playsound(user.loc, 'sound/misc/drink_blood.ogg', 100, FALSE, -4)

				user.adjust_bloodpool(50)
				var/blood_handle = BLOOD_PREFERENCE_RATS
				if(dead)
					blood_handle |= BLOOD_PREFERENCE_DEAD
				else
					blood_handle |= BLOOD_PREFERENCE_LIVING
				user.clan.handle_bloodsuck(user, blood_handle)
				playsound(get_turf(user), 'sound/vo/mobs/rat/rat_death.ogg', 100, FALSE, -1)
				if(dead)
					qdel(src)
					return
				icon_state = "egek_v_varenie"
				rotprocess = SHELFLIFE_SHORT
				dead = TRUE
			return
	return ..()

/obj/item/reagent_containers/food/snacks/ebjik/Crossed(mob/living/L)
	. = ..()
	if(L)
		if(!dead)
			if(isturf(loc))
				dir = pick(GLOB.cardinals)
				step(src, dir)

/obj/item/reagent_containers/food/snacks/ebjik/dead
	icon_state = "egek_v_varenie"
	dead = TRUE
	rotprocess = SHELFLIFE_SHORT

/obj/item/reagent_containers/food/snacks/ebjik/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)
	if(dead)
		icon_state = "egek_v_varenie"
		rotprocess = SHELFLIFE_SHORT

/obj/item/reagent_containers/food/snacks/ebjik/attack_hand(mob/user)
	if(isliving(user))
		var/mob/living/L = user
		if(!(L.mobility_flags & MOBILITY_PICKUP))
			return
	user.changeNext_move(CLICK_CD_MELEE)
	if(dead)
		..()
	else
		if(!isturf(loc))
			if(isliving(user))
				var/mob/living/L = user
				if(prob(L.STASPD * 1.5))
					..()
				else
					if(item_flags & IN_STORAGE)
						..()
					else
						dir = pick(GLOB.cardinals)
						step(src, dir)
						to_chat(user, "<span class='warning'>I fail to snatch it by the tail!</span>")
						playsound(src, pick('sound/vo/mobs/rat/rat_life.ogg','sound/vo/mobs/rat/rat_life2.ogg','sound/vo/mobs/rat/rat_life3.ogg'), 100, TRUE, -1)
						return
	..()

/obj/item/reagent_containers/food/snacks/ebjik/process()
	..()
	if(dead)
		return
	if(!isturf(loc))
		return
	if(prob(5))
		playsound(src, pick('sound/vo/mobs/rat/rat_life.ogg','sound/vo/mobs/rat/rat_life2.ogg','sound/vo/mobs/rat/rat_life3.ogg'), 100, TRUE, -1)
	if(prob(75) && !dead)
		dir = pick(GLOB.cardinals)
		step(src, dir)




/obj/item/reagent_containers/food/snacks/ebjik/atom_destruction(damage_flag)
	if(!dead)
		new /obj/item/reagent_containers/food/snacks/ebjik/dead(src)
		playsound(src, 'sound/vo/mobs/rat/rat_death.ogg', 100, FALSE, -1)
		qdel(src)
		return 1
	return ..()

/obj/item/reagent_containers/food/snacks/ebjik/attackby(obj/item/I, mob/user, params)
	if(!dead)
		if(isliving(user))
			var/mob/living/L = user
			if(prob(L.STASPD * 2))
				..()
			else
				if(isturf(loc))
					dir = pick(GLOB.cardinals)
					step(src, dir)
					to_chat(user, "<span class='warning'>The vermin dodges my attack.</span>")
					playsound(src, pick('sound/vo/mobs/rat/rat_life.ogg','sound/vo/mobs/rat/rat_life2.ogg','sound/vo/mobs/rat/rat_life3.ogg'), 100, TRUE, -1)
					return
	..()

/mob/living/simple_animal/hostile/retaliate/ebjik
    name = "ebjik"
    desc = "Small and spiky walking ball."
    icon_state = "egek_mob"
    icon = 'modular_rmh/icons/mob/monster/egiki.dmi'
    mob_biotypes = MOB_ORGANIC|MOB_BEAST
    speak = list("squeaks")
    speak_chance = 1
    maxHealth = 15
    health = 15
    melee_damage_lower = 5
    melee_damage_upper = 5
    attack_verb_continuous = "bites"
    attack_verb_simple = "bite"
    response_help_continuous = "pets"
    response_help_simple = "pet"
    density = FALSE
    ventcrawler = VENTCRAWLER_ALWAYS
    faction = list("hostile")
    attack_sound = 'sound/blank.ogg'
    pass_flags = PASSTABLE | PASSGRILLE | PASSMOB
    mob_size = MOB_SIZE_TINY
    var/stepped_sound = 'sound/blank.ogg'
