#priority 1
// Registers recipes for the smithy class.
import scripts.crafttweaker.CommonDatabase;
import scripts.crafttweaker.CommonUtil;
import scripts.crafttweaker.SmithyUtil;
import scripts.crafttweaker.SmithyDatabase;

// Pyrotech takes care of vanilla nuggets for now.

// Ingot smithing
for i, metalType in SmithyDatabase.metalTypes {
  SmithyUtil.addIngotRecipe(metalType[0]);
}

// Iron armor for now, including horse armor
for i, armorSlot in CommonDatabase.armorSlots {
  SmithyUtil.addArmorRecipe(armorSlot[0], "iron");
}

for i, toolMaterial in SmithyDatabase.toolMaterials {
  for ii, toolType in CommonDatabase.toolTypes {
    SmithyUtil.addToolRecipe(toolMaterial[0], toolType[0]);
  }
}

SmithyUtil.addShapedRecipe(
  CommonUtil.createShapedRecipe(
    [[0,1,1],[0,2,1],[2,0,0]],
    [
      null,
      SmithyDatabase.getMetalNugget("iron"),
      <minecraft:stick>
    ]
  ),
  <artisanworktables:artisans_hammer_iron>,
  null,
  "EASY"
);

SmithyUtil.addShapedRecipe(
  CommonUtil.createShapedRecipe(
    [[0,1,0],[2,1,2],[0,1,0]],
    [
      null,
      SmithyDatabase.getMetalNugget("iron"),
      <minecraft:stick>
    ]
  ),
  <artisanworktables:artisans_sifter_iron>,
  null,
  "EASY"
);

SmithyUtil.addShapedRecipe(
  CommonUtil.createShapedRecipe(
    [[1,2],[1,1]],
    [
      null,
      SmithyDatabase.getMetalNugget("iron"),
      <minecraft:feather>
    ]
  ),
  <artisanworktables:artisans_quill_iron>,
  null,
  "EASY"
);

SmithyUtil.addShapedRecipe(
  CommonUtil.createShapedRecipe(
    [[0,0,1],[0,1,2],[1,0,2]],
    [
      null,
      SmithyDatabase.getMetalNugget("iron"),
      <minecraft:string>
    ]
  ),
  <artisanworktables:artisans_needle_iron>,
  null,
  "EASY"
);

SmithyUtil.addShapedRecipe(
  CommonUtil.createShapedRecipe(
    [[0,0,0]],
    [SmithyDatabase.getMetalIngot("iron")]
  ),
  <pyrotech:anvil_iron_plated>,
  <ore:artisansHammer>,
  "EASY"
);
