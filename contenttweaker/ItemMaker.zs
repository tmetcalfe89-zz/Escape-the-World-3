#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;

function make (name as string, maxstack as int) as Item {
  var newItem = VanillaFactory.createItem(name);
  newItem.maxStackSize = maxstack;
  return newItem;
}

function register (item as Item) {
  item.register();
}

function makeAndRegister (name as string, maxstack as int) {
  register(make(name, maxstack));
}
