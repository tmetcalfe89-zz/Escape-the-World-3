#priority 3
// Holds all smithy-specific data.
import crafttweaker.item.IItemStack;
import scripts.crafttweaker.CommonDatabase;

static metalTypes as string[][] = [
  ["iron"],
  ["gold"]
] as string[][];

function isValidMetalType(metalType as string) as bool {
  for i, metalTypeI in metalTypes {
    if (metalTypeI[0] == metalType) {
      return true;
    }
  }
  return false;
}

function getMetalOre(metalType as string) as IItemStack {
  if (!isValidMetalType(metalType)) {
    print(metalType + " is an invalid metal type.");
    return null;
  }
  return itemUtils.getItem("minecraft:" + metalType + "_ore");
}

function getMetalNugget(metalType as string) as IItemStack {
  if (!isValidMetalType(metalType)) {
    print(metalType + " is an invalid metal type.");
    return null;
  }
  return itemUtils.getItem("minecraft:" + metalType + "_nugget");
}

function getMetalIngot(metalType as string) as IItemStack {
  if (!isValidMetalType(metalType)) {
    print(metalType + " is an invalid metal type.");
    return null;
  }
  return itemUtils.getItem("minecraft:" + metalType + "_ingot");
}

function getArmor(type as string, slot as string) as IItemStack {
  if (!CommonDatabase.isValidArmorType(type)) {
    print(type + " is an invalid armor type.");
    return null;
  }
  if (!CommonDatabase.isValidArmorSlot(slot)) {
    print(slot + " is an invalid armor slot.");
    return null;
  }
  // Special case
  if (type == "leather" && slot == "horse_armor") {
    return <minecraft:saddle>;
  }
  return itemUtils.getItem("minecraft:" + type + "_" + slot);
}

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
  return armorPartRecipeShapes[slot];
}
