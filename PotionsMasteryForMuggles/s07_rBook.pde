/****************************************************************************************************************************************
 * SCREEN: Recipe Book
 ****************************************************************************************************************************************/
 
PImage rBookBg;
float rBookBgOpacity = 0;
float black5Opacity = 0;
float black6Opacity = 0;
float rMessageOpacity = 0;
boolean displayRMessage = false;
boolean displayRMenu = false; 
boolean displayRecipe = false;

void rBookScreenSetup() { 
  rBookBg = loadImage("images/environment/smoke-background.png"); 
}

void rBookScreen() {
  // Transition: Fade In
  if (black5Opacity < 255) black5Opacity += 10;
  if (black5Opacity >= 200 && black6Opacity < 255) black6Opacity += 5;
  if (black6Opacity >= 200 && rBookBgOpacity < 255) { displayRMessage = true; rBookBgOpacity += 10; }
  if (rBookBgOpacity >= 200) displayRMenu = true;
  
  // Transition Elements
  imageMode(CORNER); noTint();
  image(homeScreenBg, backgroundXPos, 0);
  rectMode(CORNER); fill(0, black5Opacity);
  rect(0, 0, width, height);
  image(recipeBookImage[1], backgroundXPos + recipeBookImageXPos, recipeBookImageYPos);
  fill(0, black6Opacity);
  rect(0, 0, width, height);

  // Header
  header("READ THE RECIPE BOOK");

  // Background
  tint(255, rBookBgOpacity);
  image(rBookBg, 0, 0);

  // RMessage
  textAlign(CENTER); textSize(20); fill(255, rMessageOpacity);
  text("SELECT A POTION", rightMidXPos, 275);
  lineDivider(rightMidXPos, lineDividerYPos);
  textSize(15);
  text("Learn how to create different types of potions.", rightMidXPos, lineDividerYPos + captionYSpacing);
  
  if (displayRMessage && !potionActive) rMessageOpacity += 10;
  else rMessageOpacity = 0; 
  
  // Content
  if (potionActive) {
    imageMode(CENTER); noTint();
    image(loadImage(POTIONS[indexActive][1]), rightMidXPos, 275);

    textAlign(CENTER); textSize(20); fill(255);
    text(POTIONS[indexActive][0], rightMidXPos, 425);
    lineDivider(rightMidXPos, lineDividerYPos);
    textSize(15);
    text(POTIONS[indexActive][2], rightMidXPos, lineDividerYPos + captionYSpacing);
    
    if (displayRecipe) recipeBox();
    
    // Button: Recipe
    recipeButton.display("RECIPE", RIGHT, recipeButtonXPos - textXSpacing, recipeButtonYPos + textYSpacing, 255);    
  }
  
  // Menu
  if (displayRMenu) potionsMenu.display();
  
  // Button: Back
  backButton.display(); 
}

void recipeBox() {
  rectMode(CORNER); fill(0, 225);
  rect(menuWidth, 0, width - menuWidth, height);

  // Text
  textAlign(LEFT); textSize(20); fill(255);
  text(POTIONS[indexActive][3], 590, 200);

  // Button: Close
  closeButton[4].display(); 
}

