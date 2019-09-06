#priority 2
// Holds common recipe registers and QoL functions.
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.advancedmortars.Mortar;
import mods.artisanworktables.builder.RecipeBuilder;
import mods.inworldcrafting.FluidToItem;
import mods.pyrotech.DryingRack;
import scripts.crafttweaker.CommonDatabase;

/**
 * Creates an enchanted book with the given level enchantment.
 * @param  {int}    level   Level of the enchantment.
 * @param  {string} enchant Name of the enchantment.
 * @return {IItemStack}     Enchanted book with the given level enchantment.
 */
function getEnchantedBook(level as int, enchant as string) as IItemStack {
  return <minecraft:enchanted_book>.withTag({
    StoredEnchantments: [{
      lvl: level as short,
      id: CommonDatabase.getEnchantId(enchant) as short
    }]
  });
}

/**
 * Gets the rare drop of the given name.
 * @param  {string} name Name of the rare drop.
 * @return {IItemStack}  The rare drop.
 */
function getRareDrop(name as string) as IItemStack {
  return itemUtils.getItem(
    "xreliquary:mob_ingredient",
    CommonDatabase.getRareDropId(name)
  );
}

/**
 * Gets the amount of clicks required to finish a mortar recipe based on
 * difficulty.
 * @param  {string} difficulty The difficulty (CommonDatabase.difficultyIndex)
 * @return {int}               The number of clicks required.
 */
function getMortarDifficultyModifier(difficulty as string) as int {
  return CommonDatabase.getDifficultyValue(difficulty) * 10;
}

/**
 * Gets the damage dealt to a tool and experience required for a workbench
 * recipe.
 * @param  {string} difficulty The difficulty (CommonDatabase.difficultyIndex)
 * @return {int}               The value required.
 */
function getWorkbenchDifficultyModifier(difficulty as string) as int {
  print(5 * (CommonDatabase.getDifficultyValue(difficulty) - 1));
  return max(1, 5 * (CommonDatabase.getDifficultyValue(difficulty) - 1));
}

/**
 * Gets the time required for a drying recipe.
 * @param  {string} difficulty The difficulty (CommonDatabase.difficultyIndex)
 * @return {int}               The value required.
 */
function getDryingDifficultyModifier(difficulty as string) as int {
  return CommonDatabase.getDifficultyValue(difficulty) * 200;
}

/**
 * Adds a mortar recipe.
 * @param {IIngredient[]} input       Required ingredients.
 * @param {IItemStack}    output      Product.
 * @param {int}           difficulty  Difficulty (CommonDatabase.difficultyIndex)
 */
function addMortarRecipe(input as IIngredient[], output as IItemStack, difficulty as string) {
  Mortar.addRecipe(
    ["stone"],
    output,
    getMortarDifficultyModifier(difficulty),
    input
  );
}

/**
 * Adds a recipe for throwing an item in water.
 * @param {IIngredient} input  The dry item.
 * @param {IItemStack}  output The wet item.
 */
function addWaterDipRecipe(input as IIngredient, output as IItemStack) {
  FluidToItem.transform(
    output,
    <liquid:water>,
    input,
    false
  );
}

/**
 * Adds a recipe for drying an item.
 * @param {IIngredient} input      The wet item.
 * @param {IItemStack}  output     The dry item.
 * @param {int}         difficulty Difficulty (CommonDatabase.difficultyIndex)
 */
function addDryingRecipe(input as IIngredient, output as IItemStack, difficulty as string) {
  DryingRack.addRecipe(
    input.commandString + "-to-" + output.commandString,
    output,
    input,
    getDryingDifficultyModifier(difficulty)
  );
}

/**
 * Adds a shapeless workench recipe.
 * @param {IIngredient[]} input      The ingredients.
 * @param {IItemStack}    output     The finished product.
 * @param {string}        table      The workbench type.
 * @param {IIngredient}   tool       The required tool. Can be null.
 * @param {string}        difficulty Difficulty (CommonDatabase.difficultyIndex)
 */
function addShapelessWorkbenchRecipe(input as IIngredient[], output as IItemStack, table as string, tool as IIngredient, difficulty as string) {
  var newRecipe = RecipeBuilder.get(table)
    .setShapeless(input);
    if (!isNull(tool)) {
      newRecipe.addTool(
        tool,
        getWorkbenchDifficultyModifier(difficulty)
      );
    }
    newRecipe.addOutput(output)
    .create();
}

/**
 * Adds a shaped workench recipe.
 * @param {IIngredient[]} input      The recipe.
 * @param {IItemStack}    output     The finished product.
 * @param {string}        table      The workbench type.
 * @param {IIngredient}   tool       The required tool. Can be null.
 * @param {string}        difficulty Difficulty (CommonDatabase.difficultyIndex)
 */
function addShapedWorkbenchRecipe(input as IIngredient[][], output as IItemStack, table as string, tool as IIngredient, difficulty as string) {
  var newRecipe = RecipeBuilder.get(table)
    .setShaped(input);
    if (!isNull(tool)) {
      newRecipe.addTool(
        tool,
        getWorkbenchDifficultyModifier(difficulty)
      );
    }
    newRecipe.addOutput(output)
    .create();
}

/**
 * Creates a shaped recipe given a shape and corresponding ingredients.
 * @param  {int[][]}       shape       Shape of the recipe. The ints refer to
 *                                     the index of the ingredient in
 *                                     ingredients.
 * @param  {IIngredient[]} ingredients The list of ingredients.
 * @return {IIngredient[][]}           The shaped recipe.
 */
function createShapedRecipe(shape as int[][], ingredients as IIngredient[]) as IIngredient[][] {
  var retval as IIngredient[][] = [];
  for i, indexRow in shape {
    var retvalRow as IIngredient[] = [];
    for ii, index in indexRow {
      retvalRow += ingredients[index];
    }
    retval += retvalRow;
  }
  return retval;
}

/**
 * Creates a shapeless recipe given a list of ingredients and their quantity.
 * @param  {IIngredient[]} ingredients The list of ingredients.
 * @return {IIngredient[]}             The shapeless recipe.
 */
function createShapelessRecipe(ingredients as int[IIngredient]) as IIngredient[] {
  var retval as IIngredient[] = [];
  for ingredient, i in ingredients {
    for ii in 0 to i {
      retval += ingredient;
    }
  }
  return retval;
}
