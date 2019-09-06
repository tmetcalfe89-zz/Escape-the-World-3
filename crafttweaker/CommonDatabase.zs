#priority 3
// Holds all the common data as well as convenience functions.
static difficultyIndex as int[string] = {
  "EASY": 1,
  "MODERATE": 2,
  "DIFFICULT": 3
} as int[string];

function isValidDifficulty(difficulty as string) as bool {
  for i, difficultyI in difficultyIndex {
    if (i == difficulty) {
      return true;
    }
  }
  return false;
}

function getDifficultyValue(difficulty as string) as int {
  if (!isValidDifficulty(difficulty)) {
    print(difficulty + " is an invalid difficulty.");
    return 0;
  }
  return difficultyIndex[difficulty] as int;
}

static rarityIndex as int[string] = {
  "COMMON": 1,
  "UNCOMMON": 2,
  "RARE": 3,
  "EPIC": 4
} as int[string];

function isValidRarity(rarity as string) as bool {
  for i, rarityI in rarityIndex {
    if (i == rarity) {
      return true;
    }
  }
  return false;
}

function getRarityValue(rarity as string) as int {
  if (!isValidRarity(rarity)) {
    print(rarity + " is an invalid rarity.");
    return 0;
  }
  return rarityIndex[rarity] as int;
}

static enchantIndex as int[string] = {
  "Protection": 0,
  "Fire Protection": 1,
  "Feather Falling": 2,
  "Blast Protection": 3,
  "Projectile Protection": 4,
  "Respiration": 5,
  "Aqua Affinity": 6,
  "Thorns": 7,
  "Depth Strider": 8,
  "Frost Walker": 9,
  "Curse of Binding": 10,
  "Sharpness": 16,
  "Smite": 17,
  "Bane of Arthropods": 18,
  "Knockback": 19,
  "Fire Aspect": 20,
  "Looting": 21,
  "Sweeping Edge": 22,
  "Efficiency": 32,
  "Silk Touch": 33,
  "Unbreaking": 34,
  "Fortune": 35,
  "Power": 48,
  "Punch": 49,
  "Flame": 50,
  "Infinity": 51,
  "Luck of the Sea": 61,
  "Lure": 62,
  "Mending": 70,
  "Curse of Vanishing": 71
} as int[string];

function isValidEnchant(enchant as string) as bool {
  for i, enchantI in enchantIndex {
    if (i == enchant) {
      return true;
    }
  }
  return false;
}

function getEnchantId(enchant as string) as int {
  if (!isValidEnchant(enchant)) {
    print(enchant + " is an invalid enchant.");
    return 0;
  }
  return enchantIndex[enchant] as int;
}

static enchantLevels as int[string] = {
  "Protection": 4,
  "Fire Protection": 4,
  "Feather Falling": 4,
  "Blast Protection": 4,
  "Projectile Protection": 4,
  "Respiration": 3,
  "Aqua Affinity": 1,
  "Thorns": 3,
  "Depth Strider": 3,
  "Frost Walker": 2,
  "Curse of Binding": 1,
  "Sharpness": 5,
  "Smite": 5,
  "Bane of Arthropods": 5,
  "Knockback": 2,
  "Fire Aspect": 2,
  "Looting": 3,
  "Sweeping Edge": 3,
  "Efficiency": 5,
  "Silk Touch": 1,
  "Unbreaking": 3,
  "Fortune": 3,
  "Power": 5,
  "Punch": 2,
  "Flame": 1,
  "Infinity": 1,
  "Luck of the Sea": 3,
  "Lure": 3,
  "Mending": 1,
  "Curse of Vanishing": 1
} as int[string];

function getEnchantLevels(enchant as string) as int {
  if (!isValidEnchant(enchant)) {
    print(enchant + " is an invalid enchant.");
    return 0;
  }
  return enchantLevels[enchant] as int;
}

static rareDropIndex as int[string] = {
  "Rib Bone": 0,
  "Withered Rib": 1,
  "Chelicerae": 2,
  "Catalyzing Gland": 3,
  "Slime Pearl": 4,
  "Bat Wing": 5,
  "Zombie Heart": 6,
  "Molten Core": 7,
  "Eye of the Storm": 8,
  "Frozen Core": 10,
  "Nebulous Heart": 11,
  "Squid Beak": 12
} as int[string];

function isValidRareDrop(rareDrop as string) as bool {
  for i, rareDropI in rareDropIndex {
    if (i == rareDrop) {
      return true;
    }
  }
  return false;
}

function getRareDropId(rareDrop as string) as int {
  if (!isValidRareDrop(rareDrop)) {
    print(rareDrop + " is an invalid rare drop.");
    return 0;
  }
  return rareDropIndex[rareDrop] as int;
}

static armorSlots as string[][] = [
  ["helmet"],
  ["chestplate"],
  ["leggings"],
  ["boots"],
  ["horse_armor"]
] as string[][];

static armorTypes as string[][] = [
  ["leather"],
  ["iron"]
] as string[][];

function isValidArmorType(armor as string) as bool {
  for i, armorType in armorTypes {
    if (armorType[0] == armor) {
      return true;
    }
  }
  return false;
}

function isValidArmorSlot(slot as string) as bool {
  for i, armorSlot in armorSlots {
    if (armorSlot[0] == slot) {
      return true;
    }
  }
  return false;
}
