// /datum/family/proc/update_family_hud(mob/target, list/relatives)
// 	var/image/holder = target.hud_list[FAMILY_HUD]
// 	var/icon/I = icon(target.icon, target.icon_state, target.dir)
// 	holder.pixel_y = I.Height() - world.icon_size
// 	holder.icon_state = "family"
// 	return I

// /datum/family_hud

// /datum/family_hud
// family huds need to be seen by specific people, not just everyone that has the hud active like most atom_huds work
// /datum/atom_hud/family
// 	// hud_icons = list()

// /datum/atom_hud/family/add_to_single_hud(mob/M, atom/A)
// 	if(!M || !M.client || !A)
// 		return
// 	for(var/i in hud_icons)
// 		if(A.hud_list[i] && (!hud_exceptions[M] || !(A in hud_exceptions[M])))
// 			M.client.images |= A.hud_list[i]

// /datum/atom_hud/family/remove_from_single_hud(mob/M, atom/A)
// 	if(!M || !M.client || !A)
// 		return
// 	for(var/i in hud_icons)
// 		M.client.images -= A.hud_list[i]
