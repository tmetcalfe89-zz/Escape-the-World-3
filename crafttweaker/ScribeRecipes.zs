#priority 1
// Registers recipes for the scribe class.
import scripts.crafttweaker.CommonDatabase;
import scripts.crafttweaker.CommonUtil;
import scripts.crafttweaker.ScribeDatabase;
import scripts.crafttweaker.ScribeUtil;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

// Sugar cane to cane pulp
CommonUtil.addMortarRecipe(
  [<ore:sugarcane> * 3],
  <contenttweaker:canepulp>,
  "EASY"
);

// Cane pulp to wet cane pulp
CommonUtil.addWaterDipRecipe(
  <contenttweaker:canepulp>,
  <contenttweaker:wetcanepulp>
);

// Wet cane pulp to wet paper
ScribeUtil.addShapelessRecipe(
  [<contenttweaker:wetcanepulp>],
  <contenttweaker:wetpaper>,
  <ore:artisansSifter>,
  "EASY"
);

// Wet paper to paper
CommonUtil.addDryingRecipe(
  <contenttweaker:wetpaper>,
  <minecraft:paper>,
  "EASY"
);

// Paper to book
ScribeUtil.addShapedRecipe(
  [
    [
      null,
      <minecraft:paper>,
      <minecraft:paper>
    ],
    [
      <contenttweaker:bookcover>,
      <minecraft:paper>,
      <minecraft:paper>
    ],
    [
      null,
      <minecraft:paper>,
      <minecraft:paper>
    ]
  ],
  <minecraft:book>,
  <ore:artisansNeedle>,
  "EASY"
);

// Ink sac to ink base
CommonUtil.addMortarRecipe(
  [<minecraft:dye:0>],
  <contenttweaker:inkbase>,
  "EASY"
);

// Ink base to mundane ink
ScribeUtil.addShapelessRecipe(
  [
    <minecraft:potion>.withTag({Potion: "minecraft:water"}),
    <contenttweaker:inkbase>
  ],
  <contenttweaker:mundaneink>,
  <ore:artisansQuill>,
  "EASY"
);

// Mundane ink to book and quill
ScribeUtil.addShapelessRecipe(
  [
    <minecraft:book>,
    <contenttweaker:mundaneink>,
    <ore:artisansQuill>
  ],
  <minecraft:writable_book>,
  null,
  "EASY"
);

// Enchanted mashes and inks
for i, inkDesc in ScribeDatabase.enchantedInks {
  ScribeUtil.addEnchantedMashRecipe(inkDesc[2], inkDesc[0]);
  ScribeUtil.addEnchantedInkRecipe(inkDesc[0]);
}

// Enchanted books
for i, bookDesc in ScribeDatabase.enchantedBooks {
  var enchant = bookDesc[0];
  var ink = bookDesc[1];
  var tome = bookDesc[2];

  ScribeUtil.addEnchantedBookRecipe([ink, tome], enchant);

  var levels as int = CommonDatabase.getEnchantLevels(enchant);

  if (levels > 1) {
    for level in 2 to levels {
      ScribeUtil.addEnchantedBookLevelRecipe(ink, level, enchant);
    }
  }
}
