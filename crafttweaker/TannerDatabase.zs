#priority 3
import scripts.crafttweaker.CommonDatabase;
import scripts.crafttweaker.SmithyDatabase;

static armorPartRecipeShapes as int[][][string] = {
  "helmet": [[1,2,1],[1,0,1]],
  "chestplate": [[1,0,1],[1,2,1],[1,1,1]],
  "leggings": [[1,2,1],[1,0,1],[1,0,1]],
  "boots": [[0, 1, 0], [1,2,1]],
  "horse_armor": [[1,0,1],[1,2,1],[1,0,1]]
} as int[][][string];

function getArmorRecipeShape(slot as string) as int[][] {
  if (!CommonDatabase.isValidArmorSlot(slot)) {
    print(slot + " is an invalid armor slot.");
    return null;
  }
  if (slot == "boots") {
    return [[1,0,1],[1,0,1]];
  }
  return SmithyDatabase.armorPartRecipeShapes[slot];
}
