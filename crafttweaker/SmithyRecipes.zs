#priority 1
// Registers recipes for the smithy class.
import scripts.crafttweaker.CommonDatabase;
import scripts.crafttweaker.SmithyUtil;
import scripts.crafttweaker.SmithyDatabase;

// Pyrotech takes care of vanilla nuggets for now.

// Ingot smithing
for i, metalType in SmithyDatabase.metalTypes {
  SmithyUtil.addIngotRecipe(metalType[0]);
}

// Iron armor for now, including horse armor
for i, armorSlot in CommonDatabase.armorSlots {
  SmithyUtil.addArmorPieceRecipe(armorSlot[0], "iron");
}
