
//open gates
/obj/effect/proc_holder/spell/self/forgedwarf_shout
    name = "Command Gates"
    desc = "Call upon Svaeryogh to command nearby gates and doors."
    school = "conjuration"
    charge_max = 30 SECONDS
    clothes_req = FALSE
    range = 3
    action_icon = 'icons/mob/actions/roguespells.dmi'
    action_icon_state = "revive"
    associated_skill = /datum/skill/magic/holy

/obj/effect/proc_holder/spell/self/forgedwarf_shout/cast(mob/living/carbon/human/user)
    if(!istype(get_area(user), /area/rogue/indoors/shelter/town/dwarf))
        to_chat(user, span_warning("I must be within the Shrine-Forge to invoke Svaeryogh."))
        return FALSE

    playsound(user, pick('sound/vo/male/dwarf/rage (1).ogg',
                        'sound/vo/male/dwarf/rage (2).ogg',
                        'sound/vo/male/dwarf/rage (3).ogg'), 100, TRUE, 7)

    visible_message(span_warning("[user] shouts a thunderous invocation in Dwarfish!"))
    user.say("SVAERYOGH, COMMAND THESE GATES!", language = /datum/language/dwarvish)

    for(var/obj/structure/mineral_door/door in view(range, user))
        INVOKE_ASYNC(src, PROC_REF(open_door), door)
    for(var/obj/structure/bars/passage/bars in view(range, user))
        INVOKE_ASYNC(src, PROC_REF(toggle_bars), bars)
    for(var/obj/structure/gate/bars/gate in view(range, user))
        INVOKE_ASYNC(src, PROC_REF(toggle_bars), gate)

/obj/effect/proc_holder/spell/self/forgedwarf_shout/proc/open_door(obj/structure/mineral_door/door)
    door.locked = FALSE
    door.force_open()
    new /obj/effect/temp_visual/small_smoke(get_turf(door))
    playsound(door, 'sound/misc/smelter_fin.ogg', 50, TRUE, -1)

/obj/effect/proc_holder/spell/self/forgedwarf_shout/proc/toggle_bars(obj/structure/bars)
    if(istype(bars, /obj/structure/bars/passage))
        var/obj/structure/bars/passage/passage = bars
        passage.redstone_triggered()
    else if(istype(bars, /obj/structure/gate/bars))
        var/obj/structure/gate/bars/gate = bars
        gate.toggle()
    new /obj/effect/temp_visual/small_smoke(get_turf(bars))
    playsound(bars, 'sound/misc/smelter_fin.ogg', 50, TRUE, -1)

//light forges

/obj/effect/proc_holder/spell/self/forgedwarf_ignite
    name = "Light Forges"
    desc = "Call upon Svaeryogh to ignite nearby forges and hearths."
    school = "conjuration"
    charge_max = 30 SECONDS
    clothes_req = FALSE
    range = 3
    action_icon = 'icons/mob/actions/roguespells.dmi'
    action_icon_state = "sacredflame"
    associated_skill = /datum/skill/magic/holy

/obj/effect/proc_holder/spell/self/forgedwarf_ignite/cast(mob/living/carbon/human/user)
    if(!istype(get_area(user), /area/rogue/indoors/shelter/town/dwarf))
        to_chat(user, span_warning("I must be within the Shrine-Forge to invoke Svaeryogh."))
        return FALSE

    playsound(user, pick('sound/vo/male/dwarf/rage (1).ogg',
                        'sound/vo/male/dwarf/rage (2).ogg',
                        'sound/vo/male/dwarf/rage (3).ogg'), 100, TRUE, 7)

    visible_message(span_warning("[user] shouts a thunderous invocation in Dwarfish!"))
    user.say("SVAERYOGH, IGNITE THESE FORGES!", language = /datum/language/dwarvish)

    var/ignited = FALSE
    for(var/obj/machinery/light/rogue/L in view(range, user))
        if(istype(L, /obj/machinery/light/rogue/smelter) || \
           istype(L, /obj/machinery/light/rogue/smelter/great) || \
           istype(L, /obj/machinery/light/rogue/forge) || \
           istype(L, /obj/machinery/light/rogue/wallfire) || \
           istype(L, /obj/machinery/light/rogue/firebowl/church) || \
           istype(L, /obj/machinery/light/rogue/hearth))
            INVOKE_ASYNC(src, PROC_REF(ignite_forge), L)
            ignited = TRUE

    if(!ignited)
        to_chat(user, span_warning("There are no forges nearby to ignite."))
        return FALSE

/obj/effect/proc_holder/spell/self/forgedwarf_ignite/proc/ignite_forge(obj/machinery/light/rogue/forge)
    if(!forge.on)
        forge.on = TRUE
        forge.update()
        new /obj/effect/temp_visual/small_smoke(get_turf(forge))
        playsound(forge, 'sound/misc/smelter_fin.ogg', 50, TRUE, -1)
