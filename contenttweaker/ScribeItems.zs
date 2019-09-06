#loader contenttweaker
import scripts.contenttweaker.ScribeDatabase;
import scripts.contenttweaker.ItemMaker.make;
import scripts.contenttweaker.ItemMaker.register;
import scripts.contenttweaker.ItemMaker.makeAndRegister;
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;

function makeRunicTome(tome as string) as Item {
  var newTome = make("runictome_" + tome, 1);
  newTome.rarity = "RARE";
  return newTome;
}

function registerRunicTome(tome as string) {
  register(makeRunicTome(tome));
}

function makeEnchantedInk(ink as string, rarity as string) as Item {
  var newInk = make("enchantedink_" + ink, 1);
  newInk.glowing = true;
  newInk.rarity = rarity;
  return newInk;
}

function registerEnchantedInk(ink as string, rarity as string) {
  register(makeEnchantedInk(ink, rarity));
}

function makeEnchantedInkMash(type as string) as Item {
  return make("enchantedinkmash_" + type, 64);
}

function registerEnchantedInkMash(type as string) {
  register(makeEnchantedInkMash(type));
}

// Load misc
for i, misc in ScribeDatabase.miscItems {
  makeAndRegister(misc[0], misc[1]);
}

// Tomes
for i, tome in ScribeDatabase.runicTomes {
  registerRunicTome(tome[0]);
}

// Enchanted inks and mashes
for i, ink in ScribeDatabase.enchantedInks {
  registerEnchantedInk(ink[0], ink[1]);
  registerEnchantedInkMash(ink[0]);
}
