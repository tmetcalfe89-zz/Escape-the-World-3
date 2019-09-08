#priority 1
import scripts.crafttweaker.CommonDatabase;
import scripts.crafttweaker.CommonUtil;
import scripts.crafttweaker.TannerUtil;

for i, armorSlot in CommonDatabase.armorSlots {
  TannerUtil.addArmorRecipe(armorSlot[0]);
}

CommonUtil.addDryingRecipe(
  <minecraft:leather>,
  <contenttweaker:tannedleather>,
  "EASY"
);

TannerUtil.addShapelessRecipe(
  [
    <contenttweaker:tannedleather>
  ],
  <contenttweaker:leatherstrip> * 3,
  <ore:artisansRazor>,
  "EASY"
);

TannerUtil.addShapedRecipe(
  CommonUtil.createShapedRecipe(
    [[0,1,2],[2,1,0]],
    [
      null,
      <minecraft:stick>,
      <contenttweaker:leatherstrip>
    ]
  ),
  <contenttweaker:handle>,
  null,
  "EASY"
);

TannerUtil.addShapedRecipe(
  [
    [
      <contenttweaker:leatherstrip>,
      <contenttweaker:tannedleather>
    ]
  ],
  <contenttweaker:bookcover>,
  <ore:artisansRazor>,
  "EASY"
);
