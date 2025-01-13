#define COMSIG_MOB_TAB_OPENED "mob_tab_opened"
#define COMPONENT_CANCEL_ATTACK "cancel_attack"
#define COMSIG_MOB_SAY "mob_say"
#define COMPONENT_CANCEL_SAY "cancel_say"

#define SLOT_BACK      "back"
#define SLOT_MASK      "mask"
#define SLOT_HEAD      "head"
#define SLOT_GLASSES   "eyes"
#define SLOT_EARS      "ears"
#define SLOT_ARMOR     "armor"
#define SLOT_GLOVES    "gloves"
#define SLOT_SHOES     "shoes"
#define SLOT_BELT      "belt"
#define SLOT_ID        "id"
#define SLOT_S_STORE   "s_store"
#define SLOT_L_STORE   "l_store"
#define SLOT_R_STORE   "r_store"
#define SLOT_W_UNIFORM "w_uniform"
#define SLOT_WEAR_SUIT "wear_suit"

/datum/antagonist/collar_master
    name = "Collar Master"
    antagpanel_category = "Other"
    show_in_antagpanel = FALSE
    show_name_in_check_antagonists = FALSE
    var/obj/item/clothing/neck/roguetown/cursed_collar/my_collar
    var/static/list/animal_sounds = list(
        "lets out a whimper!",
        "whines softly.",
        "makes a pitiful noise.",
        "whimpers.",
        "lets out a submissive bark.",
        "mewls pathetically."
    )

/datum/antagonist/collar_master/on_gain()
    . = ..()
    owner.current.verbs += list(
        /mob/proc/collar_scry,
        /mob/proc/collar_listen,
        /mob/proc/collar_shock,
        /mob/proc/collar_message,
        /mob/proc/collar_force_surrender,
        /mob/proc/collar_force_naked,
        /mob/proc/collar_permit_clothing,
        /mob/proc/collar_toggle_silence,
        /mob/proc/collar_force_emote,
    )
    to_chat(owner.current, span_notice("You can now control your pet through the Collar menu."))

/datum/antagonist/collar_master/on_removal()
    owner.current.verbs -= list(
        /mob/proc/collar_scry,
        /mob/proc/collar_listen,
        /mob/proc/collar_shock,
        /mob/proc/collar_message,
		/mob/proc/collar_force_surrender,
        /mob/proc/collar_force_naked,
        /mob/proc/collar_permit_clothing,
        /mob/proc/collar_toggle_silence,
        /mob/proc/collar_force_emote,
    )
    . = ..()

/mob/proc/collar_control_menu()
    set name = "Collar Control"
    set category = "Collar"

    var/datum/antagonist/collar_master/CM = mind?.has_antag_datum(/datum/antagonist/collar_master)
    if(!CM || !CM.my_collar || !CM.my_collar.victim)
        return

/mob/proc/select_pet(var/action)
    var/list/pets = list()
    for(var/datum/antagonist/collar_master/CM in mind.antag_datums)
        if(CM.my_collar && CM.my_collar.victim)
            pets[CM.my_collar.victim.name] = CM.my_collar

    if(!length(pets))
        return null
        
    var/choice = input(src, "Choose a pet:", "Pet Selection") as null|anything in pets
    if(!choice)
        return null
    return pets[choice]

/mob/proc/collar_scry()
    set name = "Scry on Pet"
    set category = "Collar"
    
    var/obj/item/clothing/neck/roguetown/cursed_collar/collar = select_pet("scry")
    if(!collar)
        return
        
    var/mob/dead/observer/screye/S = scry_ghost()
    if(S)
        S.ManualFollow(collar.victim)
        addtimer(CALLBACK(S, TYPE_PROC_REF(/mob/dead/observer, reenter_corpse)), 8 SECONDS)

/mob/proc/collar_listen()
    set name = "Listen to Pet"
    set category = "Collar"
    
    var/datum/antagonist/collar_master/CM = mind?.has_antag_datum(/datum/antagonist/collar_master)
    if(!CM || !CM.my_collar || !CM.my_collar.victim)
        return
        
    CM.my_collar.listening = !CM.my_collar.listening
    to_chat(src, span_notice("You [CM.my_collar.listening ? "attune your mind to" : "cease listening through"] the collar."))

/mob/proc/collar_shock()
    set name = "Shock Pet"
    set category = "Collar"
    
    var/datum/antagonist/collar_master/CM = mind?.has_antag_datum(/datum/antagonist/collar_master)
    if(!CM || !CM.my_collar || !CM.my_collar.victim)
        return
        
    to_chat(CM.my_collar.victim, span_danger("The collar sends painful shocks through your body!"))
    CM.my_collar.victim.electrocute_act(15, CM.my_collar, flags = SHOCK_NOGLOVES)
    CM.my_collar.victim.Knockdown(20)
    playsound(CM.my_collar.victim, 'sound/blank.ogg', 50, TRUE)

/mob/proc/collar_message()
    set name = "Send Message"
    set category = "Collar"
    
    var/datum/antagonist/collar_master/CM = mind?.has_antag_datum(/datum/antagonist/collar_master)
    if(!CM || !CM.my_collar || !CM.my_collar.victim)
        return
        
    var/msg = input(src, "Enter a message to send to your pet:", "Collar Message") as text|null
    if(msg)
        to_chat(CM.my_collar.victim, span_warning("Your collar tingles as you hear your master's voice: [msg]"))

/mob/proc/collar_force_surrender()
    set name = "Force Surrender"
    set category = "Collar"
    
    var/datum/antagonist/collar_master/CM = mind?.has_antag_datum(/datum/antagonist/collar_master)
    if(!CM || !CM.my_collar || !CM.my_collar.victim)
        return
        
    to_chat(CM.my_collar.victim, span_userdanger("The collar forces you to your knees!"))
    CM.my_collar.victim.Paralyze(600) // 1 minute stun
    new /obj/effect/temp_visual/surrender(get_turf(CM.my_collar.victim))
    playsound(CM.my_collar.victim, 'sound/blank.ogg', 50, TRUE)

/mob/proc/collar_force_naked()
    set name = "Force Strip"
    set category = "Collar"
    
    var/datum/antagonist/collar_master/CM = mind?.has_antag_datum(/datum/antagonist/collar_master)
    if(!CM || !CM.my_collar || !CM.my_collar.victim)
        return
    
    to_chat(CM.my_collar.victim, span_userdanger("The collar's magic forces you to remove all your clothing!"))
    if(ishuman(CM.my_collar.victim))
        var/mob/living/carbon/human/H = CM.my_collar.victim
        for(var/obj/item/I in H.get_equipped_items())
            if(I == CM.my_collar) // Don't remove the collar itself
                continue
            if(H.dropItemToGround(I, TRUE))
                H.visible_message(span_warning("[H]'s [I.name] falls to the ground!"))
    
    ADD_TRAIT(CM.my_collar.victim, TRAIT_NUDIST, CURSED_ITEM_TRAIT)
    playsound(CM.my_collar.victim, 'sound/blank.ogg', 50, TRUE)

/mob/proc/collar_permit_clothing()
    set name = "Permit Clothing"
    set category = "Collar"
    
    var/datum/antagonist/collar_master/CM = mind?.has_antag_datum(/datum/antagonist/collar_master)
    if(!CM || !CM.my_collar || !CM.my_collar.victim)
        return
        
    to_chat(CM.my_collar.victim, span_notice("The collar's magic allows you to wear clothing again."))
    REMOVE_TRAIT(CM.my_collar.victim, TRAIT_NUDIST, CURSED_ITEM_TRAIT)
    playsound(CM.my_collar.victim, 'sound/blank.ogg', 50, TRUE)

/mob/proc/collar_toggle_silence()
    set name = "Toggle Pet Speech"
    set category = "Collar"
    
    var/datum/antagonist/collar_master/CM = mind?.has_antag_datum(/datum/antagonist/collar_master)
    if(!CM || !CM.my_collar || !CM.my_collar.victim)
        return
        
    CM.my_collar.silenced = !CM.my_collar.silenced
    to_chat(CM.my_collar.victim, span_userdanger("The collar [CM.my_collar.silenced ? "forces you to speak like an animal!" : "allows you to speak normally again."]"))
    playsound(CM.my_collar.victim, 'sound/blank.ogg', 50, TRUE)
    
    if(CM.my_collar.silenced)
        RegisterSignal(CM.my_collar.victim, COMSIG_MOB_SAY, PROC_REF(handle_silenced_speech))
    else
        UnregisterSignal(CM.my_collar.victim, COMSIG_MOB_SAY)

/mob/proc/handle_silenced_speech(datum/source, list/speech_args)
    SIGNAL_HANDLER
    
    var/datum/antagonist/collar_master/CM = mind?.has_antag_datum(/datum/antagonist/collar_master)
    if(!CM || !CM.my_collar || !CM.my_collar.silenced)
        return
    
    speech_args[SPEECH_MESSAGE] = ""
    emote("me", EMOTE_VISIBLE, pick(CM.animal_sounds))
    return COMPONENT_CANCEL_SAY

/mob/proc/collar_force_emote()
    set name = "Force Emote"
    set category = "Collar"
    
    var/datum/antagonist/collar_master/CM = mind?.has_antag_datum(/datum/antagonist/collar_master)
    if(!CM || !CM.my_collar || !CM.my_collar.victim)
        return
        
    var/emote = input(src, "What emote should your pet perform?", "Force Emote") as text|null
    if(!emote)
        return
    
    CM.my_collar.victim.say(emote, forced = TRUE)
    playsound(CM.my_collar.victim, 'sound/blank.ogg', 50, TRUE)
