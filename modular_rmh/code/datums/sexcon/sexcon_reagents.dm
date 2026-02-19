//LEWD WINE
/datum/reagent/consumable/ethanol/beer/emberwine
    name = "Emberwine"
    boozepwr = 10
    taste_description = "searing sweetness"
    taste_mult = 0.5
    quality = DRINK_VERYGOOD
    metabolization_rate = 0.02 * REAGENTS_METABOLISM
    overdose_threshold = 16
    addiction_threshold = 24
    var/addiction_permanent = TRUE
    color = "#721a46"

/datum/reagent/consumable/ethanol/beer/emberwine/on_mob_metabolize(mob/living/carbon/human/C)
    .=..()
    SEND_SIGNAL(C, COMSIG_SEX_ADJUST_AROUSAL, 5)

/datum/reagent/consumable/ethanol/beer/emberwine/on_mob_end_metabolize(mob/living/carbon/human/C)
    .=..()
    SEND_SIGNAL(C, COMSIG_SEX_ADJUST_AROUSAL, -5)

/datum/reagent/consumable/ethanol/beer/emberwine/on_mob_life(mob/living/carbon/human/C)
    var/high_message = pick(
        "Your stomach feels hot.",
        "Your skin feels prickly to the touch.",
        "Your loins throb involuntarily.",
        "Your heart beats irregularly.",
        "You feel cold sweat running down your neck.",)

    switch(current_cycle)
        if(0 to 19)
            current_cycle++
            return

        if(20)
            to_chat(C, "<span class='aphrodisiac'>You feel a warm glow spreading through your stomach.</span>")
            C.playsound_local(C,'modular_rmh/sound/effects/heartbeat.ogg',100)

        if(21 to 25)
            SEND_SIGNAL(C, COMSIG_SEX_ADJUST_AROUSAL, 5)

        if(26 to INFINITY)
            C.apply_status_effect(/datum/status_effect/debuff/emberwine)

            if(prob(8))
                if(C.silent || !C.can_speak())
                    C.emote("sexmoangag", forced = TRUE)
                else
                    C.emote("sexmoanlight", forced = TRUE)

                to_chat(C, "<span class='love_high'>[high_message]</span>")

                if(istype(C.wear_armor, /obj/item/clothing))
                    var/obj/item/clothing/CL = C.wear_armor

                    switch(CL.armor_class)
                        if(AC_HEAVY)
                            C.Immobilize(30)
                            C.set_eye_blur(5)
                            to_chat(C, "<span class='warning'>Your armor chaffs uncomfortably against your skin and makes it difficult to breathe.</span>")

                        if(AC_MEDIUM)
                            C.Immobilize(15)
                            C.set_eye_blur(2)
                            to_chat(C, "<span class='warning'>Your armor chaffs uncomfortably against your skin.</span>")

    return ..()

/datum/reagent/consumable/ethanol/beer/emberwine/overdose_start(mob/living/carbon/human/C)
    if(current_cycle < 20)
        current_cycle = 20
        to_chat(C, "<span class='aphrodisiac'>You feel a warm glow spreading through your stomach.</span>")
        sleep(10)

    to_chat(C, "<span class='aphrodisiac'>The glow in your stomach spreads, rushing to your head and warming your face.</span>")
    metabolization_rate = 0.1 * REAGENTS_METABOLISM
    SEND_SIGNAL(C, COMSIG_SEX_ADJUST_AROUSAL, 10)

    if(C.silent || !C.can_speak())
        C.emote("sexmoangag", forced = TRUE)
    else
        C.emote("sexmoanlight", forced = TRUE)

/datum/reagent/consumable/ethanol/beer/emberwine/overdose_process(mob/living/carbon/human/C)
    if(prob(5))
        if(C.silent || !C.can_speak())
            C.emote("sexmoangag", forced = TRUE)
        else
            C.emote("sexmoanmed", forced = TRUE)

        SEND_SIGNAL(C, COMSIG_SEX_ADJUST_AROUSAL, 5)

/datum/reagent/consumable/ethanol/beer/emberwine/addiction_act_stage3(mob/living/carbon/human/C)
    SEND_SIGNAL(C, COMSIG_SEX_ADJUST_AROUSAL, 5)

    var/mob/living/carbon/human/H = C
    if(!H.has_quirk(/datum/quirk/vice/lovefiend) )

        C.add_quirk(/datum/quirk/vice/lovefiend)

    if(prob(20))
        to_chat(C, span_danger("I have an intense craving for Emberwine."))


/datum/reagent/consumable/ethanol/beer/emberwine/addiction_act_stage4(mob/living/carbon/human/C)
    SEND_SIGNAL(C, COMSIG_SEX_SET_AROUSAL, 40)

    if(prob(10))
        to_chat(C, span_boldannounce("The feeling in your loins has subsided to a dull ache. I NEED TO scratch the itch..."))

//APHRODISIAC
/datum/reagent/consumable/aphrodisiac
	name = "Aphrodisiac"
	taste_description = "sweetness"
	description = "A powerful aphrodisiac that causes high sexual desire."
	reagent_state = LIQUID
	color = "#FF00B4"
	metabolization_rate = 0.02 * REAGENTS_METABOLISM
	overdose_threshold = 10

/datum/reagent/consumable/aphrodisiac/on_mob_metabolize(mob/living/carbon/human/C)
    .=..()
    SEND_SIGNAL(C, COMSIG_SEX_ADJUST_AROUSAL, 10)

/datum/reagent/consumable/aphrodisiac/on_mob_end_metabolize(mob/living/carbon/human/C)
    .=..()
    SEND_SIGNAL(C, COMSIG_SEX_ADJUST_AROUSAL, -10)

/datum/reagent/consumable/aphrodisiac/on_mob_life(mob/living/carbon/human/C)
    var/high_message = pick(
    "A dull heat coils low in your abdomen.",
    "Your skin feels strangely sensitive, like every brush lingers.",
    "Your breath catches for no clear reason.",
    "A slow pulse beats somewhere it shouldn't.",
    "You feel uncomfortably aware of your own body.",
    "Warmth pools beneath your ribs, spreading lazily.",
    "A shiver crawls up your spine despite the heat.",
    "Your muscles tense, then relax against your will.",
    "Your heartbeat feels louder than it should.",
    "A faint flush creeps across your skin.")

    switch(current_cycle)
        if(0 to 19)
            current_cycle++
            return

        if(20)
            to_chat(C, "<span class='aphrodisiac'>Something warm unfurls within you.</span>")
            C.playsound_local(C,'modular_rmh/sound/effects/heartbeat.ogg',100)

        if(21 to 25)
            SEND_SIGNAL(C, COMSIG_SEX_ADJUST_AROUSAL, 10)

        if(26 to INFINITY)
            C.apply_status_effect(/datum/status_effect/debuff/aphrodisiac)

            if(prob(8))
                if(C.silent || !C.can_speak())
                    C.emote("sexmoangag", forced = TRUE)
                else
                    C.emote("sexmoanlight", forced = TRUE)

                to_chat(C, "<span class='love_high'>[high_message]</span>")

                if(istype(C.wear_armor, /obj/item/clothing))
                    var/obj/item/clothing/CL = C.wear_armor

                    switch(CL.armor_class)
                        if(AC_HEAVY)
                            C.Immobilize(30)
                            C.set_eye_blur(5)
                            to_chat(C, "<span class='warning'>Your armor presses tight, every movement suddenly suffocating.</span>")

                        if(AC_MEDIUM)
                            C.Immobilize(15)
                            C.set_eye_blur(2)
                            to_chat(C, "<span class='warning'>Your armor rubs uncomfortably against your sensitized skin.</span>")

    return ..()

/datum/reagent/consumable/aphrodisiac/overdose_start(mob/living/carbon/human/C)
    if(current_cycle < 20)
        current_cycle = 20
        to_chat(C, "<span class='aphrodisiac'>A wave of heat crashes over you, making it hard to focus.</span>")
        sleep(10)

    to_chat(C, "<span class='aphrodisiac'>Your focus drifts for a heartbeat too long.</span>")
    metabolization_rate = 0.1 * REAGENTS_METABOLISM
    SEND_SIGNAL(C, COMSIG_SEX_ADJUST_AROUSAL, 15)

    if(C.silent || !C.can_speak())
        C.emote("sexmoangag", forced = TRUE)
    else
        C.emote("sexmoanlight", forced = TRUE)

/datum/reagent/consumable/aphrodisiac/overdose_process(mob/living/carbon/human/C)
    if(prob(5))
        if(C.silent || !C.can_speak())
            C.emote("sexmoangag", forced = TRUE)
        else
            C.emote("sexmoanmed", forced = TRUE)

        SEND_SIGNAL(C, COMSIG_SEX_ADJUST_AROUSAL, 10)

    var/mob/living/carbon/human/H = C
    if(!H.has_quirk(/datum/quirk/vice/lovefiend) )

        C.add_quirk(/datum/quirk/vice/lovefiend)

/datum/alch_cauldron_recipe/aphrodisiac
	recipe_name = "Aphrodisiac"
	smells_like = "sweetness"
	output_reagents = list(/datum/reagent/consumable/aphrodisiac = 20)
	required_essences = list(
		/datum/thaumaturgical_essence/life = 2,
		/datum/thaumaturgical_essence/chaos = 2,
		/datum/thaumaturgical_essence/energia = 1,)

/obj/item/reagent_containers/glass/bottle/vial/aphrodisiac
	list_reagents = list(/datum/reagent/consumable/aphrodisiac = 25)
	desc = "A bottle with an unmarked, pink sticky liquid. Some kind of potion."

/datum/supply_pack/narcotics/aphrodisiac
	name = "Aphrodisiac"
	cost = 25
	contains = /obj/item/reagent_containers/glass/bottle/vial/aphrodisiac

//Sleeping potion
/datum/reagent/sleep_potion
	name = "Sleep Potion"
	description = "A powerful sedative."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#000067"

/datum/reagent/sleep_potion/on_mob_life(mob/living/carbon/human/C)
	switch(current_cycle)
		if(0 to 5)
			current_cycle++
			return

		if(6)
			current_cycle++
			to_chat(C, span_warning("You feel overwhelmingly sleepy."))
			C.apply_status_effect(/datum/status_effect/debuff/sleepytime)
			C.emote("yawn", forced = TRUE)
			return

		if(7 to 15)
			current_cycle++
			C.set_eye_blur(10)

			if(prob(10))
				C.emote("yawn", forced = TRUE)

			return

		if(16)
			current_cycle++
			to_chat(C, span_notice("Your eyes finally close as sleep takes you."))
			C.Sleeping(600)
			return

		if(17 to INFINITY)
			return

/datum/alch_cauldron_recipe/sleep_potion
	recipe_name = "Sleep Potion"
	smells_like = "bitterness"
	output_reagents = list(/datum/reagent/sleep_potion = 20)
	required_essences = list(
		/datum/thaumaturgical_essence/void = 4,
		/datum/thaumaturgical_essence/water = 3,
		/datum/thaumaturgical_essence/frost = 2,)

/obj/item/reagent_containers/glass/bottle/vial/sleep_potion
	list_reagents = list(/datum/reagent/sleep_potion = 25)
	desc = "Some kind of potion. The smell makes you drowsy."

/datum/supply_pack/narcotics/sleep_potion
	name = "Sleep Potion"
	cost = 15
	contains = /obj/item/reagent_containers/glass/bottle/vial/sleep_potion


//Destroy clothes potion

/datum/reagent/destroy_clothes
    name = "Destroy Clothes Potion"
    description = "A corrosive alchemical liquid that dissolves unprotected clothing without harming the wearer."
    taste_description = "burning bitterness"
    reagent_state = LIQUID
    color = "#6a00ffc6"

/datum/reagent/destroy_clothes/on_mob_life(mob/living/carbon/human/C)
    if(!C)
        return

    if(C.underwear)
        var/obj/item/clothing/undies/U = C.underwear
        C.dropItemToGround(U)
        qdel(U)
        C.visible_message(
            span_danger("[C]'s underwear dissolves away!"),
            span_danger("Your underwear suddenly dissolves!")
        )
        playsound(src, 'modular_rmh/sound/effects/dissolve.ogg', 100)

/datum/reagent/destroy_clothes/reaction_mob(mob/living/M, method = TOUCH, reac_volume)
    if(!ishuman(M))
        return
    if(method != TOUCH)
        return

    var/mob/living/carbon/human/H = M

    var/list/clothes = list(
        H.shoes,
        H.gloves,
        H.wear_mask,
        H.mouth,
        H.cloak,
        H.wear_armor,
        H.wear_pants,
        H.wear_shirt,
        H.wear_wrists,
        H.belt,
        H.head
    )

    for(var/obj/item/clothing/C in clothes)
        if(!C)
            continue

        var/armor_class = 0
        if(istype(C, /obj/item/clothing) && C.armor_class)
            armor_class = C.armor_class

        switch(armor_class)
            if(AC_HEAVY)
                continue
            if(AC_MEDIUM)
                C.take_damage(damage_amount = C.max_integrity * 0.5, sound_effect = FALSE)
                continue
            else
                H.dropItemToGround(C)
                qdel(C)

    if(H.underwear)
        var/obj/item/clothing/undies/U = H.underwear
        H.dropItemToGround(U)
        qdel(U)
        H.visible_message(
            span_danger("[H]'s underwear dissolves away!"),
            span_danger("Your underwear suddenly dissolves!")
        )

    H.visible_message(
        span_danger("[H]'s clothing dissolves!"),
        span_danger("Your clothing dissolves!")
    )
    playsound(src, 'modular_rmh/sound/effects/dissolve.ogg', 100)

/datum/reagent/destroy_clothes/reaction_obj(obj/O, reac_volume)
    if(!istype(O, /obj/item/clothing))
        return

    var/obj/item/clothing/C = O
    var/armor_class = 0
    if(istype(C, /obj/item/clothing) && C.armor_class)
        armor_class = C.armor_class

    switch(armor_class)
        if(AC_HEAVY)
            return
        if(AC_MEDIUM)
            C.take_damage(damage_amount = C.max_integrity * 0.5, sound_effect = FALSE)
            return
        else
            C.visible_message(span_danger("[C.name] sizzles and dissolves!"))
            qdel(C)
    playsound(src, 'modular_rmh/sound/effects/dissolve.ogg', 100)

/obj/item/reagent_containers/glass/bottle/vial/destroy_clothes
    name = "Destroy Clothes Potion"
    desc = "A vial of transparent liquid that eats away at fabric."
    list_reagents = list(/datum/reagent/destroy_clothes = 10)

/datum/supply_pack/narcotics/destroy_clothes
    name = "Destroy Clothes Potion"
    cost = 150
    contains = /obj/item/reagent_containers/glass/bottle/vial/destroy_clothes

/datum/alch_cauldron_recipe/destroy_clothes
    recipe_name = "Destroy Clothes Potion"
    smells_like = "bitterness"
    output_reagents = list(/datum/reagent/destroy_clothes = 10)
    required_essences = list(
    	/datum/thaumaturgical_essence/fire = 6,
		/datum/thaumaturgical_essence/chaos = 4,
		/datum/thaumaturgical_essence/crystal = 2,)

//Paralyze Potion
/datum/reagent/paralyze_potion
    name = "Paralyze Potion"
    description = "A viscous liquid that temporarily immobilizes a target."
    taste_description = "thick and metallic"
    reagent_state = LIQUID
    color = "#B0B0B0CC"

/datum/reagent/paralyze_potion/on_mob_life(mob/living/carbon/human/C)
    switch(current_cycle)
        if(0 to 4)
            current_cycle++
            return

        if(5)
            current_cycle++
            to_chat(C, span_warning("Your muscles begin to stiffen!"))
            return

        if(6 to 10)
            current_cycle++
            if(prob(30))
                C.emote("tremble", forced = TRUE)
            return

        if(11)
            current_cycle++
            var/paralyze_duration = pick(600, 900)
            C.Paralyze(paralyze_duration)
            to_chat(C, span_warning("You are completely paralyzed!"))
            return

        if(12 to INFINITY)
            return

/obj/item/reagent_containers/glass/bottle/vial/paralyze_potion
    name = "Paralyze Potion"
    desc = "A vial of metallic-looking liquid that immobilizes the drinker."
    list_reagents = list(/datum/reagent/paralyze_potion = 10)

/datum/supply_pack/narcotics/paralyze_potion
    name = "Paralyze Potion"
    cost = 150
    contains = /obj/item/reagent_containers/glass/bottle/vial/paralyze_potion

/datum/alch_cauldron_recipe/paralyze_potion
    recipe_name = "Paralyze Potion"
    smells_like = "metallic"
    output_reagents = list(/datum/reagent/paralyze_potion = 10)
    required_essences = list(
    	/datum/thaumaturgical_essence/order = 4,
		/datum/thaumaturgical_essence/frost = 3,
		/datum/thaumaturgical_essence/void = 2,)
