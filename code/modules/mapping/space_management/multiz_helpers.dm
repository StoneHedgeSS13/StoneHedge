/proc/get_step_multiz(ref, dir)
	if(dir & UP)
		dir &= ~UP
		return get_step(GET_TURF_ABOVE(get_turf(ref)), dir)
	if(dir & DOWN)
		dir &= ~DOWN
		return get_step(GET_TURF_BELOW(get_turf(ref)), dir)
	return get_step(ref, dir)

/proc/get_multiz_accessible_levels(center_z)
	. = list(center_z)
	var/other_z = center_z
	var/offset
	while((offset = SSmapping.multiz_levels[other_z]["[DOWN]"]))
		other_z -= offset
		if(other_z in .)
			break	// no infinite loops
		. += other_z
	other_z = center_z
	while((offset = SSmapping.multiz_levels[other_z]["[UP]"]))
		other_z += offset
		if(other_z in .)
			break	// no infinite loops
		. += other_z

/// A cache of stringified z-level zweb checks.
/// GLOB.zweb_cache[num2text(my_z)][num2text(compare_z)] = TRUE/FALSE
GLOBAL_LIST_EMPTY(zweb_cache)
/proc/is_in_zweb(atom/my_atom, atom/compare_atom)
	var/turf/my_turf = get_turf(my_atom)
	var/turf/compare_turf = get_turf(compare_atom)
	var/my_z = my_turf.z
	var/compare_z = compare_turf.z
	if(!my_z || !compare_z)
		return
	if(my_z == compare_z)
		return TRUE
	if(my_z > compare_z)
		for(var/i in my_z to compare_z)
			if(!i || i<0)
				return FALSE
			if(i == compare_z)
				return TRUE
			if(!SSmapping.level_trait(i, ZTRAIT_DOWN))
				return FALSE
	if(my_z < compare_z)
		for(var/i in my_z to compare_z)
			if(!i || i<0)
				return FALSE
			if(i == compare_z)
				return TRUE
			if(!SSmapping.level_trait(i, ZTRAIT_UP))
				return FALSE

/proc/get_dir_multiz(turf/us, turf/them)
	us = get_turf(us)
	them = get_turf(them)
	if(!us || !them)
		return NONE
	if(us.z == them.z)
		return get_dir(us, them)
	else
		var/turf/T = GET_TURF_ABOVE(us)
		var/dir = NONE
		if(T && (T.z == them.z))
			dir = UP
		else
			T = GET_TURF_BELOW(us)
			if(T && (T.z == them.z))
				dir = DOWN
			else
				return get_dir(us, them)
		return (dir | get_dir(us, them))

/proc/dir_inverse_multiz(dir)
	var/holder = dir & (UP|DOWN)
	if((holder == NONE) || (holder == (UP|DOWN)))
		return turn(dir, 180)
	dir &= ~(UP|DOWN)
	dir = turn(dir, 180)
	if(holder == UP)
		holder = DOWN
	else
		holder = UP
	dir |= holder
	return dir
