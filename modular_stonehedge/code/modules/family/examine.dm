/mob/living/carbon/human
	var/list/relatives = list()

/mob/living/carbon/human/examine(mob/user)
	. = ..()
	if(length(relatives) && relatives[user])
		. = "[p_they()] are your [relatives[user]]"
