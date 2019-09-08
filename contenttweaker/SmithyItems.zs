#loader contenttweaker
import scripts.contenttweaker.SmithyDatabase;
import scripts.contenttweaker.ItemMaker.makeAndRegister;

for i, toolType in SmithyDatabase.toolTypes {
  for ii, toolMaterial in SmithyDatabase.toolMaterials {
    makeAndRegister(toolMaterial[0] + "_" + toolType[0] + "_head", 1);
  }
}
