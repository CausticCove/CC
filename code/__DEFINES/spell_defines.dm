// Constants for glow color used in spells
#define GLOW_COLOR_FIRE "#FF4500" // Red
#define GLOW_COLOR_ICE "#87CEEB" // Cyan
#define GLOW_COLOR_LIGHTNING "#FFD700" // Warm gold-yellow
#define GLOW_COLOR_BUFF "#A0E65C" // Green
#define GLOW_COLOR_VAMPIRIC "#8B0000" // Dark Red
#define GLOW_COLOR_METAL "#B0B8C8" // Silver-steel
#define GLOW_COLOR_EARTHEN "#8B6914" // Brown, for earthen / stone spells
#define GLOW_COLOR_DISPLACEMENT "#9400D3" // Purple, for generic displacement / CC spells
#define GLOW_COLOR_ARCANE "#7878F0" // Blue-purple, for generic arcane spells
#define GLOW_COLOR_KINESIS "#7B68EE" // Purple, pure arcana
#define GLOW_COLOR_HEX "#b884f8" // Hex purple
#define GLOW_COLOR_ILLUSION "#CE93D8" // Illusory pink-purple
#define GLOW_COLOR_HEARTH "#FF8A65" // Warm hearthfire salmon
#define GLOW_COLOR_LIGHT "#FFFDE7" // Pale warm white, for light spells
#define GLOW_COLOR_WARD "#D4A844" // Warm amber-gold, for battlewardry / protective ward spells
#define GLOW_COLOR_BARDIC "#E8837C" // Warm rose, for bardic songs and cadences

//Gods - Tennite
#define GLOW_COLOR_UNDIVIDED "#28908C" //Undivided Cyan
#define GLOW_COLOR_ASTRATA "#F9B362" //Astratan Yellow/Orange
#define GLOW_COLOR_NOC "#9acdff" //Noc's lightbulb
#define GLOW_COLOR_RAVOX "#7A1E30" //Ravox Crimson
#define GLOW_COLOR_MALUM "#884610" //Malum Orange

// Constants for spell glow intensity. These are literally 1 2 3 4 but it is for documenting design purposes
#define GLOW_INTENSITY_LOW 1 // For spam projectiles or generic buffs
#define GLOW_INTENSITY_MEDIUM 2 // Anything that would hurt quite a bit
#define GLOW_INTENSITY_HIGH 3 // Large AOE
#define GLOW_INTENSITY_VERY_HIGH 4 // Greater Fireball or Massive AOE / T4 spells

//Gods - Ascendant
#define GLOW_COLOR_GRAGGAR "#19345E" //Graggar Dark Blue
#define GLOW_COLOR_ZIZO "#b76bff" //Graggar Dark Purple
#define GLOW_COLOR_BAOTHA "#ff008c" //Baotha Violent Rose
#define GLOW_COLOR_MATTHIOS "#ffd900" //Matthios Golden


// Constants for enchantment effects (used by fit_clothing, gems, etc.)
#define FORCE_BLADE_ENCHANT 2
#define DURABILITY_ENCHANT 3
#define DURABILITY_INCREASE 100
#define FORCE_FILTER "force_blade"
#define DURABILITY_FILTER "durability_enchant"

// Spell CD / Chargetime Scaling
#define SPELL_SCALING_THRESHOLD 10 // The threshold at which the spell scaling starts to kick in
#define SPELL_POSITIVE_SCALING_THRESHOLD 15 // The threshold at which spell scaling stop
#define COOLDOWN_REDUCTION_PER_INT 0.05 // The amount of cooldown reduction per point of intelligence above / below threshold
#define FATIGUE_REDUCTION_PER_INT 0.05 // Stamina cost reduction per INT above threshold. 5 points above = 25% max reduction

// Armor Penalty - We applies to cooldown because we want static stamina cost
#define MEDIUM_ARMOR_CD_PENALTY 0.15 // Cooldown multiplier for wearing medium armor
#define HEAVY_ARMOR_CD_PENALTY 0.3 // Cooldown multiplier for wearing heavy armor
#define UNTRAINED_ARMOR_CD_PENALTY 0.8 // Cooldown multiplier for wearing armor you're not trained in

// Standardized spell stamina costs //Caustic Edit - Adjusting these costs! Defaults listed in a comment the same line as the entry, if it got changed.
#define SPELLCOST_CANTRIP            5
#define SPELLCOST_MINOR_PROJECTILE   2 // Should feels good to spam and not stamcrit you //Default: 10 - 2 is more in line with a regular melee swing
#define SPELLCOST_MAJOR_PROJECTILE   10 // 20 seems decent //Default: 20 - 10 is a strong attack, so, this feels fitting?
#define SPELLCOST_SUPER_PROJECTILE   45 // Only used for GFB for now as an intermediary //Not currently used actually?
#define SPELLCOST_ULTIMATE           40 //Default: 70 - 10 is a strong attack, so, this feels fitting?
#define SPELLCOST_MINOR_AOE          10 //Default: 15
#define SPELLCOST_MAJOR_AOE          20 //Default: 30
#define SPELLCOST_SINGLE_CC          15 //Default: 30 - A bit higher then a stronger attack, because CC is added
#define SPELLCOST_UTILITY_BUFF       5 // See below
#define SPELLCOST_STAT_BUFF          5 // With new Augmentation design we don't really need to gate this hard anymore
#define SPELLCOST_BRUSH 			 50 // For blood rush spells, which I don't want to become an overly easy trade for stamina //Not currently used actually?
#define SPELLCOST_SURGE 			 40 // For surge spells, which is pretty damn powerful //Default: 65 - This IS pretty powerful, so at LEAST should be equal to an ult.
#define SPELLCOST_AUGURY             10 // Augury card is cheap //Not currently used actually?
#define SPELLCOST_CONJURE            10 //Default: 20
#define SPELLCOST_TELEPORT           15 //Default: 15 - Same as the (adjusted) CC spells seems fair?
#define SPELLCOST_MINOR_SUMMON       10 //Default: 30 - Only used for 'blade of psydon'
#define SPELLCOST_MAJOR_SUMMON       40 //Default: 50 - Only used for Raise Deadite right now?
// Buff duration tiers
#define STAT_BUFF_SELF_DURATION      1 MINUTES
#define STAT_BUFF_ALLY_DURATION      1 MINUTES
#define ATTUNE_BUFF_DURATION         45 SECONDS // Attune (Giant/Hawk/Haste) uptime, against a 90s cooldown
#define UTILITY_AOE_BUFF_DURATION    15 MINUTES

// Augmentation augury hand
#define AUGURY_DURATION              22 SECONDS // Nearly 100% uptime on 15 int.
#define AUGURY_HAND_COOLDOWN         30 SECONDS
#define AUGURY_GROUP                 "augury" // Buff exclusivity group - a person bears at most one Augury at a time
#define AUGMENT_CONDUIT_RANGE        7
#define AUGMENT_CONDUIT_MAX_LINKS    2

//Miracle costs in devotion used.
#define SPELLCOST_MIRACLE_ORISON	 5
#define SPELLCOST_MIRACLE_MINOR		 15
#define SPELLCOST_MIRACLE            30
#define SPELLCOST_MIRACLE_MAJOR      60
#define SPELLCOST_MIRACLE_LEGENDARY  100 //Highest tiers of miracles should have this.


#define SPELLCOST_MINOR_SKILL        20 //Default 30 - Only used for two spells, an undivided one and a special luminary one, they seem somewhat hefty.
#define SPELLCOST_MAJOR_SKILL        50 //Not currently used actually?

// Spellblade specific cost
#define SPELLCOST_SB_POKE 2 // Roughly 3 attacks worth //Default 12 - Same for other pokes above.
#define SPELLCOST_SB_MOBILITY 12 // Dashes / Teleports / Anchor //Default 12 - Actually seems solid here.
#define SPELLCOST_SB_ULT 40 // Their ult //Default 50 - Why was this cheaper then the other ults originally? Now in line with the others.

#define SPELLCOST_FORM_BLADE 10 //Default 30 - In line with the other Conjures above
//Caustic Edit End

// Standardized charge times — keeps poke/major/heavy spells consistent for balance passes
#define CHARGETIME_POKE          0.5 SECONDS  // Staple poke spells
#define CHARGETIME_MINOR         1 SECONDS    // Minor utility / support spells
#define CHARGETIME_MAJOR         1.5 SECONDS  // Major projectiles
#define CHARGETIME_HEAVY         2 SECONDS    // Heavy AOE / ultimates
#define CHARGETIME_BARRAGE 	     3 SECONDS // Barrage / Channeled spells

// Standardized mage projectile speeds — lower = faster
#define MAGE_PROJ_FAST        1.25  // Quick bolts (arcyne bolt, frost bolt)
#define MAGE_PROJ_MEDIUM      1.75  // Mid-range projectiles (spitfire, lance)
#define MAGE_PROJ_SLOW        2     // Heavier projectiles (gravel blast)
#define MAGE_PROJ_VERY_SLOW   2.5   // Looming doom (fireball)

// Standardized spell ranges
#define SPELL_RANGE_PROJECTILE 10  // Standard projectile travel distance and projectile spell cast range
#define SPELL_RANGE_GROUND     7   // Standard ground-targeted / AOE spell cast range
#define SPELL_RANGE_TWO_SCREENS 14 // Two screens away for very very special spells
#define SPELL_RANGE_AURA	   4   // For 'warcry' type miracles or AOE BUFFS originating on the caster
#define SPELL_RANGE_ADJACENT   1   // Self explanatory

// Mage projectile effective range - full damage/effect within, degrades beyond (max_range on the projectile)
#define MAGE_LONG_PROJ_RANGE   7   // Long-range bolts (arcyne bolt, fireball, lightning, soulshot)
#define MAGE_MID_PROJ_RANGE    5   // Mid-range bolts (arc bolt, greater arcyne bolt, stygian)

// Charging slowdown tiers — how much the caster is slowed while charging
#define CHARGING_SLOWDOWN_NONE 0       // Spellblade abilities, no movement penalty
#define CHARGING_SLOWDOWN_SMALL 1      // Small projectiles, minor spells
#define CHARGING_SLOWDOWN_MEDIUM 2     // Big projectiles, significant spells
#define CHARGING_SLOWDOWN_HEAVY 3      // Area denial, channeled spells

#define SPELL_COOLDOWN_POKE 6 SECONDS
#define SPELL_COOLDOWN_BIG_WHOOPER 18 SECONDS

// Spell impact visual intensity tiers
#define SPELL_IMPACT_NONE   0  // No impact visual
#define SPELL_IMPACT_LOW    1  // 2 wisps — minor pokes, utility
#define SPELL_IMPACT_MEDIUM 2  // 4 wisps — staple projectiles, soulshot
#define SPELL_IMPACT_HIGH   3  // 6 wisps — big hits, fireball, boulder

// Rune Ward types and icon states
#define RUNE_WARD_STUN "stun"
#define RUNE_WARD_FIRE "fire"
#define RUNE_WARD_CHILL "chill"
#define RUNE_WARD_DAMAGE "damage"
#define RUNE_WARD_ALARM "alarm"
#define RUNE_WARD_ICON_STUN "rune_stun"
#define RUNE_WARD_ICON_FIRE "rune_fire"
#define RUNE_WARD_ICON_CHILL "rune_chill"
#define RUNE_WARD_ICON_DAMAGE "rune_damage"
#define RUNE_WARD_ICON_ALARM "rune_alarm"

// Magic Aspect system - default slot counts (overridden by mage_aspect_config per class)
#define MAX_MAJOR_ASPECTS 1
#define MAX_MINOR_ASPECTS 2
#define ASPECT_MAJOR "major"
#define ASPECT_MINOR "minor"
#define ASPECT_PSEUDO "pseudo"

// Telegraph delay tiers (in ticks)
#define TELEGRAPH_SKILLSHOT 4   // Fast - requires prediction to dodge
#define TELEGRAPH_DODGEABLE 8   // Reactable - can dodge on reaction
#define TELEGRAPH_HIGH_IMPACT 12 // Slow - highly telegraphed, big payoff
#define TELEGRAPH_AREA_DENIAL 16 // Very Slow - AOE or ground targeted, requires setup to avoid
#define TELEGRAPH_ULTIMATE 20 // Supremely slow. Getting hit is your own fault

#define ASPECT_NAME_PYROMANCY   "Fire"
#define ASPECT_NAME_CRYOMANCY   "Frost"
#define ASPECT_NAME_FULGURMANCY "Storms"
#define ASPECT_NAME_GEOMANCY    "Stone"
#define ASPECT_NAME_KINESIS     "Force"
#define ASPECT_NAME_FERRAMANCY  "Metal"
#define ASPECT_NAME_SPELLSWORD  "Spellsword"
#define ASPECT_NAME_AUGMENTATION "Enhancement"
#define ASPECT_NAME_BATTLEWARDRY "Wards"
#define ASPECT_NAME_TELOMANCY   "Trajectory"
#define ASPECT_NAME_CONJURATION "Summoning"

// Arcyne ward tier hierarchy - higher tier wards override lower, equal or lower cannot override
#define ARCYNE_WARD_TIER_OTHER   1 // Other Ward (cast on allies)
#define ARCYNE_WARD_TIER_BASE    4 // Standard arcyne ward (self-cast)
#define ARCYNE_WARD_TIER_GREATER 5 // Dragonhide / Crystalhide upgrades

#define VARIANT_ADDITIVE "__additive__"

// Resolves the order in which spells are sorted
#define ASPECT_CHOICE "__choice__"
#define ASPECT_POINTBUY "__pointbuy__"

// Weapon-in-hand casting penalty — applied when casting a penalized spell while holding a non-implement rogueweapon
#define WEAPON_CAST_PENALTY 0.3

// Leyline teleportation matrix passenger limits
#define TELEPORT_MAX_PASSENGERS 6
#define TELEPORT_MAX_NONMAGES 3

// Spell implement tiers and multipliers
#define IMPLEMENT_TIER_LESSER  1
#define IMPLEMENT_TIER_GREATER 2
#define IMPLEMENT_TIER_GRAND   3

// Fraction of a spell's resource cost that the Residual Focus buff returns over 20 seconds.
#define IMPLEMENT_REFUND_LESSER  0.20
#define IMPLEMENT_REFUND_GREATER 0.275
#define IMPLEMENT_REFUND_GRAND   0.35

// Lightning Specific constants
#define LIGHTNING_ADAPTATION_COOLDOWN 15 SECONDS
#define MT_LIGHTNING_ADAPTATION "lightning_adaptation"

// Gravity Specific constants
#define GRAVITY_ADAPTATION_COOLDOWN 15 SECONDS
#define MT_GRAVITY_ADAPTATION "gravity_adaptation"

// Temporary — move back to components.dm once PR #6301 merges
#define COMSIG_MOB_KICKED_SUCCESSFUL "mob_kicked_successful" //from /mob/living/proc/try_kick(). Sent to target after a kick lands (past dodge/parry).

// Aspect
#define ASPECT_RESET_BUDGET 6
#define ASPECT_RESET_COST_MAJOR 4
#define ASPECT_RESET_COST_MINOR 2
#define ASPECT_RESET_COST_UTILITY 1
#define ASPECT_RESET_COST_CHOICE 2
#define ARCANE_MARK_FILTER_WEAPON "arcane_mark_enchant"
#define ARCANE_MARK_COOLDOWN 12 SECONDS

//CC Edit Begin

//Handles the Orison Thaumaturgy comms.
#define SPEAKING_TO_ALL "all"
#define SPEAKING_TO_SAME_PATRONS_ONLY "same_patrons"
#define SPEAKING_TO_CHURCH_ONLY "church_only"
#define SPEAKING_TO_ASCENDANTS_ONLY "ascendants_only"

//CC Edit End
