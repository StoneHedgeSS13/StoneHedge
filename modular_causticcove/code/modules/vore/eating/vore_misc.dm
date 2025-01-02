/mob/living
	//oh no vore time
	var/voremode = FALSE

//idk why it was defined so these verbs are automatically on everyone, including NPCS, but in order to avoid changing 900 lines of code, all vore verbs are deleted from mob @ roundstart. vore quirk readds them.
/mob/living/Initialize()
    . = ..()
    verbs -= list(
        /mob/living/carbon/verb/toggle_vore_mode_verb,
        /mob/living/verb/insidePanel,
        /mob/living/verb/escapeOOC,
        /mob/living/verb/lick,
        /mob/living/verb/preyloop_refresh
    )

/mob/living/proc/toggle_vore_mode()
	if(cmode)
		return FALSE
	voremode = !voremode
	init_vore()
	if(voremode)
		to_chat(src, span_info("I feel voracious."))
	else
		to_chat(src, span_info("I no longer feel voracious."))
	return TRUE

/mob/proc/disable_vore_mode()
	return

/mob/living/disable_vore_mode()
	voremode = FALSE

/datum/preferences
	//bad stuff
	var/vorepref = "Ask"
	var/vore_flags = NONE
	var/list/belly_prefs = list()
	var/vore_taste = "nothing in particular"
	var/toggleeatingnoise = TRUE
	var/toggledigestionnoise = TRUE
	var/cit_toggles = CIT_TOGGLES_DEFAULT

/datum/preferences/proc/save_vore_prefs(savefile/S)
	WRITE_FILE(S["cit_toggles"], cit_toggles)
	WRITE_FILE(S["vore_flags"], vore_flags)
	WRITE_FILE(S["vore_taste"], vore_taste)

	var/ckey = parent.ckey

	//Belly_prefs
	var/vr_path = "data/player_saves/[ckey[1]]/[ckey]/vore"
	var/char_vr_path = "[vr_path]/character_[default_slot]_v2.json"
	var/belly_prefs_json = safe_json_encode_cit(list("belly_prefs" = belly_prefs))
	if(fexists(char_vr_path))
		fdel(char_vr_path)
	text2file(belly_prefs_json,char_vr_path)

/datum/preferences/proc/load_vore_prefs(savefile/S)
	S["cit_toggles"] >> cit_toggles
	S["vore_flags"] >> vore_flags
	S["vore_taste"] >> vore_taste

	var/ckey = parent.ckey

	var/vr_path = "data/player_saves/[ckey[1]]/[ckey]/vore"
	var/char_vr_path = "[vr_path]/character_[default_slot]_v2.json"
	if(fexists(char_vr_path))
		var/list/json_from_file = json_decode(file2text(char_vr_path))
		if(json_from_file)
			belly_prefs = json_from_file["belly_prefs"]

	vore_flags = sanitize_integer(vore_flags, 0, MAX_VORE_FLAG, 0)
	vore_taste = copytext(vore_taste, 1, MAX_TASTE_LEN)
	belly_prefs = SANITIZE_LIST(belly_prefs)
	cit_toggles = sanitize_integer(cit_toggles, 0, 16777215, initial(cit_toggles))

/obj/item
	var/hides_bulges = FALSE

//Readds quotes and apostrophes to HTML-encoded strings
/proc/readd_quotes(var/t)
	var/list/repl_chars = list("&#34;" = "\"","&#39;" = "'")
	for(var/char in repl_chars)
		var/index = findtext(t, char)
		while(index)
			t = copytext(t, 1, index) + repl_chars[char] + copytext(t, index+5)
			index = findtext(t, char)
	return t
