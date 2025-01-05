// Overhauled  system
#define DM_HOLD "Hold"
#define DM_DIGEST "Digest"
#define DM_HEAL "Heal"
#define DM_NOISY "Noisy"
#define DM_DRAGON "Dragon"
#define DM_ABSORB "Absorb"
#define DM_UNABSORB "Un-absorb"

#define DIGESTABLE 		(1<<0)
#define SHOW__PREFS (1<<1)
#define DEVOURABLE		(1<<2)
#define FEEDING			(1<<3)
#define NO_			(1<<4)
#define OPEN_PANEL		(1<<5)
#define ABSORBED		(1<<6)
#define _INIT		(1<<7)
#define PREF_INIT	(1<<8)
#define LICKABLE		(1<<9)

#define DEFAULT__FLAGS (DIGESTABLE | DEVOURABLE | FEEDING | LICKABLE)

#define MAX__FLAG	(1<<10)-1 // change this whenever you add a  flag, must be largest  flag*2-1

#define isbelly(A) istype(A, /obj/belly)
#define QDEL_NULL_LIST(x) if(x) { for(var/y in x) { qdel(y) } ; x = null }
#define _STRUGGLE_EMOTE_CHANCE 40

// Stance for hostile mobs to be in while devouring someone.
#define HOSTILE_STANCE_EATING	99

/* // removing sizeplay again
GLOBAL_LIST_INIT(player_sizes_list, list("Macro" = SIZESCALE_HUGE, "Big" = SIZESCALE_BIG, "Normal" = SIZESCALE_NORMAL, "Small" = SIZESCALE_SMALL, "Tiny" = SIZESCALE_TINY))
// Edited to make the new travis check go away
*/

GLOBAL_LIST_INIT(pred__sounds, list(
		"Gulp" = 'modular_causticcove/sound//pred/swallow_01.ogg',
		"Swallow" = 'modular_causticcove/sound//pred/swallow_02.ogg',
		"Insertion1" = 'modular_causticcove/sound//pred/insertion_01.ogg',
		"Insertion2" = 'modular_causticcove/sound//pred/insertion_02.ogg',
		"Tauric Swallow" = 'modular_causticcove/sound//pred/taurswallow.ogg',
		"Stomach Move"		= 'modular_causticcove/sound//pred/stomachmove.ogg',
		"Schlorp" = 'modular_causticcove/sound//pred/schlorp.ogg',
		"Squish1" = 'modular_causticcove/sound//pred/squish_01.ogg',
		"Squish2" = 'modular_causticcove/sound//pred/squish_02.ogg',
		"Squish3" = 'modular_causticcove/sound//pred/squish_03.ogg',
		"Squish4" = 'modular_causticcove/sound//pred/squish_04.ogg',
		"Rustle (cloth)" = 'modular_causticcove/sound/effects/rustle5.ogg',
		"Rustle 2 (cloth)"	= 'modular_causticcove/sound/effects/rustle2.ogg',
		"Rustle 3 (cloth)"	= 'modular_causticcove/sound/effects/rustle3.ogg',
		"Rustle 4 (cloth)"	= 'modular_causticcove/sound/effects/rustle4.ogg',
		"Rustle 5 (cloth)"	= 'modular_causticcove/sound/effects/rustle5.ogg',
		"None" = null
		))

GLOBAL_LIST_INIT(prey__sounds, list(
		"Gulp" = 'modular_causticcove/sound//prey/swallow_01.ogg',
		"Swallow" = 'modular_causticcove/sound//prey/swallow_02.ogg',
		"Insertion1" = 'modular_causticcove/sound//prey/insertion_01.ogg',
		"Insertion2" = 'modular_causticcove/sound//prey/insertion_02.ogg',
		"Tauric Swallow" = 'modular_causticcove/sound//prey/taurswallow.ogg',
		"Stomach Move"		= 'modular_causticcove/sound//prey/stomachmove.ogg',
		"Schlorp" = 'modular_causticcove/sound//prey/schlorp.ogg',
		"Squish1" = 'modular_causticcove/sound//prey/squish_01.ogg',
		"Squish2" = 'modular_causticcove/sound//prey/squish_02.ogg',
		"Squish3" = 'modular_causticcove/sound//prey/squish_03.ogg',
		"Squish4" = 'modular_causticcove/sound//prey/squish_04.ogg',
		"Rustle (cloth)" = 'modular_causticcove/sound/effects/rustle5.ogg',
		"Rustle 2 (cloth)"	= 'modular_causticcove/sound/effects/rustle2.ogg',
		"Rustle 3 (cloth)"	= 'modular_causticcove/sound/effects/rustle3.ogg',
		"Rustle 4 (cloth)"	= 'modular_causticcove/sound/effects/rustle4.ogg',
		"Rustle 5 (cloth)"	= 'modular_causticcove/sound/effects/rustle5.ogg',
		"None" = null
		))

GLOBAL_LIST_INIT(pred_release_sounds, list(
		"Rustle (cloth)" = 'modular_causticcove/sound/effects/rustle1.ogg',
		"Rustle 2 (cloth)" = 'modular_causticcove/sound/effects/rustle2.ogg',
		"Rustle 3 (cloth)" = 'modular_causticcove/sound/effects/rustle3.ogg',
		"Rustle 4 (cloth)" = 'modular_causticcove/sound/effects/rustle4.ogg',
		"Rustle 5 (cloth)" = 'modular_causticcove/sound/effects/rustle5.ogg',
		"Stomach Move" = 'modular_causticcove/sound//pred/stomachmove.ogg',
		"Pred Escape" = 'modular_causticcove/sound//pred/escape.ogg',
		"Splatter" = 'modular_causticcove/sound/effects/splat.ogg',
		"None" = null
		))

GLOBAL_LIST_INIT(prey_release_sounds, list(
		"Rustle (cloth)" = 'modular_causticcove/sound/effects/rustle1.ogg',
		"Rustle 2 (cloth)" = 'modular_causticcove/sound/effects/rustle2.ogg',
		"Rustle 3 (cloth)" = 'modular_causticcove/sound/effects/rustle3.ogg',
		"Rustle 4 (cloth)" = 'modular_causticcove/sound/effects/rustle4.ogg',
		"Rustle 5 (cloth)" = 'modular_causticcove/sound/effects/rustle5.ogg',
		"Stomach Move" = 'modular_causticcove/sound//prey/stomachmove.ogg',
		"Pred Escape" = 'modular_causticcove/sound//prey/escape.ogg',
		"Splatter" = 'modular_causticcove/sound/effects/splat.ogg',
		"None" = null
		))

#define FIRE_PRIORITY_			5

// Flags
#define EATING_NOISES		(1<<0)
#define DIGESTION_NOISES	(1<<1)
#define CIT_TOGGLES_DEFAULT (EATING_NOISES | DIGESTION_NOISES)

//belly sound pref things
#define NORMIE_HEARCHECK 4

#define MAX_TASTE_LEN			40 //lick... ... ew...

#define COPY_SPECIFIC_BITFIELDS(a,b,flags)\
	do{\
		var/_old = a & ~(flags);\
		var/_cleaned = b & (flags);\
		a = _old | _cleaned;\
	} while(0);
