// --vide noir

/mob/living/simple_animal/hostile/retaliate/rogue/wolf/werewolf
	icon = 'icons/roguetown/mob/monster/werewolf.dmi'
	name = "verevolf"
	icon_living = "wwolf_m"
	see_in_dark = 8
	base_intents = list(/datum/intent/simple/werewolf)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 6,
						/obj/item/natural/hide = 6,
						/obj/item/natural/fur = 4, /obj/item/natural/bone = 8, /obj/item/natural/volf_head = 1)
	maxHealth = 450
	health = 450
	melee_damage_lower = 22
	melee_damage_upper = 29
	STASTR = 20
	STAEND = 20
	STASPD = 20
	obj_damage = 20
	move_to_delay = 3
	environment_smash = ENVIRONMENT_SMASH_STRUCTURES
	milkies = TRUE
	food_type = list(/obj/item/reagent_containers/food/snacks/rogue/meat, /obj/item/bodypart, /obj/item/organ)
	footstep_type = FOOTSTEP_MOB_HEAVY
	del_on_deaggro = 0
//	stat_attack = UNCONSCIOUS
	remains_type = /obj/effect/decal/remains/wolf
	erpable = TRUE

/mob/living/simple_animal/hostile/retaliate/rogue/wolf/werewolf/Initialize()
	. = ..()
	gender = MALE
	if(prob(33))
		milkies = TRUE
		gender = FEMALE
	give_genitals()
	if(gender == MALE)
		icon_state = "wwolf_m"
		icon_dead = "wwolf_md"
	else
		icon_state = "wwolf_f"
		icon_dead = "wwolf_fd"
	update_icon()

/mob/living/simple_animal/hostile/retaliate/rogue/wolf/werewolf/death(gibbed)
	..()
	update_icon()

// Eyes that glow in the dark. They float over kybraxor pits at the moment.
/mob/living/simple_animal/hostile/retaliate/rogue/wolf/werewolf/update_icon()
	cut_overlays()
	..()
	if(stat != DEAD)
		var/mutable_appearance/eye_lights = mutable_appearance(icon, "vve")
		eye_lights.plane = 19
		eye_lights.layer = 19
		add_overlay(eye_lights)

/mob/living/simple_animal/hostile/retaliate/rogue/wolf/werewolf/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/vo/mobs/vw/aggro (1).ogg','sound/vo/mobs/vw/aggro (2).ogg')
		if("pain")
			return pick('sound/vo/mobs/vw/pain (1).ogg','sound/vo/mobs/vw/pain (2).ogg','sound/vo/mobs/vw/pain (3).ogg')
		if("death")
			return pick('sound/vo/mobs/vw/death (1).ogg','sound/vo/mobs/vw/death (2).ogg','sound/vo/mobs/vw/death (3).ogg','sound/vo/mobs/vw/death (4).ogg','sound/vo/mobs/vw/death (5).ogg')
		if("idle")
			return pick('sound/vo/mobs/vw/idle (1).ogg','sound/vo/mobs/vw/idle (2).ogg','sound/vo/mobs/vw/idle (3).ogg','sound/vo/mobs/vw/idle (4).ogg')
		if("cidle")
			return pick('sound/vo/mobs/vw/bark (1).ogg','sound/vo/mobs/vw/bark (2).ogg','sound/vo/mobs/vw/bark (3).ogg','sound/vo/mobs/vw/bark (4).ogg','sound/vo/mobs/vw/bark (5).ogg','sound/vo/mobs/vw/bark (6).ogg','sound/vo/mobs/vw/bark (7).ogg')

/mob/living/simple_animal/hostile/retaliate/rogue/wolf/werewolf/taunted(mob/user)
	emote("aggro")
	Retaliate()
	GiveTarget(user)
	return

/mob/living/simple_animal/hostile/retaliate/rogue/wolf/werewolf/Life()
	..()
	if(pulledby)
		Retaliate()
		GiveTarget(pulledby)

/mob/living/simple_animal/hostile/retaliate/rogue/wolf/werewolf/simple_limb_hit(zone)
	if(!zone)
		return ""
	switch(zone)
		if(BODY_ZONE_PRECISE_R_EYE)
			return "head"
		if(BODY_ZONE_PRECISE_L_EYE)
			return "head"
		if(BODY_ZONE_PRECISE_NOSE)
			return "nose"
		if(BODY_ZONE_PRECISE_MOUTH)
			return "mouth"
		if(BODY_ZONE_PRECISE_SKULL)
			return "head"
		if(BODY_ZONE_PRECISE_EARS)
			return "head"
		if(BODY_ZONE_PRECISE_NECK)
			return "neck"
		if(BODY_ZONE_PRECISE_L_HAND)
			return "foreleg"
		if(BODY_ZONE_PRECISE_R_HAND)
			return "foreleg"
		if(BODY_ZONE_PRECISE_L_FOOT)
			return "leg"
		if(BODY_ZONE_PRECISE_R_FOOT)
			return "leg"
		if(BODY_ZONE_PRECISE_STOMACH)
			return "stomach"
		if(BODY_ZONE_PRECISE_GROIN)
			return "tail"
		if(BODY_ZONE_HEAD)
			return "head"
		if(BODY_ZONE_R_LEG)
			return "leg"
		if(BODY_ZONE_L_LEG)
			return "leg"
		if(BODY_ZONE_R_ARM)
			return "foreleg"
		if(BODY_ZONE_L_ARM)
			return "foreleg"
	return ..()

/mob/living/simple_animal/hostile/retaliate/rogue/wolf/werewolf/safe
	aggressive = 0
	tame = 1

/mob/living/simple_animal/hostile/retaliate/rogue/wolf/werewolf/horny
	seeksfuck = TRUE

/mob/living/simple_animal/hostile/retaliate/rogue/wolf/werewolf/safe/horny
	seeksfuck = TRUE
	color = "#ffc6e2"
