/****************************************************************************************************************************************
 * SCREEN: Brew
 ****************************************************************************************************************************************/
 
PImage brewScreenBg;
float brewScreenBgOpacity = 0;
float brewOptionsOpacity = 0;
float black1Opacity = 0;
float black2Opacity = 0;

float counterYPos = bRBCloseButtonYPos + textYSpacing;
boolean addButtonActive = false;
boolean removeButtonActive = false;
int numOfIngredients = 0;

PImage[] checkIcon;
float bMessageYPos = 335;

Item cauldron; 
PImage[] cauldronImage;
float cauldronXPos = width / 2; 
float cauldronYPos = height - 180;
float cauldronTextYPos = 375; 
float cauldronOpacity = 0;
float litCauldronOpacity = 0; 
boolean isEmpty = true; 
boolean displayLitCauldron = false; 
boolean displayResult = false;
float resultBoxOpacity = 0; 
PImage skullImage; 
float skullYStart = 450;
float skullYPos = skullYStart;
float skullYEnd = cauldronTextYPos - textYSpacing;

ArrayList<String> ingredientsAdded = new ArrayList<String>();
String[] submittedFormula; 
String ingredientHolder;

void brewScreenSetup() {
  checkIcon = new PImage[2];
  checkIcon[0] = loadImage("images/graphics/check-icon.png");
  checkIcon[1] = loadImage("images/graphics/check-icon-black.png");

  brewScreenBg = loadImage("images/environment/brew-table-2.png");
  cauldronImage = new PImage[3];
  cauldronImage[0] = loadImage("images/environment/stone-cauldron.png");
  cauldronImage[1] = loadImage("images/environment/stone-cauldron-glow.png");
  cauldronImage[2] = loadImage("images/environment/stone-cauldron-fire.png"); 
  cauldron = new Item(cauldronImage, cauldronXPos, cauldronYPos);
  skullImage = loadImage("images/graphics/skull.png");
}

void brewScreen() {
  // Transition: Fade In
  if (black1Opacity < 255) black1Opacity += 10;
  if (black1Opacity >= 200 && black2Opacity < 255) black2Opacity += 5;
  if (black2Opacity >= 200 && brewScreenBgOpacity < 175) brewScreenBgOpacity += 10;
  if (brewScreenBgOpacity >= 150 && cauldronOpacity < 255) { cauldronOpacity += 20; brewOptionsOpacity += 20; }
  
  // Transition Elements
  imageMode(CORNER); noTint();
  image(homeScreenBg, backgroundXPos, 0);
  rectMode(CORNER); fill(0, black1Opacity);
  rect(0, 0, width, height);
  image(brewImage[1], backgroundXPos, 0);
  fill(0, black2Opacity);
  rect(0, 0, width, height);

  // Background
  tint(255, brewScreenBgOpacity);
  image(brewScreenBg, 0, 0);

  // Cauldron
  imageMode(CENTER); tint(255, cauldronOpacity);
  image(cauldronImage[0], width / 2, cauldronYPos);
  if (cauldron.hoveredCenter() && cauldronOpacity >= 255 && !addButtonActive && !removeButtonActive && !displayResult) {
    image(cauldronImage[1], width / 2, cauldronYPos);
    fill(255); textAlign(CENTER); textSize(20); 
    if (numOfIngredients == 0) isEmpty = true;
    else isEmpty = false; 
    if (isEmpty) text("IT'S EMPTY.", width / 2, cauldronTextYPos);
    else text("INCENDIO!", width / 2, cauldronTextYPos);
  }
  if (displayLitCauldron) {
    tint(255, litCauldronOpacity); 
    if (litCauldronOpacity < 255) litCauldronOpacity += 10; 
    image(cauldronImage[2], width / 2, cauldronYPos);
  }
  
  // Header
  header("BREW A POTION");

  // Counter
  textAlign(CENTER); textSize(20); fill(255, brewOptionsOpacity);
  text(numOfIngredients, width / 2, counterYPos);
  if (hovered(width / 2, counterYPos, menuWidth) && !addButtonActive && !removeButtonActive) {
    textAlign(LEFT);
    text("YOU'VE ADDED ", 305, counterYPos);
    text("INGREDIENT(S).", width / 2 + textXSpacing, counterYPos);
  }

  // Buttons
  addButton.display("ADD INGREDIENT(S)", LEFT, addButtonXPos + textXSpacing, addButtonYPos + textYSpacing, brewOptionsOpacity);
  removeButton.display("REMOVE INGREDIENT(S)", LEFT, removeButtonXPos + textXSpacing, removeButtonYPos + textYSpacing, brewOptionsOpacity);
  
  // Menus
  if (addButtonActive) addMenu.display(addIcon);
  else if (removeButtonActive) removeMenu.displayList();

  // Content 
  if (ingredientActive) {
    fill(255);
    text(INGREDIENTS[indexActive][0] + " ADDED", width / 2 + textXSpacing, bMessageYPos);
    noTint();
    image(checkIcon[0], width / 2, bMessageYPos - 7);
  } else if (ingredientInactive) {
    fill(255);
    text(ingredientHolder + " REMOVED", width / 2 + textXSpacing, bMessageYPos);
    noTint();
    image(checkIcon[0], width / 2, bMessageYPos - 7);
  }
  
  // Results
  if (displayResult) resultBox();
    
  // Button: Back
  backButton.display(); 
}

void resultBox() {
  rectMode(CORNER); fill(0, resultBoxOpacity);
  rect(0, 100, width, 200);
  imageMode(CENTER); noTint();
  
  // Transition: Opacity Fade
  if (resultBoxOpacity < 255) resultBoxOpacity += 10;

  // Button: Close
  closeButton[2].display(); 
  
  // Text
  textAlign(CENTER); textSize(20); fill(255, resultBoxOpacity);
  
  // Result: Success
  if (Arrays.equals(submittedFormula, ANTIDOTE_TO_COMMON_POISONS)) {
    text("CONGRATULATIONS, YOU'VE SUCCESSFULLY BREWED", width / 2, removeButtonYPos + textYSpacing - lineSpacing);  
    text("\"ANTIDOTE TO COMMON POISONS.\"", width / 2, removeButtonYPos + textYSpacing);
    text("A TASK ANY HALF-BRAINED FIRST YEAR CAN DO.", width / 2, removeButtonYPos + textYSpacing + lineSpacing);
  }  
  else if (Arrays.equals(submittedFormula, BEAUTIFICATION_POTION)) {
    text("CONGRATULATIONS, YOU'VE SUCCESSFULLY BREWED", width / 2, removeButtonYPos + textYSpacing - lineSpacing);  
    text("\"BEAUTIFICATION POTION.\"", width / 2, removeButtonYPos + textYSpacing);
    text("", width / 2, removeButtonYPos + textYSpacing);
  } 
  else if (Arrays.equals(submittedFormula, CURE_FOR_BOILS)) {
    text("CONGRATULATIONS, YOU'VE SUCCESSFULLY BREWED", width / 2, removeButtonYPos + textYSpacing - lineSpacing);  
    text("\"CURE FOR BOILS.\"", width / 2, removeButtonYPos + textYSpacing);
    text("A TASK ANY HALF-BRAINED FIRST YEAR CAN DO.", width / 2, removeButtonYPos + textYSpacing + lineSpacing);
  } 
  else if (Arrays.equals(submittedFormula, DOXYCIDE)) {
    text("CONGRATULATIONS, YOU'VE SUCCESSFULLY BREWED", width / 2, removeButtonYPos + textYSpacing - lineSpacing);  
    text("\"DOXYCIDE.\"", width / 2, removeButtonYPos + textYSpacing);
    text("", width / 2, removeButtonYPos + textYSpacing + lineSpacing);
  } 
  else if (Arrays.equals(submittedFormula, DRAGON_DUNG_FERTILIZER)) {
    text("CONGRATULATIONS, YOU'VE SUCCESSFULLY BREWED", width / 2, removeButtonYPos + textYSpacing - lineSpacing);  
    text("\"DRAGON DUNG FERTILIZER.\"", width / 2, removeButtonYPos + textYSpacing);
    text("", width / 2, removeButtonYPos + textYSpacing + lineSpacing);
  } 
  else if (Arrays.equals(submittedFormula, DRAUGHT_OF_LIVING_DEATH)) {
    text("CONGRATULATIONS, YOU'VE SUCCESSFULLY BREWED", width / 2, removeButtonYPos + textYSpacing - lineSpacing);  
    text("\"DRAUGHT OF LIVING DEATH.\"", width / 2, removeButtonYPos + textYSpacing);
    text("", width / 2, removeButtonYPos + textYSpacing + lineSpacing);
  } 
  else if (Arrays.equals(submittedFormula, DRAUGHT_OF_PEACE)) {
    text("CONGRATULATIONS, YOU'VE SUCCESSFULLY BREWED", width / 2, removeButtonYPos + textYSpacing - lineSpacing);  
    text("\"DRAUGHT OF PEACE.\"", width / 2, removeButtonYPos + textYSpacing);
    text("", width / 2, removeButtonYPos + textYSpacing + lineSpacing);
  } 
  else if (Arrays.equals(submittedFormula, ELIXIR_TO_INDUCE_EUPHORIA)) {
    text("CONGRATULATIONS, YOU'VE SUCCESSFULLY BREWED", width / 2, removeButtonYPos + textYSpacing - lineSpacing);  
    text("\"ELIXIR TO INDUCE EUPHORIA.\"", width / 2, removeButtonYPos + textYSpacing);
    text("", width / 2, removeButtonYPos + textYSpacing + lineSpacing);
  } 
  else if (Arrays.equals(submittedFormula, FELIX_FELICIS)) {
    text("CONGRATULATIONS, YOU'VE SUCCESSFULLY BREWED", width / 2, removeButtonYPos + textYSpacing - lineSpacing);  
    text("\"FELIX FELICIS.\"", width / 2, removeButtonYPos + textYSpacing);
    text("", width / 2, removeButtonYPos + textYSpacing + lineSpacing);
  } 
  else if (Arrays.equals(submittedFormula, FIRE_PROTECTION_POTION)) {
    text("CONGRATULATIONS, YOU'VE SUCCESSFULLY BREWED", width / 2, removeButtonYPos + textYSpacing - lineSpacing);  
    text("\"FIRE PROTECTION POTION.\"", width / 2, removeButtonYPos + textYSpacing);
    text("", width / 2, removeButtonYPos + textYSpacing + lineSpacing);
  } 
  else if (Arrays.equals(submittedFormula, FORGETFULNESS_POTION)) {
    text("CONGRATULATIONS, YOU'VE SUCCESSFULLY BREWED", width / 2, removeButtonYPos + textYSpacing - lineSpacing);  
    text("\"FORGETFULNESS POTION.\"", width / 2, removeButtonYPos + textYSpacing);
    text("A TASK ANY HALF-BRAINED FIRST YEAR CAN DO.", width / 2, removeButtonYPos + textYSpacing + lineSpacing);
  } 
  else if (Arrays.equals(submittedFormula, GIRDING_POTION)) {
    text("CONGRATULATIONS, YOU'VE SUCCESSFULLY BREWED", width / 2, removeButtonYPos + textYSpacing - lineSpacing);  
    text("\"GIRDING POTION.\"", width / 2, removeButtonYPos + textYSpacing);
    text("", width / 2, removeButtonYPos + textYSpacing + lineSpacing);
  } 
  else if (Arrays.equals(submittedFormula, HERBICIDE_POTION)) {
    text("CONGRATULATIONS, YOU'VE SUCCESSFULLY BREWED", width / 2, removeButtonYPos + textYSpacing - lineSpacing);  
    text("\"HERBICIDE POTION.\"", width / 2, removeButtonYPos + textYSpacing);
    text("A TASK ANY HALF-BRAINED FIRST YEAR CAN DO.", width / 2, removeButtonYPos + textYSpacing + lineSpacing);
  } 
  else if (Arrays.equals(submittedFormula, LOVE_POTION)) {
    text("CONGRATULATIONS, YOU'VE SUCCESSFULLY BREWED", width / 2, removeButtonYPos + textYSpacing - lineSpacing);  
    text("\"LOVE POTION.\"", width / 2, removeButtonYPos + textYSpacing);
    text("", width / 2, removeButtonYPos + textYSpacing + lineSpacing);
  } 
  else if (Arrays.equals(submittedFormula, OCULUS_POTION)) {
    text("CONGRATULATIONS, YOU'VE SUCCESSFULLY BREWED", width / 2, removeButtonYPos + textYSpacing - lineSpacing);  
    text("\"OCULUS POTION.\"", width / 2, removeButtonYPos + textYSpacing);
    text("", width / 2, removeButtonYPos + textYSpacing + lineSpacing);
  } 
  else if (Arrays.equals(submittedFormula, POLYJUICE_POTION)) {
    text("CONGRATULATIONS, YOU'VE SUCCESSFULLY BREWED", width / 2, removeButtonYPos + textYSpacing - lineSpacing);  
    text("\"POLYJUICE POTION.\"", width / 2, removeButtonYPos + textYSpacing);
    text("", width / 2, removeButtonYPos + textYSpacing + lineSpacing);
  }
  else if (Arrays.equals(submittedFormula, SHRINKING_SOLUTION)) {
    text("CONGRATULATIONS, YOU'VE SUCCESSFULLY BREWED", width / 2, removeButtonYPos + textYSpacing - lineSpacing);  
    text("\"SHRINKING SOLUTION.\"", width / 2, removeButtonYPos + textYSpacing);
    text("", width / 2, removeButtonYPos + textYSpacing + lineSpacing);
  }
  else if (Arrays.equals(submittedFormula, SKELE_GRO)) {
    text("CONGRATULATIONS, YOU'VE SUCCESSFULLY BREWED", width / 2, removeButtonYPos + textYSpacing - lineSpacing);  
    text("\"SKELE-GRO.\"", width / 2, removeButtonYPos + textYSpacing);
    text("", width / 2, removeButtonYPos + textYSpacing + lineSpacing);
  }
  else if (Arrays.equals(submittedFormula, SLEEPING_DRAUGHT)) {
    text("CONGRATULATIONS, YOU'VE SUCCESSFULLY BREWED", width / 2, removeButtonYPos + textYSpacing - lineSpacing);  
    text("\"SLEEPING DRAUGHT.\"", width / 2, removeButtonYPos + textYSpacing);
    text("", width / 2, removeButtonYPos + textYSpacing + lineSpacing);
  }
  else if (Arrays.equals(submittedFormula, SWELLING_SOLUTION)) {
    text("CONGRATULATIONS, YOU'VE SUCCESSFULLY BREWED", width / 2, removeButtonYPos + textYSpacing - lineSpacing);  
    text("\"SWELLING SOLUTION.\"", width / 2, removeButtonYPos + textYSpacing);
    text("", width / 2, removeButtonYPos + textYSpacing + lineSpacing);
  }
  else if (Arrays.equals(submittedFormula, VOLUBILIS_POTION)) {
    text("CONGRATULATIONS, YOU'VE SUCCESSFULLY BREWED", width / 2, removeButtonYPos + textYSpacing - lineSpacing);  
    text("\"VOLUBILIS POTION.\"", width / 2, removeButtonYPos + textYSpacing);
    text("", width / 2, removeButtonYPos + textYSpacing + lineSpacing);
  }
  else if (Arrays.equals(submittedFormula, WIDEYE_POTION)) {
    text("CONGRATULATIONS, YOU'VE SUCCESSFULLY BREWED", width / 2, removeButtonYPos + textYSpacing - lineSpacing);  
    text("\"WIDEYE POTION.\"", width / 2, removeButtonYPos + textYSpacing);
    text("A TASK ANY HALF-BRAINED FIRST YEAR CAN DO.", width / 2, removeButtonYPos + textYSpacing + lineSpacing);
  }
  else if (Arrays.equals(submittedFormula, WIGGENWELD_POTION)) {
    text("CONGRATULATIONS, YOU'VE SUCCESSFULLY BREWED", width / 2, removeButtonYPos + textYSpacing - lineSpacing);  
    text("\"WIGGENWELD POTION.\"", width / 2, removeButtonYPos + textYSpacing);
    text("", width / 2, removeButtonYPos + textYSpacing + lineSpacing);
  }
  else if (Arrays.equals(submittedFormula, WIT_SHARPENING_POTION)) {
    text("CONGRATULATIONS, YOU'VE SUCCESSFULLY BREWED", width / 2, removeButtonYPos + textYSpacing - lineSpacing);  
    text("\"WIT-SHARPENING POTION.\"", width / 2, removeButtonYPos + textYSpacing);
    text("", width / 2, removeButtonYPos + textYSpacing + lineSpacing);
  }
  
  // Result: Failure
  else {
    text("WHAT A LOVELY POT OF MOLTEN RUBBISH.", width / 2, removeButtonYPos + textYSpacing - lineSpacing);  
    text("YOUR INCOMPETENCE IS TRULY ASTOUNDING.", width / 2, removeButtonYPos + textYSpacing);
    tint(255, resultBoxOpacity); 
    image(skullImage, width/2, skullYPos); 
    if (skullYPos > skullYEnd) skullYPos -= 3; // Animation: Float Up
  }
}
