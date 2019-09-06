#priority 2
// Holds smithy-specific recipe registers and QoL functions.
import scripts.crafttweaker.CommonUtil;
import scripts.crafttweaker.CommonDatabase;
import scripts.crafttweaker.SmithyDatabase;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

/**
 * Adds a shapeless scribe workbench recipe. Basically the CommonUtil function,
 * but with the table already set to blacksmith.
 * @param {IIngredient[]} input      The ingredients.
 * @param {IItemStack}    output     The finished product.
 * @param {IIngredient}   tool       The required tool. Can be null.
 * @param {string}        difficulty Difficulty (CommonDatabase.difficultyIndex)
 */
function addShapelessRecipe(input as IIngredient[], output as IItemStack, tool as IIngredient, difficulty as string) {
  CommonUtil.addShapelessWorkbenchRecipe(
    input,
    output,
    "blacksmith",
    tool,
    difficulty
  );
}

/**
 * Adds a shaped scribe workbench recipe. Basically the CommonUtil function, but
 * with the table already set to blacksmith.
 * @param {IIngredient[][]} input      The recipe.
 * @param {IItemStack}      output     The finished product.
 * @param {IIngredient}     tool       The required tool. Can be null.
 * @param {string}          difficulty Difficulty (CommonDatabase.difficultyIndex)
 */
function addShapedRecipe(input as IIngredient[][], output as IItemStack, tool as IIngredient, difficulty as string) {
  CommonUtil.addShapedWorkbenchRecipe(
    input,
    output,
    "blacksmith",
    tool,
    difficulty
  );
}

/**
 * Adds a recipe to make metal ingots from the corresponding nuggets.
 * @param {string} metal The name of the metal.
 */
function addIngotRecipe(metal as string) {
  addShapelessRecipe(
    CommonUtil.createShapelessRecipe({
      SmithyDatabase.getMetalNugget(metal): 9
    } as int[IIngredient]),
    SmithyDatabase.getMetalIngot(metal),
    <ore:artisansHammer>,
    "EASY"
  );
}

/**
 * Adds a recipe to make a piece of armor from the slot it goes in and the
 * material it's made of.
 * @param {string} slot     The slot the armor goes in.
 * @param {string} material The material the armor is made of.
 */
function addArmorPieceRecipe(slot as string, type as string) {
  addShapedRecipe(
    CommonUtil.createShapedRecipe(
      SmithyDatabase.getArmorRecipeShape(slot),
      [
        null,
        SmithyDatabase.getMetalIngot(type),
        SmithyDatabase.getArmor("leather", slot)
      ] as IIngredient[]
    ),
    SmithyDatabase.getArmor(type, slot),
    <ore:artisansHammer>,
    "MODERATE"
  );
}
