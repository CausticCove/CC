/* Utility spells - non-combat support magic or very niche in combat spells meant to be freely available
to all mage classes.
*/
GLOBAL_LIST_INIT(utility_spells, (list(
		/datum/action/cooldown/spell/arcyne_forge/lesser, //Caustic Edit - Add a lesser version of Arcyne Forge! Slightly longer cooldown, much less variety.
		/datum/action/cooldown/spell/chill_food,
		/datum/action/cooldown/spell/create_campfire,
		/datum/action/cooldown/spell/darkvision,
		///datum/action/cooldown/spell/find_familiar, //Caustic Edit - Attempting to just run with the Binding Ritual instead of this spell!
		/datum/action/cooldown/spell/greater_cleaning,
		/datum/action/cooldown/spell/lesser_knock,
		/datum/action/cooldown/spell/light,
		/datum/action/cooldown/spell/magicians_brick,
		/datum/action/cooldown/spell/magicians_stone,
		/datum/action/cooldown/spell/magicians_rock,
		/datum/action/cooldown/spell/mending,
		/datum/action/cooldown/spell/mending/lesser, //Caustic Edit - New lesser mending, from Mage 2!
		/datum/action/cooldown/spell/message,
		/datum/action/cooldown/spell/mindlink,
		/datum/action/cooldown/spell/mirror_transform,
		/datum/action/cooldown/spell/nondetection,
		/datum/action/cooldown/spell/projectile/lesser_fetch,
		/datum/action/cooldown/spell/projectile/lesser_repel,
		/datum/action/cooldown/spell/shape_wood, // Caustic Edit
		/datum/action/cooldown/spell/shape_branch, // Caustic Edit - New spells, make wood
		/datum/action/cooldown/spell/touch/rune_ward,
		/obj/effect/proc_holder/spell/targeted/touch/sizespell, //Caustic edit -- Jon: This should function fine! Probably? Should be re-tooled to work with the new system.
		///obj/effect/proc_holder/spell/invoked/conjure_tool/mage, // Caustic Edit -- Jon: This one probably isn't needed as much anymore, Arcyne Forge (lesser) is basically the intended replacement!
		)
))

