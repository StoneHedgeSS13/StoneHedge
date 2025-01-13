#include "../../antagonists/collar_master/collar_master.dm"

#define COMSIG_MOB_ATTACK "mob_attack"
#define COMSIG_MOB_SAY "mob_say"
#define COMSIG_MOB_CLICKON "mob_clickon"
#define COMSIG_ITEM_PRE_UNEQUIP "item_pre_unequip"
#define COMPONENT_CANCEL_ATTACK "cancel_attack"
#define COMPONENT_CANCEL_SAY "cancel_say"
#define COMPONENT_ITEM_BLOCK_UNEQUIP (1<<0)

/obj/item/clothing/neck
	name = "necklace"
	icon = 'icons/obj/clothing/neck.dmi'
	body_parts_covered = NECK
	slot_flags = ITEM_SLOT_NECK
	strip_delay = 40
	equip_delay_other = 40
	bloody_icon_state = "bodyblood"

/obj/item/clothing/neck/worn_overlays(isinhands = FALSE)
	. = list()
//	if(!isinhands)
//		if(body_parts_covered & HEAD)
//			if(damaged_clothes)
//				. += mutable_appearance('icons/effects/item_damage.dmi', "damagedmask")
//			if(HAS_BLOOD_DNA(src))
//				. += mutable_appearance('icons/effects/blood.dmi', "maskblood")

/obj/item/clothing/neck/tie
	name = "tie"
	desc = ""
	icon = 'icons/obj/clothing/neck.dmi'
	icon_state = "bluetie"
	item_state = ""	//no inhands
	w_class = WEIGHT_CLASS_SMALL
	custom_price = 15

/obj/item/clothing/neck/tie/blue
	name = "blue tie"
	icon_state = "bluetie"

/obj/item/clothing/neck/tie/red
	name = "red tie"
	icon_state = "redtie"

/obj/item/clothing/neck/tie/black
	name = "black tie"
	icon_state = "blacktie"

/obj/item/clothing/neck/tie/horrible
	name = "horrible tie"
	desc = ""
	icon_state = "horribletie"

/obj/item/clothing/neck/tie/detective
	name = "loose tie"
	desc = ""
	icon_state = "detective"

/obj/item/clothing/neck/stethoscope
	name = "stethoscope"
	desc = ""
	icon_state = "stethoscope"

/obj/item/clothing/neck/stethoscope/suicide_act(mob/living/carbon/user)
	user.visible_message(span_suicide("[user] puts \the [src] to [user.p_their()] chest! It looks like [user.p_they()] wont hear much!"))
	return OXYLOSS

/obj/item/clothing/neck/stethoscope/attack(mob/living/carbon/human/M, mob/living/user)
	if(ishuman(M) && isliving(user))
		if(user.used_intent.type == INTENT_HELP)
			var/body_part = parse_zone(user.zone_selected)

			var/heart_strength = span_danger("no")
			var/lung_strength = span_danger("no")

			var/obj/item/organ/heart/heart = M.getorganslot(ORGAN_SLOT_HEART)
			var/obj/item/organ/lungs/lungs = M.getorganslot(ORGAN_SLOT_LUNGS)

			if(!(M.stat == DEAD || (HAS_TRAIT(M, TRAIT_FAKEDEATH))))
				if(heart && istype(heart))
					heart_strength = span_danger("an unstable")
					if(heart.beating)
						heart_strength = "a healthy"
				if(lungs && istype(lungs))
					lung_strength = span_danger("strained")
					if(!(M.failed_last_breath || M.losebreath))
						lung_strength = "healthy"

			if(M.stat == DEAD && heart && world.time - M.timeofdeath < DEFIB_TIME_LIMIT * 10)
				heart_strength = span_boldannounce("a faint, fluttery")

			var/diagnosis = (body_part == BODY_ZONE_CHEST ? "You hear [heart_strength] pulse and [lung_strength] respiration." : "You faintly hear [heart_strength] pulse.")
			user.visible_message(span_notice("[user] places [src] against [M]'s [body_part] and listens attentively."), span_notice("I place [src] against [M]'s [body_part]. [diagnosis]"))
			return
	return ..(M,user)

///////////
//SCARVES//
///////////

/obj/item/clothing/neck/scarf //Default white color, same functionality as beanies.
	name = "white scarf"
	icon_state = "scarf"
	desc = ""
	dog_fashion = /datum/dog_fashion/head
	custom_price = 10

/obj/item/clothing/neck/scarf/black
	name = "black scarf"
	icon_state = "scarf"
	color = "#4A4A4B" //Grey but it looks black

/obj/item/clothing/neck/scarf/pink
	name = "pink scarf"
	icon_state = "scarf"
	color = "#F699CD" //Pink

/obj/item/clothing/neck/scarf/red
	name = "red scarf"
	icon_state = "scarf"
	color = "#D91414" //Red

/obj/item/clothing/neck/scarf/green
	name = "green scarf"
	icon_state = "scarf"
	color = "#5C9E54" //Green

/obj/item/clothing/neck/scarf/darkblue
	name = "dark blue scarf"
	icon_state = "scarf"
	color = "#1E85BC" //Blue

/obj/item/clothing/neck/scarf/purple
	name = "purple scarf"
	icon_state = "scarf"
	color = "#9557C5" //Purple

/obj/item/clothing/neck/scarf/yellow
	name = "yellow scarf"
	icon_state = "scarf"
	color = "#E0C14F" //Yellow

/obj/item/clothing/neck/scarf/orange
	name = "orange scarf"
	icon_state = "scarf"
	color = "#C67A4B" //Orange

/obj/item/clothing/neck/scarf/cyan
	name = "cyan scarf"
	icon_state = "scarf"
	color = "#54A3CE" //Cyan


//Striped scarves get their own icons

/obj/item/clothing/neck/scarf/zebra
	name = "zebra scarf"
	icon_state = "zebrascarf"

/obj/item/clothing/neck/scarf/christmas
	name = "christmas scarf"
	icon_state = "christmasscarf"

//The three following scarves don't have the scarf subtype
//This is because Ian can equip anything from that subtype
//However, these 3 don't have corgi versions of their sprites
/obj/item/clothing/neck/stripedredscarf
	name = "striped red scarf"
	icon_state = "stripedredscarf"
	custom_price = 10

/obj/item/clothing/neck/stripedgreenscarf
	name = "striped green scarf"
	icon_state = "stripedgreenscarf"
	custom_price = 10

/obj/item/clothing/neck/stripedbluescarf
	name = "striped blue scarf"
	icon_state = "stripedbluescarf"
	custom_price = 10

/obj/item/clothing/neck/petcollar
	name = "pet collar"
	desc = ""
	icon_state = "petcollar"
	var/tagname = null

/obj/item/clothing/neck/petcollar/mob_can_equip(mob/M, mob/equipper, slot, disable_warning = 0)
	if(ishuman(M))
		return FALSE
	return ..()

/obj/item/clothing/neck/petcollar/attack_self(mob/user)
	tagname = copytext(sanitize(input(user, "Would you like to change the name on the tag?", "Name your new pet", "Spot") as null|text),1,MAX_NAME_LEN)
	name = "[initial(name)] - [tagname]"

//////////////
//DOPE BLING//
//////////////

/obj/item/clothing/neck/necklace/dope
	name = "gold necklace"
	desc = ""
	icon = 'icons/obj/clothing/neck.dmi'
	icon_state = "bling"

/obj/item/clothing/neck/neckerchief
	icon = 'icons/obj/clothing/masks.dmi' //In order to reuse the bandana sprite
	w_class = WEIGHT_CLASS_TINY
	var/sourceBandanaType

/obj/item/clothing/neck/neckerchief/worn_overlays(isinhands)
	. = ..()
	if(!isinhands)
		var/mutable_appearance/realOverlay = mutable_appearance('icons/mob/clothing/mask.dmi', icon_state)
		realOverlay.pixel_y = -3
		. += realOverlay

/obj/item/clothing/neck/neckerchief/AltClick(mob/user)
	. = ..()
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		if(C.get_item_by_slot(SLOT_NECK) == src)
			to_chat(user, span_warning("I can't untie [src] while wearing it!"))
			return
		if(user.is_holding(src))
			var/obj/item/clothing/mask/bandana/newBand = new sourceBandanaType(user)
			var/currentHandIndex = user.get_held_index_of_item(src)
			var/oldName = src.name
			qdel(src)
			user.put_in_hand(newBand, currentHandIndex)
			user.visible_message(span_notice("I untie [oldName] back into a [newBand.name]."), span_notice("[user] unties [oldName] back into a [newBand.name]."))
		else
			to_chat(user, span_warning("I must be holding [src] in order to untie it!"))

/obj/item/clothing/neck/roguetown/cursed_collar
	name = "cursed collar"
	desc = "A sinister looking collar with emerald studs. It seems to radiate a dark energy."
	icon_state = "listenstone"
	item_state = "listenstone"
	w_class = WEIGHT_CLASS_SMALL
	slot_flags = ITEM_SLOT_NECK
	body_parts_covered = NECK
	var/mob/living/carbon/human/victim = null
	var/mob/living/carbon/human/collar_master = null
	var/listening = FALSE
	var/silenced = FALSE
	resistance_flags = INDESTRUCTIBLE
	armor = list("blunt" = 0, "slash" = 0, "stab" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/neck/roguetown/cursed_collar/proc/handle_speech(datum/source, list/speech_args)
	SIGNAL_HANDLER
	if(silenced)
		speech_args[SPEECH_MESSAGE] = ""
		var/mob/living/carbon/human/H = source
		if(istype(H))
			H.say("*[pick(list(
				"whines softly.",
				"makes a pitiful noise.",
				"whimpers.",
				"lets out a submissive bark.",
				"mewls pathetically."
			))]")
		return COMPONENT_CANCEL_SAY
	return NONE

/obj/item/clothing/neck/roguetown/cursed_collar/proc/check_attack(datum/source, atom/target)
	SIGNAL_HANDLER
	if(!istype(target, /mob/living/carbon/human))
		return NONE

	if(target == collar_master)
		to_chat(source, span_warning("The collar sends painful shocks through your body as you try to attack your master!"))
		var/mob/living/carbon/human/H = source
		H.electrocute_act(25, src, flags = SHOCK_NOGLOVES)
		H.Paralyze(600) // 1 minute stun
		playsound(H, 'sound/blank.ogg', 50, TRUE)
		return COMPONENT_CANCEL_ATTACK
	return NONE

/obj/item/clothing/neck/roguetown/cursed_collar/attack(mob/living/carbon/human/M, mob/living/carbon/human/user)
	if(!istype(M) || !istype(user))
		return ..()

	if(M.get_item_by_slot(SLOT_NECK))
		to_chat(user, span_warning("[M] is already wearing something around their neck!"))
		return

	if(!do_mob(user, M, 50))
		return

	victim = M
	collar_master = user
	if(!M.equip_to_slot_if_possible(src, SLOT_NECK, 0, 0, 1))
		to_chat(user, span_warning("You fail to collar [M]!"))
		victim = null
		collar_master = null
		return

	ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)
	to_chat(M, span_userdanger("The collar snaps shut around your neck!"))
	to_chat(user, span_notice("You successfully collar [M]."))

	if(user.mind)
		var/datum/antagonist/collar_master/CM = new()
		CM.my_collar = src
		user.mind.add_antag_datum(CM)

/obj/item/clothing/neck/roguetown/cursed_collar/Destroy()
	victim = null
	collar_master = null
	return ..()

/obj/item/clothing/neck/roguetown/cursed_collar/equipped(mob/user, slot)
	. = ..()
	if(slot == SLOT_NECK && user == victim)
		RegisterSignal(src, COMSIG_ITEM_PRE_UNEQUIP, PROC_REF(prevent_removal))
		RegisterSignal(user, COMSIG_MOB_SAY, PROC_REF(handle_speech))
		RegisterSignal(user, COMSIG_MOB_CLICKON, PROC_REF(check_attack))

/obj/item/clothing/neck/roguetown/cursed_collar/proc/prevent_removal(datum/source, mob/living/carbon/human/user)
	SIGNAL_HANDLER
	if(user == victim)
		to_chat(user, span_userdanger("The collar's magic holds it firmly in place! You can't remove it!"))
		playsound(user, 'sound/blank.ogg', 50, TRUE)
		return COMPONENT_ITEM_BLOCK_UNEQUIP
	return NONE
