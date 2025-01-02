GLOBAL_LIST_EMPTY(loadout_items)

/datum/loadout_item
	var/name = "Parent loadout datum"
	var/desc
	var/path


//HATS
/datum/loadout_item/shalal
	name = "Keffiyeh"
	path = /obj/item/clothing/head/roguetown/roguehood/shalal

/datum/loadout_item/strawhat
	name = "Straw Hat"
	path = /obj/item/clothing/head/roguetown/strawhat

/*/datum/loadout_item/witchhat
	name = "Witch Hat"
	path = /obj/item/clothing/head/roguetown/witchhat did not port from azure*/

/datum/loadout_item/bardhat
	name = "Bard Hat"
	path = /obj/item/clothing/head/roguetown/bardhat

/datum/loadout_item/fancyhat
	name = "Fancy Hat"
	path = /obj/item/clothing/head/roguetown/fancyhat

/*/datum/loadout_item/smokingcap
	name = "Smoking Cap"
	path = /obj/item/clothing/head/roguetown/smokingcap /didnt port from azure*/

/datum/loadout_item/headband
	name = "Headband"
	path = /obj/item/clothing/head/roguetown/headband

//CLOAKS
/datum/loadout_item/tabard
	name = "Tabard"
	path = /obj/item/clothing/cloak/tabard

/datum/loadout_item/surcoat
	name = "Surcoat"
	path = /obj/item/clothing/cloak/stabard

/datum/loadout_item/jupon
	name = "Jupon"
	path = /obj/item/clothing/cloak/stabard/surcoat

/datum/loadout_item/cape
	name = "Cape"
	path = /obj/item/clothing/cloak/cape

/datum/loadout_item/halfcloak
	name = "Halfcloak"
	path = /obj/item/clothing/cloak/half

/datum/loadout_item/furcloak
	name = "Fur Cloak"
	path = /obj/item/clothing/cloak/raincloak/furcloak

/datum/loadout_item/blkknight
	name = "Blood Cape"
	path = /obj/item/clothing/cloak/cape/blkknight

/datum/loadout_item/lordcloak
	name = "Lordly Cloak"
	path = /obj/item/clothing/cloak/lordcloak

/datum/loadout_item/roguehood
	name = "Hood"
	path = /obj/item/clothing/head/roguetown/roguehood

/datum/loadout_item/dildo
	name = "Wooden Dildo"
	path = /obj/item/dildo/wood

/datum/loadout_item/dildo
	name = "Wooden Butt Plug"
	path = /obj/item/dildo/plug/wood

/datum/loadout_item/gladiator
	name = "Leather Soleae"
	path = /obj/item/clothing/shoes/roguetown/gladiator

/*/datum/loadout_item/ridercloak
	name = "Rider Cloak"
	path = /obj/item/clothing/cloak/half/rider did not port from Azure*/

//SHOES
/datum/loadout_item/darkboots
	name = "Dark Boots"
	path = /obj/item/clothing/shoes/roguetown/boots

/datum/loadout_item/nobleboots
	name = "Noble Boots"
	path = /obj/item/clothing/shoes/roguetown/nobleboot

/datum/loadout_item/shortboots
	name = "Short Boots"
	path = /obj/item/clothing/shoes/roguetown/shortboots

/datum/loadout_item/ridingboots
	name = "Riding Boots"
	path = /obj/item/clothing/shoes/roguetown/ridingboots

//SHIRTS
/datum/loadout_item/robe
	name = "Robe"
	path = /obj/item/clothing/suit/roguetown/shirt/robe

/datum/loadout_item/formalsilks
	name = "Formal Silks"
	path = /obj/item/clothing/suit/roguetown/shirt/undershirt/puritan

/datum/loadout_item/tunic
	name = "Tunic"
	path = /obj/item/clothing/suit/roguetown/shirt/tunic

/datum/loadout_item/dress
	name = "Dress"
	path = /obj/item/clothing/suit/roguetown/shirt/dress/gen

/datum/loadout_item/bardress
	name = "Bar Dress"
	path = /obj/item/clothing/suit/roguetown/shirt/dress

/datum/loadout_item/chemise
	name = "Chemise"
	path = /obj/item/clothing/suit/roguetown/shirt/dress/silkdress

/datum/loadout_item/sexydress
	name = "Sexy Dress"
	path = /obj/item/clothing/suit/roguetown/shirt/dress/gen/sexy

/datum/loadout_item/straplessdress
	name = "Strapless Dress"
	path = /obj/item/clothing/suit/roguetown/shirt/dress/gen/strapless

/datum/loadout_item/straplessdress
	name = "Strapless Dress, alt"
	path = /obj/item/clothing/suit/roguetown/shirt/dress/gen/strapless/alt

/datum/loadout_item/belldresblue
	name = "Blue bell dress"
	path = /obj/item/clothing/suit/roguetown/shirt/belldress

/datum/loadout_item/belldressred
	name = "Red bell dress"
	path = /obj/item/clothing/suit/roguetown/shirt/belldress/red

/datum/loadout_item/belldressyellow
	name = "Yellow bell dress"
	path = /obj/item/clothing/suit/roguetown/shirt/belldress/yellow

/datum/loadout_item/belldresscyan
	name = "Cyan bell dress"
	path = /obj/item/clothing/suit/roguetown/shirt/belldress/cyan

/datum/loadout_item/belldresspurple
	name = "Purple bell dress"
	path = /obj/item/clothing/suit/roguetown/shirt/belldress/purple

/datum/loadout_item/belldressblack
	name = "Black bell dress"
	path = /obj/item/clothing/suit/roguetown/shirt/belldress/black

/datum/loadout_item/belldresswhite
	name = "Fancy white dress"
	path = /obj/item/clothing/suit/roguetown/shirt/belldress/white

/datum/loadout_item/belldressbaroness
	name = "Baroness dress"
	path = /obj/item/clothing/suit/roguetown/shirt/belldress/baroness

//ACCESSORIES
/datum/loadout_item/stockings
	name = "Stockings"
	path = /obj/item/clothing/under/roguetown/tights/stockings

/datum/loadout_item/silkstockings
	name = "Silk Stockings"
	path = /obj/item/clothing/under/roguetown/tights/stockings/silk

/datum/loadout_item/fishnet
	name = "Fishnet Stockings"
	path = /obj/item/clothing/under/roguetown/tights/stockings/fishnet

//below are not clothes and may be valuable and well, clearly superior to having clothes but you only get one choice, and it's a 'loadout' so maybe its fine.
// Above clothing are usually hard to get on their own, some.

//ACCESSORIES
/datum/loadout_item/sring
	name = "Silver Ring"
	path = /obj/item/clothing/ring/silver

/datum/loadout_item/gring
	name = "Gold Ring"
	path = /obj/item/clothing/ring/gold

/datum/loadout_item/divine
	name = "Divine symbol"
	path = /obj/item/clothing/neck/roguetown/psicross

//ARMORS
//HEAD
/datum/loadout_item/lhelmet
	name = "Leather Helmet"
	path = /obj/item/clothing/head/roguetown/helmet/leather

/datum/loadout_item/tricorn
	name = "Tricorn"
	path =	/obj/item/clothing/head/roguetown/helmet/tricorn

/datum/loadout_item/bandana
	name = "Bandana"
	path =	/obj/item/clothing/head/roguetown/helmet/bandana

/datum/loadout_item/ihelmet
	name = "Iron Helmet"
	path = /obj/item/clothing/head/roguetown/helmet/skullcap

//FACE
/datum/loadout_item/ironmask
	name = "Iron Mask"
	path = /obj/item/clothing/mask/rogue/facemask

//NECK
/datum/loadout_item/ironcoif
	name = "Iron Coif"
	path = /obj/item/clothing/neck/roguetown/chaincoif/iron

/datum/loadout_item/irongorget
	name = "Iron Gorget"
	path = /obj/item/clothing/neck/roguetown/gorget

//ARMS
/datum/loadout_item/lbracers
	name = "Leather Bracers"
	path = /obj/item/clothing/wrists/roguetown/bracers/leather

/datum/loadout_item/ibracers
	name = "Iron Couters"
	path = /obj/item/clothing/wrists/roguetown/vambraces

//CHEST
/datum/loadout_item/iarmor
	name = "Iron Chainmaille"
	path =	/obj/item/clothing/suit/roguetown/armor/chainmail/iron

/datum/loadout_item/gambeson
	name = "Gambeson"
	path =	/obj/item/clothing/suit/roguetown/armor/gambeson

/datum/loadout_item/larmor
	name = "Leather Armor"
	path =	/obj/item/clothing/suit/roguetown/armor/leather

/datum/loadout_item/harmor
	name = "Hide Armor"
	path =	/obj/item/clothing/suit/roguetown/armor/leather/hide

//HANDS
/datum/loadout_item/lgloves
	name = "Heavy Leather Gloves"
	path = /obj/item/clothing/gloves/roguetown/leather/angle

/datum/loadout_item/igloves
	name = "Iron Chain Gloves"
	path =	/obj/item/clothing/gloves/roguetown/chain/iron

//LEGS
/datum/loadout_item/clegs
	name = "Iron Chausses"
	path = /obj/item/clothing/under/roguetown/chainlegs/iron

/datum/loadout_item/istockings
	name = "Iron Fishnets"
	path = /obj/item/clothing/under/roguetown/chainlegs/iron/fishnet

//FEET
/datum/loadout_item/iboots
	name = "Iron Boots"
	path =	/obj/item/clothing/shoes/roguetown/boots/armoriron

