/****************************************************************************************************************************************
 * SCREEN: Ingredients Cabinet
 ****************************************************************************************************************************************/

PImage iCabinetBg;
float iCabinetBgOpacity = 0;
float black7Opacity = 0;
float black8Opacity = 0;
float iMessageOpacity = 0;
boolean displayIMessage = false;
boolean displayIMenu = false; 
boolean displayStats = false;

int numOfAnimalProducts = 0;
int numOfFungusProducts = 0; 
int numOfInsectProducts = 0;
int numOfOtherProducts = 0; 
int numOfPlantProducts = 0; 

void iCabinetScreenSetup() {
  iCabinetBg = loadImage("images/environment/smoke-background.png");
  for (int i = 0; i < INGREDIENTS.length; i++) {
    if (INGREDIENTS[i][3].equals("animal")) numOfAnimalProducts++; 
    else if (INGREDIENTS[i][3].equals("fungus")) numOfFungusProducts++; 
    else if (INGREDIENTS[i][3].equals("insect")) numOfInsectProducts++; 
    else if (INGREDIENTS[i][3].equals("other")) numOfOtherProducts++; 
    else if (INGREDIENTS[i][3].equals("plant")) numOfPlantProducts++;
  }
}

void iCabinetScreen() {
  // Transition: Fade In
  if (black7Opacity < 255) black7Opacity += 10;
  if (black7Opacity >= 200 && black8Opacity < 255) black8Opacity += 5;
  if (black8Opacity >= 200 && iCabinetBgOpacity < 255) { displayIMessage = true; iCabinetBgOpacity += 10; }
  if (iCabinetBgOpacity >= 200) displayIMenu = true;
  
  // Transition Elements
  imageMode(CORNER); noTint();
  image(homeScreenBg, backgroundXPos, 0);
  rectMode(CORNER); fill(0, black7Opacity);
  rect(0, 0, width, height);
  image(iCabinetImage[1], backgroundXPos + iCabinetImageXPos, iCabinetImageYPos);
  fill(0, black8Opacity);
  rect(0, 0, width, height);

  // Header
  header("BROWSE THE INGREDIENTS CABINET");

  // Background
  tint(255, iCabinetBgOpacity);
  image(iCabinetBg, 0, 0);

  // IMessage
  textAlign(CENTER); textSize(20); fill(255, iMessageOpacity);
  text("SELECT AN INGREDIENT", rightMidXPos, 275);
  lineDivider(rightMidXPos, lineDividerYPos);
  textSize(15);
  text("Learn more about the stuff that goes in your potions.", rightMidXPos, lineDividerYPos + captionYSpacing);
  
  if (displayIMessage && !displayStats && !ingredientActive) iMessageOpacity += 10;
  else iMessageOpacity = 0; 

  // Content
  if (ingredientActive) {
    imageMode(CENTER); noTint();
    image(loadImage(INGREDIENTS[indexActive][1]), rightMidXPos, 275);

    textAlign(CENTER); textSize(20); fill(255);
    text(INGREDIENTS[indexActive][0], rightMidXPos, 425);
    lineDivider(rightMidXPos, lineDividerYPos);
    textSize(15);
    text(INGREDIENTS[indexActive][2], rightMidXPos, lineDividerYPos + captionYSpacing);    
  }
  
  if (displayStats && !ingredientActive) statsBox();
  else statsButton.active = false; 
  
  // Menu
  if (displayIMenu) {
    ingredientsMenu.display();
    statsButton.display("STATISTICS", RIGHT, statsButtonXPos - textXSpacing, statsButtonYPos + textYSpacing, 255);
  }
  
  // Button: Back
  backButton.display(); 
}

void statsBox() {
  float topLine = 257;
  float lineSpacing = 35;

  textAlign(CENTER); textSize(20); fill(255);
  text(INGREDIENTS.length, width / 2, 207);
  text(numOfAnimalProducts, width / 2, topLine + 0 * lineSpacing); // animal
  text(numOfPlantProducts, width / 2, topLine + 1 * lineSpacing); // plant
  text(numOfInsectProducts, width / 2, topLine + 2 * lineSpacing); // insect
  text(numOfFungusProducts, width / 2, topLine + 3 * lineSpacing); // fungus
  text(numOfOtherProducts, width / 2, topLine + 4 * lineSpacing); // other

  textAlign(LEFT);
  text("INGREDIENTS AVAILABLE", width / 2 + textXSpacing, 207);
  text("ANIMAL PRODUCTS", width / 2 + textXSpacing, topLine + 0 * lineSpacing);
  text("PLANT PRODUCTS", width / 2 + textXSpacing, topLine + 1 * lineSpacing);
  text("INSECT PRODUCTS", width / 2 + textXSpacing, topLine + 2 * lineSpacing);
  text("FUNGUS PRODUCTS", width / 2 + textXSpacing, topLine + 3 * lineSpacing);
  text("OTHER", width / 2 + textXSpacing, topLine + 4 * lineSpacing);
  lineDivider(rightMidXPos, lineDividerYPos);

  textAlign(CENTER); textSize(15);
  text("Just a couple of numbers.", rightMidXPos, 500);
}

