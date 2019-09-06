#priority 2
// Holds scribe-specific recipe registers and QoL functions.
import scripts.crafttweaker.CommonUtil;
import scripts.crafttweaker.CommonDatabase;
import scripts.crafttweaker.ScribeDatabase;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

/**
 * Gets the enchanted ink mash of the given name.
 * @param  {string} ink Name of the ink.
 * @return {IItemStack} The ink mash.
 */
function getEnchantedMash(ink as string) as IItemStack {
  return itemUtils.getItem("contenttweaker:enchantedinkmash_" + ink);
}

/**
 * Gets the enchanted ink mash of the given name.
 * @param  {string} ink Name of the ink.
 * @return {IItemStack} The ink.
 */
function getEnchantedInk(ink as string) as IItemStack {
  return itemUtils.getItem("contenttweaker:enchantedink_" + ink);
}

/**
 * Adds a shapeless scribe workbench recipe. Basically the CommonUtil function,
 * but with the table already set to scribe.
 * @param {IIngredient[]} input      The ingredients.
 * @param {IItemStack}    output     The finished product.
 * @param {IIngredient}   tool       The required tool. Can be null.
 * @param {string}        difficulty Difficulty (CommonDatabase.difficultyIndex)
 */
function addShapelessRecipe(input as IIngredient[], output as IItemStack, tool as IIngredient, difficulty as string) {
  CommonUtil.addShapelessWorkbenchRecipe(
    input,
    output,
    "scribe",
    tool,
    difficulty
  );
}

/**
 * Adds a shaped scribe workbench recipe. Basically the CommonUtil function, but
 * with the table already set to scribe.
 * @param {IIngredient[][]} input      The recipe.
 * @param {IItemStack}      output     The finished product.
 * @param {IIngredient}     tool       The required tool. Can be null.
 * @param {string}          difficulty Difficulty (CommonDatabase.difficultyIndex)
 */
function addShapedRecipe(input as IIngredient[][], output as IItemStack, tool as IIngredient, difficulty as string) {
  CommonUtil.addShapedWorkbenchRecipe(
    input,
    output,
    "scribe",
    tool,
    difficulty
  );
}

/**
 * Adds a recipe for making an enchanted ink mash. Mortar recipe with a specific
 * rare mob drop (from reliquary), and an ink sac, that turns into an enchanted
 * ink mash. Moderate difficulty.
 * @param {string} input  The name of the rare drop required.
 * @param {string} output The name of the ink mash to be made.
 */
function addEnchantedMashRecipe(input as string, output as string) {
  CommonUtil.addMortarRecipe(
    [
      <minecraft:dye:0>,
      CommonUtil.getRareDrop(input)
    ],
    getEnchantedMash(output),
    "MODERATE"
  );
}

/**
 * Adds a recipe for making an enchanted ink. Shapeless recipe with a water
 * bottle and the appropriate mash, and a quill to mix. Moderate difficulty.
 * @param {string} ink The name of the ink.
 */
function addEnchantedInkRecipe(ink as string) {
  addShapelessRecipe(
    [
      <minecraft:potion>.withTag({Potion: "minecraft:water"}),
      getEnchantedMash(ink)
    ],
    getEnchantedInk(ink),
    <ore:artisansQuill>,
    "MODERATE"
  );
}

/**
 * Adds a recipe for making an enchanted book. Shapeless recipe with a book,
 * the ink, and the tome. Uses a quill to trace the runes into the empty book.
 * The tome is not consumed. Diffiult difficulty.
 * @param {string[]} input  The ink and tome required.
 * @param {string}   output The enchantment.
 */
function addEnchantedBookRecipe(input as string[], output as string) {
  addShapelessRecipe(
    [
      <minecraft:book>,
      ScribeDatabase.getEnchantedInk(input[0]),
      ScribeDatabase.getRunicTome(input[1]).reuse()
    ],
    CommonUtil.getEnchantedBook(1, output),
    <ore:artisansQuill>,
    "DIFFICULT"
  );
}

/**
 * Adds a recipe for increasing the level of an enchantment on an enchanted
 * book. Shapeless recipe that calls for the current enchanted book and the ink
 * that was used to make it.
 * @param {string} level   The level to upgrade to.
 * @param {string} enchant The enchantment.
 */
function addEnchantedBookLevelRecipe(ink as string, level as string, enchant as string) {
  var lastLevel as int = (level as int) - 1;
  var enchantId as int = CommonDatabase.getEnchantId(enchant);

  var tool = <ore:artisansQuill>;

  addShapelessRecipe(
    [
      <minecraft:enchanted_book>
        .withTag({
          StoredEnchantments: [{
            lvl: lastLevel as short,
            id: enchantId as short
          }]
        }),
      getEnchantedInk(ink)
    ],
    <minecraft:enchanted_book>
      .withTag({
        StoredEnchantments: [{
          lvl: level as short,
          id: enchantId as short
        }]
      }),
    tool,
    "DIFFICULT"
  );
}
