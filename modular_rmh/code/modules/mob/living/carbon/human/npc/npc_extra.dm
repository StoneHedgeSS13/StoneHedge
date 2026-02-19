/mob/living
    var/threshold_brute = 500
    var/threshold_burn = 500
    var/threshold_tox = 500
    var/threshold_oxy = 500

    var/chance_escape = 0

/mob/living/proc/check_damage_threshold()
	if(client)
		return

	var/damagetype = 0
	var/damage_mod = 0
	var/total_damage = 200

	if(getBruteLoss() >= threshold_brute)
		damagetype |= BRUTELOSS
	if(getFireLoss() >= threshold_burn)
		damagetype |= FIRELOSS
	if(getToxLoss() >= threshold_tox)
		damagetype |= TOXLOSS
	if(getOxyLoss() >= threshold_oxy)
		damagetype |= OXYLOSS

	if(!damagetype)
		return

	if(prob(chance_escape) && stat != DEAD)
		visible_message("<span class='warning'>[src] escapes!</span>")
		do_smoke(1, get_turf(src), /obj/effect/particle_effect/smoke)
		qdel(src)
		return

	for(var/T in list(BRUTELOSS, FIRELOSS, TOXLOSS, OXYLOSS))
		if(damagetype & T)
			damage_mod += 1
	damage_mod = max(1, damage_mod)

	if(damagetype & BRUTELOSS)
		adjustBruteLoss(total_damage / damage_mod)
	if(damagetype & FIRELOSS)
		adjustFireLoss(total_damage / damage_mod)
	if(damagetype & TOXLOSS)
		adjustToxLoss(total_damage / damage_mod)
	if(damagetype & OXYLOSS)
		adjustOxyLoss(total_damage / damage_mod)

	if(!(damagetype & (BRUTELOSS | FIRELOSS | TOXLOSS | OXYLOSS)))
		adjustOxyLoss(max(total_damage - getBruteLoss() - getFireLoss() - getToxLoss() - getOxyLoss(), 0))

	death(FALSE)
	visible_message("<span class='warning'>[src] dies!</span>")
