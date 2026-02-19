/obj/item/repair_kit
    name = "Armor repair kit"
    desc = "A pile of various plates, chainmail pieces, and other junk that will be critical in those difficult times. This set can repair five serious damages."
    icon = 'modular_rmh/icons/obj/items/repair_kits.dmi'
    icon_state = "armorkit"
    w_class = WEIGHT_CLASS_SMALL
    force = 0
    throwforce = 0
    slot_flags = ITEM_SLOT_HIP
    melt_amount = 20
    grid_width = 32
    grid_height  = 64
    melting_material = /datum/material/steel

    //vars
    var/for_clothing = FALSE
    var/for_armor = TRUE
    var/amount_repair = 5
    var/repair_percent = 5


/obj/item/repair_kit/attack_atom(atom/attacked_atom, mob/living/user)
    if(!isobj(attacked_atom))
        return ..()
    if(!isliving(user) || !user.mind || user.cmode)
        return ..()
    var/obj/O = attacked_atom
    //var/datum/mind/blacksmith_mind = user.mind

    if(locate(/obj/machinery/anvil) in O.loc)
        repair_percent *= 2
    if(!isclothing(O))
        if(isitem(O))
            to_chat(user, span_warning("[src] only for clothing or armor!"))
        return
    . = TRUE
    var/obj/item/attacked_item = O
    if(for_armor == TRUE && attacked_item.sewrepair)
        to_chat(user, span_warning("[src] only for armor!"))
        return
    if(for_clothing == TRUE && attacked_item.anvilrepair)
        to_chat(user, span_warning("[src] only for clothing!"))
        return
    if(!attacked_item.max_integrity || (attacked_item.get_integrity() >= attacked_item.max_integrity) || !isturf(attacked_item.loc))
        to_chat(user, span_warning("[attacked_item] cannot be repaired any further."))
        return
    //playsound(src,'sound/items/bsmithfail.ogg', 40, FALSE) другой саунд
    attacked_item.repair_damage( attacked_item.max_integrity * repair_percent)
    if(attacked_item.obj_broken == 1)
        attacked_item.obj_broken = 0
    user.visible_message(span_info("[user] repairs most important parts [attacked_item]!"))
    amount_repair -= 1
    if(amount_repair <= 0)
        to_chat(user, span_warning("There was nothing left of the repair kit"))
        qdel(src)
        return TRUE
    return TRUE

/obj/item/repair_kit/poor_armorkit
    name = "Poor armor repair kit"
    desc = "A small amount of scrap, metal patches and tapes that will help repair your armor twice."
    icon_state = "poor_armorkit"
    for_clothing = FALSE
    for_armor = TRUE
    amount_repair = 2
    melting_material = /datum/material/iron

/obj/item/repair_kit/sewingkit
    name = "Sewing kit"
    desc = "Thread, fabric, and leather patches—this is a serious tool for a thrifty housewife or seasoned traveler. It can mend your clothes 10 times over."
    icon_state = "sewingkit"
    for_clothing = TRUE
    for_armor = FALSE
    amount_repair = 10
    smeltresult = /obj/item/fertilizer/ash

/obj/item/repair_kit/poor_sewingkit
    name = "Poor sewing kit"
    desc = "A little fabric and thread is all you need to patch a sock or a hole in your underwear. It can mend clothes twice."
    icon_state = "poor_sewingkit"
    for_clothing = TRUE
    for_armor = FALSE
    amount_repair = 5
    smeltresult = /obj/item/fertilizer/ash
