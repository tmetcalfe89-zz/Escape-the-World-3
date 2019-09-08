#loader contenttweaker
import scripts.contenttweaker.ItemMaker.makeAndRegister;
import scripts.contenttweaker.TannerDatabase;

// Load misc
for i, misc in TannerDatabase.miscItems {
  makeAndRegister(misc[0], misc[1]);
}
