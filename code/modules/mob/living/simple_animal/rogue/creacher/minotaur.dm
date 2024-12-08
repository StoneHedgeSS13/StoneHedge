/mob/living/simple_animal/hostile/retaliate/rogue/minotaur_old
	icon = 'icons/roguetown/mob/monster/minotaur.dmi'
	name = "Minotaur"
	icon_state = "Gor"
	icon_living = "Gor"
	icon_dead = "GorD"
	gender = MALE
	emote_hear = null
	emote_see = null
	speak_chance = 1
	turns_per_move = 2
	see_in_dark = 10
	move_to_delay = 3
	base_intents = list(/datum/intent/simple/bite)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 10,
						/obj/item/natural/hide = 10, /obj/item/natural/bundle/bone/full = 2)
	faction = list("caves")
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	health = 300
	maxHealth = 400
	melee_damage_lower = 45
	melee_damage_upper = 70
	vision_range = 3
	aggro_vision_range = 4
	environment_smash = ENVIRONMENT_SMASH_NONE
	retreat_distance = 0
	minimum_distance = 0
	milkies = FALSE
	food_type = list(/obj/item/reagent_containers/food/snacks/rogue/meat, /obj/item/bodypart, /obj/item/organ)
	footstep_type = FOOTSTEP_MOB_HEAVY
	pooptype = null
	STACON = 19
	STASTR = 16
	STASPD = 5
	deaggroprob = 0
	defprob = 40
	defdrain = 10
	del_on_deaggro = 44 SECONDS
	retreat_health = 0
	food = 0
	attack_sound = list('sound/combat/wooshes/blunt/wooshhuge (1).ogg','sound/combat/wooshes/blunt/wooshhuge (2).ogg','sound/combat/wooshes/blunt/wooshhuge (3).ogg')
	dodgetime = 0
	aggressive = 1
//	stat_attack = UNCONSCIOUS

/mob/living/simple_animal/hostile/retaliate/rogue/troll/blood
	name = "FLESH HOMUNCULUS"
	desc = null
	hud_type = /datum/hud/human
	icon_state = "FLESH"
	icon_living = "FLESH"
	icon = 'icons/mob/mob.dmi'
	mob_biotypes = MOB_EPIC
	STACON = 10
	STASTR = 19
	STASPD = 1
	STAEND = 11

/mob/living/simple_animal/hostile/retaliate/rogue/troll/blood/ascended
	name = "???"
	desc = null
	hud_type = /datum/hud/human
	icon_state = "ascend"
	icon_living = "ascend"
	icon = 'icons/mob/32x64.dmi'
	base_intents = list(/datum/intent/unarmed/ascendedclaw)
	health = 750
	maxHealth = 750
	melee_damage_lower = 55
	melee_damage_upper = 80
	STACON = 20
	STASTR = 20
	STASPD = 20
	STAEND = 20

/mob/living/simple_animal/hostile/retaliate/rogue/troll/blood/ascended/examine(mob/user)
	. = ..()
	. += "<span class='cultbigbold'>MY MIND CAN NOT COMPREHEND!!!</span>"
	if(ishuman(user) && !iscultist(user))
		var/mob/living/carbon/human/userhuman = user
		userhuman.freak_out(3) //may give you a heart attack if the initial mass stress is still on you.

/mob/living/simple_animal/hostile/retaliate/rogue/troll/blood/ascended/Initialize()
	. = ..()
	set_light(5,5, LIGHT_COLOR_PURPLE)

/mob/living/simple_animal/hostile/retaliate/rogue/troll/blood/ascended/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/misc/HL (1).ogg','sound/misc/HL (2).ogg','sound/misc/HL (3).ogg','sound/misc/HL (4).ogg','sound/misc/HL (5).ogg','sound/misc/HL (6).ogg')
		if("pain")
			return pick('sound/misc/HL (1).ogg','sound/misc/HL (2).ogg','sound/misc/HL (3).ogg','sound/misc/HL (4).ogg','sound/misc/HL (5).ogg','sound/misc/HL (6).ogg')
		if("death")
			return pick('sound/misc/HL (1).ogg','sound/misc/HL (2).ogg','sound/misc/HL (3).ogg','sound/misc/HL (4).ogg','sound/misc/HL (5).ogg','sound/misc/HL (6).ogg')
		if("idle")
			return pick('sound/misc/HL (1).ogg','sound/misc/HL (2).ogg','sound/misc/HL (3).ogg','sound/misc/HL (4).ogg','sound/misc/HL (5).ogg','sound/misc/HL (6).ogg')
		if("cidle")
			return pick('sound/misc/HL (1).ogg','sound/misc/HL (2).ogg','sound/misc/HL (3).ogg','sound/misc/HL (4).ogg','sound/misc/HL (5).ogg','sound/misc/HL (6).ogg')

/mob/living/simple_animal/hostile/retaliate/rogue/troll/blood/death(gibbed)
	. = ..()
	var/datum/game_mode/chaosmode/CM = SSticker.mode
	for(var/mob/living/carbon/V in GLOB.human_list)
		if(V.mind in CM.cultists)
			to_chat(V, span_danger("WE FAILED, THE NEW GOD HAS FALLEN!!! I CANT.. OH NO!!! THE DIVINE LIGHT RETURNS TO THIS AREA!!! "))
			V.gib()
		else
			to_chat(V, span_greenannounce("THE DIVINE LIGHT RETURNS TO US!!!"))
			V.remove_stress(/datum/stressevent/hatezizo)
			V.add_stress(/datum/stressevent/zizodefeated)
	gib()
	qdel(src)

/mob/living/simple_animal/hostile/retaliate/rogue/troll/death(gibbed)
	..()
	update_icon()

/mob/living/simple_animal/hostile/retaliate/rogue/minotaur_old/taunted(mob/user)
	emote("aggro")
	Retaliate()
	GiveTarget(user)
	return

/mob/living/simple_animal/hostile/retaliate/rogue/minotaur_old/Life()
	..()
	if(pulledby)
		Retaliate()
		GiveTarget(pulledby)

/mob/living/simple_animal/hostile/retaliate/rogue/minotaur_old/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/vo/mobs/minotaur/minoroar.ogg','sound/vo/mobs/minotaur/minoroar2.ogg','sound/vo/mobs/minotaur/minoroar3.ogg','sound/vo/mobs/minotaur/minoroar4.ogg')
		if("pain")
			return pick('sound/vo/mobs/minotaur/minopain.ogg', 'sound/vo/mobs/minotaur/minopain2.ogg')
		if("death")
			return pick('sound/vo/mobs/minotaur/minodie.ogg', 'sound/vo/mobs/minotaur/minodie2.ogg')
		if("idle")
			return pick('sound/vo/mobs/minotaur/minoidle.ogg', 'sound/vo/mobs/minotaur/minoidle2.ogg')


/mob/living/simple_animal/hostile/retaliate/rogue/minotaur_old/simple_limb_hit(zone)
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

