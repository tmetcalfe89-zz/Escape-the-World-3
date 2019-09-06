#priority 3
// Holds all the scribe-specific data.
import crafttweaker.item.IItemStack;

static runicTomes as string[][] = [
  ["harm"],
  ["harvest"],
  ["luck"],
  ["protect"],
  ["speed"]
] as string[][];

function isValidRunicTome(tome as string) as bool {
  for i, runicTome in runicTomes {
    if (runicTome[0] == tome) {
      return true;
    }
  }
  return false;
}

function getRunicTome(tome as string) as IItemStack {
  if (!isValidRunicTome(tome)) {
    print(tome + " is an invalid runic tome.");
    return null;
  }
  return itemUtils.getItem("contenttweaker:runictome_" + tome);
}

static enchantedInks as string[][] = [
  ["calcified", "UNCOMMON", "Rib Bone"],
  ["withered", "RARE", "Withered Rib"],
  ["venomous", "UNCOMMON", "Chelicerae"],
  ["unstable", "UNCOMMON", "Catalyzing Gland"],
  ["oozing", "UNCOMMON", "Slime Pearl"],
  ["fuzzy", "UNCOMMON", "Bat Wing"],
  ["necrotic", "COMMON", "Zombie Heart"],
  ["molten", "RARE", "Molten Core"],
  ["stormy", "EPIC", "Eye of the Storm"],
  ["frosty", "UNCOMMON", "Frozen Core"],
  ["nebulous", "RARE", "Nebulous Heart"],
  ["inky", "COMMON", "Squid Beak"]
] as string[][];

function isValidEnchantedInk(ink as string) as bool {
  for i, enchantedInk in enchantedInks {
    if (enchantedInk[0] == ink) {
      return true;
    }
  }
  return false;
}

function getEnchantedInk(ink as string) as IItemStack {
  if (!isValidEnchantedInk(ink)) {
    print(ink + " is an invalid enchanted ink.");
    return null;
  }
  return itemUtils.getItem("contenttweaker:enchantedink_" + ink);
}

static enchantedBooks as string[][] = [
  ["Aqua Affinity","inky","harvest"],
  ["Bane of Arthropods","venomous","harm"],
  ["Blast Protection","unstable","protect"],
  ["Depth Strider","inky","speed"],
  ["Efficiency","oozing","harvest"],
  ["Feather Falling","fuzzy","protect"],
  ["Fire Aspect","molten","harm"],
  ["Fire Protection","molten","protect"],
  ["Flame","withered","harm"],
  ["Fortune","oozing","luck"],
  ["Frost Walker","frosty","speed"],
  ["Infinity","calcified","luck"],
  ["Knockback","unstable","harm"],
  ["Looting","nebulous","luck"],
  ["Luck of the Sea","inky","luck"],
  ["Lure","oozing","speed"],
  ["Mending","nebulous","protect"],
  ["Power","calcified","harm"],
  ["Projectile Protection","calcified","speed"],
  ["Protection","frosty","protect"],
  ["Punch","oozing","harm"],
  ["Respiration","inky","protect"],
  ["Sharpness","nebulous","harm"],
  ["Silk Touch","nebulous","harvest"],
  ["Smite","necrotic","harm"],
  ["Sweeping Edge","frosty","harm"],
  ["Thorns","withered","protect"],
  ["Unbreaking","calcified","protect"]
] as string[][];
