/****************************************************************************************************************************************
 * COMPONENT: Menus
 ****************************************************************************************************************************************/

Menu ingredientsMenu, potionsMenu, addMenu, removeMenu; 
PImage menuShading, menuShadingWhite; 
PImage addIcon, removeIcon;
float menuWidth = 400;
float menuIconXPos = 30;
float scrollSpeed = 10;
// float iScrollLength = INGREDIENTS.length * lineSpacing + topLineHolder - height; 
// float pScrollLength = POTIONS.length * lineSpacing + topLineHolder - height; 
float[] topLine; 

boolean ingredientAdded = false;
boolean ingredientActive = false;
boolean ingredientInactive = false;
int indexActive, indexRemoved;
boolean potionActive = false;

void menusSetup() {
  menuShading = loadImage("images/graphics/menu-shading.png"); 
  menuShadingWhite = loadImage("images/graphics/menu-shading-white.png");
  addIcon = loadImage("images/graphics/add-icon.png");
  removeIcon = loadImage("images/graphics/remove-icon.png");
  
  topLine = new float[4]; 
  topLine[0] = topLineHolder; // addMenu
  topLine[1] = topLineHolder; // removeMenu
  topLine[2] = topLineHolder; // ingredientsMenu
  topLine[3] = topLineHolder; // potionsMenu
  
  addMenu = new Menu(INGREDIENTS, 0); 
  removeMenu = new Menu(ingredientsAdded, 1); 
  ingredientsMenu = new Menu(INGREDIENTS, 2);  
  potionsMenu = new Menu(POTIONS, 3);
}
