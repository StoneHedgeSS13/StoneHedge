//By Vide Noir https://github.com/EaglePhntm.
//reagent coating for weapons that apply on successful hit through armor.

/*todo
- splash or dropper reagent apply
- wash reagent clear
- unarmored hit detection to apply reagent
*/

/obj/item/rogueweapon

	var/reagent_apply_amt
	///incase you want to set something non blunt uncoatable anyways.
	var/uncoatable = FALSE

/obj/item/rogueweapon/Initialize(...)
	. = ..()
	if(sharpness != IS_BLUNT && !uncoatable)
		create_reagents(w_class*5, REFILLABLE|DRAINABLE) //weapon size equals more coatable.
		reagent_apply_amt = max((5/w_class), 0.5) //smaller weapons will apply more poison at once.
		RegisterSignal(src, COMSIG_APPLY_REAGENTS, PROC_REF(__apply_reagents))
		RegisterSignal(src, COMSIG_COMPONENT_CLEAN_ACT, PROC_REF(__clean_react))

/obj/item/rogueweapon/proc/__apply_reagents(obj/item/I, mob/living/user, mob/living/H)
	//signals are fucking weird, the parameters above are all fucky weird.
	SIGNAL_HANDLER
	SHOULD_NOT_OVERRIDE(TRUE) // override on_apply_reagents instead
	INVOKE_ASYNC(src, PROC_REF(apply_reagents), I, user, H)

/obj/item/rogueweapon/proc/apply_reagents(obj/item/I, mob/living/user, mob/living/H)
	if(!H || user == H)
		return
	if(reagents.total_volume)
		reagents.trans_to(user, reagent_apply_amt, 1, no_react = FALSE)
		user.visible_message(span_green("[user] shudders with pain!"),span_boldgreen("I feel a burning pain on my wound!"))
		log_attack("[user] was struck with [english_list(reagents.reagent_list)] using a poisoned weapon by [H].")

/obj/item/rogueweapon/proc/__clean_react()
	SIGNAL_HANDLER
	SHOULD_NOT_OVERRIDE(TRUE) // override on_clean_react instead
	INVOKE_ASYNC(src, PROC_REF(clean_react)) // don't cause signal sending to hang!

/obj/item/rogueweapon/proc/clean_react()
	if(reagents?.total_volume)
		reagents.remove_all(reagents.maximum_volume) //buh bye reagents water washes it

/obj/item/rogueweapon/attackby(obj/item/reagent_containers/I, mob/living/user, params)
	if(reagents)
		if(user.used_intent?.type == INTENT_SPLASH && I.spillable) //tries to add everything.
			I.reagents.trans_to(src, I.reagents.maximum_volume)
	. = ..()
	if(!reagents) //another cause this shit was borking up other attackbys on weapons like sharpening
		return
	var/waterbuse = 0
	for(var/datum/reagent/water/waterussy in I.reagents.reagent_list)
		waterbuse = waterussy.volume
	reagents.remove_all(waterbuse) //buh bye reagents water washes it
	I.reagents.remove_all_type(/datum/reagent/water, 100)
	//we dont want water coated weapons so last failsafe
	reagents.remove_all_type(/datum/reagent/water, reagents.total_volume)

//custom reagent examine
/obj/item/rogueweapon/examine(mob/user)
	. = ..()
	if(reagents && reagents.total_volume)
		if(user.can_see_reagents() || (user.Adjacent(src) && user.mind?.get_skill_level(/datum/skill/misc/alchemy) >= 2)) //Show each individual reagent
			. += "It is coated in:"
			for(var/datum/reagent/R in reagents.reagent_list)
				. += "[round(R.volume / 3, 0.1)] oz of <font color=[R.color]>[R.name]</font>"
		else //Otherwise, just show the total volume
			var/total_volume = 0
			var/reagent_color
			for(var/datum/reagent/R in reagents.reagent_list)
				total_volume += R.volume
			reagent_color = mix_color_from_reagents(reagents.reagent_list)
			if(total_volume / 3 < 1)
				. += "It seems to be coated in less than 1 oz of <font color=[reagent_color]>something.</font>"
			else
				. += "It seems to be coated in [round(total_volume / 3)] oz of <font color=[reagent_color]>something.</font>"
