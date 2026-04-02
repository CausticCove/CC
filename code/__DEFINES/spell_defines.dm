// Constants for glow color used in spells
#define GLOW_COLOR_FIRE "#FF4500" // Red
#define GLOW_COLOR_ICE "#87CEEB" // Cyan
#define GLOW_COLOR_LIGHTNING "#FFFF00" // Yellow
#define GLOW_COLOR_BUFF "#A0E65C" // Green
#define GLOW_COLOR_VAMPIRIC "#8B0000" // Dark Red
#define GLOW_COLOR_METAL "#808080" // Gray
#define GLOW_COLOR_DISPLACEMENT "#9400D3" // Purple, for generic displacement / CC spells
#define GLOW_COLOR_ARCANE "#6495ED" // Light Blue, for generic arcane spells

// Constants for spell glow intensity. These are literally 1 2 3 4 but it is for documenting design purposes
#define GLOW_INTENSITY_LOW 1 // For spam projectiles or generic buffs
#define GLOW_INTENSITY_MEDIUM 2 // Anything that would hurt quite a bit
#define GLOW_INTENSITY_HIGH 3 // Large AOE
#define GLOW_INTENSITY_VERY_HIGH 4 // Greater Fireball or Massive AOE / T4 spells

// Constants for enchanted_weapon
#define FORCE_BLADE_ENCHANT 2
#define DURABILITY_ENCHANT 3
#define ARCANE_MARK_ENCHANT 4
#define FORCE_BLADE_FORCE 5
#define DURABILITY_INCREASE 100
#define FORCE_FILTER "force_blade"
#define DURABILITY_FILTER "durability_enchant"
#define ARCANE_MARK_FILTER_WEAPON "arcane_mark_enchant"
#define ARCANE_MARK_COOLDOWN 12 SECONDS

//CC Edit Begin
//These define the logic in which the spell should be casted when mobs are attempting to cast spells at another target.
//We should look for another spell we can use. This is used exclusively for spells like Orison which do not impact combat or gameplay in any way.
#define LOGIC_NONE 0
//The spell should be cast on our current target. This is the default state of all spell logic, effectively the same as LOGIC_COMBAT, and is called before any other logic checks are made.
//This logic does not make any other checks. This is ideal for spells that only need a point target to be casted on.
#define LOGIC_GENERIC 1
//The spell is a combat spell and should be used against anything not our ally.
#define LOGIC_COMBAT 2
//The spell is a supportive spell and we should use it on our ally, if no ally is in sight, attempt to use it on ourselves.
#define LOGIC_SUPPORTIVE 3
//The spell is both combative and utility, capable of harming/hindering enemies whilst buffing allies within the same faction.
//We prioritize allies with these and assume the spell has different effects based on faction differences.
#define LOGIC_UTILITY 4
//The spell should only be casted on ourselves.
#define LOGIC_SELFCAST 5
//The spell is a healing spell and should only prioritize allies who are actively injured.
#define LOGIC_HEAL 6
//The spell acts as a structure (like campfires) and actively provides an AOE effect. Place it anywhere around us in a small area within 3 tiles that is not on our LOS path to the target.
//This is also useful for "summon" spells so we do not summon mobs directly on top of our target or in front of us, as we do not want to be too difficult to kill.
#define LOGIC_STRUCTURE 7
//The spell requires the caster to stand still for a duration of time. Such as blood transfer miracles.
#define LOGIC_HEAL_STATIONARY 8
//The spell requires the caster to only target nearby targets that are DEAD. This is used with the Necromancer and any possible Revival spells.
#define LOGIC_DEAD 9
//CC Edit End
