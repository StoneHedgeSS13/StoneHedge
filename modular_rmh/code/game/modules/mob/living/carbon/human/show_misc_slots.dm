
/mob/living/carbon/human/verb/remove_underwear()
	set name = "Equip Extra Items"
	set category = "IC"

	if(!show_inv(src, TRUE))
		return
