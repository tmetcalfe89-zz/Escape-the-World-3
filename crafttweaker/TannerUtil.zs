#priority 2
import scripts.crafttweaker.CommonUtil;
import scripts.crafttweaker.SmithyDatabase;
import scripts.crafttweaker.TannerDatabase;
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
    "tanner",
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
    "tanner",
    tool,
    difficulty
  );
}

function addArmorRecipe(slot as string) {
  addShapedRecipe(
    CommonUtil.createShapedRecipe(
      TannerDatabase.getArmorRecipeShape(slot),
      [
        null,
        <contenttweaker:tannedleather>,
        <contenttweaker:tannedleather>
      ]
    ),
    SmithyDatabase.getArmor("leather", slot),
    <ore:artisansNeedle>,
    "MODERATE"
  );
}
