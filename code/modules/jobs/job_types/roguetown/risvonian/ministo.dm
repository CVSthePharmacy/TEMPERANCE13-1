/datum/job/roguetown/ministo
	title = "Ministo"
	flag = MINISTO
	department_flag = RISVON
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	allowed_races = RACES_CONSCRIPT
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)

	tutorial = "You're Risvonian Sapper Support. \
				You're supposed to obey the orders of the Oficiro and Commandant, while working with your squadron to break through the enemy line. \
				In essense, your task is to slam your Maul against the enemy's defenses, and later the enemy themselves when you've made an opening. \
				You've been trained on how to use explosives, and are expected to use them on their fortifications. Make use of them." 

	outfit = /datum/outfit/job/roguetown/ministo
	display_order = JDO_MINISTO
	give_bank_account = TRUE
	min_pq = 0
	max_pq = null

	cmode_music = 'sound/music/combat_ministo.ogg'

/datum/job/roguetown/ministo/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(istype(H.wear_ring, /obj/item/roguekey/risvon))
			var/obj/item/clothing/S = H.wear_ring
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = " [index]'s nailtag"

/datum/outfit/job/roguetown/ministo/pre_equip(mob/living/carbon/human/H)
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/lord
	shoes = /obj/item/clothing/shoes/roguetown/armor/rishighboots
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron/ziggurate
	cloak = /obj/item/clothing/cloak/templar/malumite
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
	head = /obj/item/clothing/head/roguetown/helmet/kettle/iron/visored
	mask = /obj/item/clothing/mask/rogue/gasmask/risvonmask
	belt = /obj/item/storage/belt/rogue/leather/black/soldier
	beltl = /obj/item/gun/ballistic/revolver/sawedoff
	beltr = /obj/item/storage/belt/rogue/pouch/sappersatchel/full
	wrists = /obj/item/scomstone
	gloves = /obj/item/clothing/gloves/roguetown/eastgloves1
	backl = /obj/item/rogueweapon/mace/maul
	backr = /obj/item/storage/backpack/rogue/backpack/risvon
	id = /obj/item/roguekey/risvon
	backpack_contents = list(
		/obj/item/storage/belt/rogue/pouch/coins/mid,
		/obj/item/grenade/gas/smoke,
		/obj/item/bomb/dynamite,
		/obj/item/bomb/dynamite,
		/obj/item/rogueweapon/stoneaxe/woodcut/risvon,
		/obj/item/rope,
		/obj/item/rogueweapon/shovel/small/etool,
		/obj/item/flashlight/flare/torch/lantern,
		/obj/item/ammo_box/handfuls/shotgun/buckshot = 6,
	)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 4, TRUE) // THEY DO NOT GET SWORDS, THEY ARE SAVAGES, THEY USE MAULS AND AXES, LET THEM HAVE THIS
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 4, TRUE) // they are also better than soldatos at axes, gives them a 10% chance to better get by parries
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/armorsmithing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/weaponsmithing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE)
	H.change_stat("strength", 5) // you need this to wield the Maul.
	H.change_stat("constitution", 2) // you need this to not die from the incoming fire while you get close
	H.change_stat("speed", -1) // all that gear you're carrying isn't gonna make you any lighter, is it?
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_LONGSTRIDER, TRAIT_GENERIC)
