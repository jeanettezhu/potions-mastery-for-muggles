/****************************************************************************************************************************************
 * SCREEN: Home
 ****************************************************************************************************************************************/
 
PImage homeScreenBg;
float homeScreenOpacity = 0;
boolean displayHomeScreen = false; 
boolean displayProgramInfo = false;
float navButtonOpacity = 0; 

Item iCabinet, rBook, snape, brewer, holder; 
PImage[] snapeImage, recipeBookImage, iCabinetImage, holderImage;
float iCabinetImageXPos = 756;
float iCabinetImageYPos = 166;
float recipeBookImageXPos = 1198;
float recipeBookImageYPos = 385;
float snapeImageXPos = 887;
float snapeImageYPos = 241;

void homeScreenSetup() {
  homeScreenBg = loadImage("images/environment/potions-classroom.png");
  
  snapeImage = new PImage[2];
  snapeImage[0] = loadImage("images/environment/potions-classroom-snape.png");
  snapeImage[1] = loadImage("images/environment/potions-classroom-snape-glow.png");
  recipeBookImage = new PImage[2];
  recipeBookImage[0] = loadImage("images/environment/potions-classroom-book.png");
  recipeBookImage[1] = loadImage("images/environment/potions-classroom-book-glow.png");
  iCabinetImage = new PImage[2];
  iCabinetImage[0] = loadImage("images/environment/potions-classroom-icabinet.png");
  iCabinetImage[1] = loadImage("images/environment/potions-classroom-icabinet-glow-2.png");
  holderImage = new PImage[1];
  holderImage[0] = loadImage("images/environment/potions-classroom-brew-holder.png");
  
  iCabinet = new Item(iCabinetImage, iCabinetImageXPos, iCabinetImageYPos, "BROWSE THE INGREDIENTS CABINET"); 
  rBook = new Item(recipeBookImage, recipeBookImageXPos, recipeBookImageYPos, "READ THE RECIPE BOOK"); 
  snape = new Item(snapeImage, snapeImageXPos, snapeImageYPos, "CONVERSE WITH PROFESSOR SNAPE"); 
  brewer = new Item(brewImage, 0, 0, "BREW A POTION"); 
  holder = new Item(holderImage, 0, 0); 
}

void homeScreen() {
  // Transition: Fade In
  if (homeScreenOpacity < 255) homeScreenOpacity += 10;
  else if (homeScreenOpacity >= 255) displayHomeScreen = true; 
  
  imageMode(CORNER); tint(255, homeScreenOpacity);
  image(homeScreenBg, backgroundXPos, 0); // using backgroundXPos carries over the x position
  
  if (displayHomeScreen) {
    // Items
    if (!displayProgramInfo && !navButton.hovered() && !navLeftArrow.hovered() && !navRightArrow.hovered()) {
      if (!rBook.hovered() && !snape.hovered() && !brewer.hovered()) iCabinet.display(); 
      rBook.display(); 
      snape.display(); 
      if (!holder.hovered()) brewer.display(); 
    }

    // Button: Navigate
    navButton.display(); 
    navLeftArrow.display(); 
    navRightArrow.display(); 
    if (navLeftArrow.hovered() && mousePressed && backgroundXPos <= 0 - 5) backgroundXPos += 5;
    if (keyCode == LEFT && keyPressed && backgroundXPos <= 0 - 5) backgroundXPos += 5;
    if (navRightArrow.hovered() && mousePressed && backgroundXPos >= width - homeScreenBg.width + 5) backgroundXPos -= 5;
    if (keyCode == RIGHT && keyPressed && backgroundXPos >= width - homeScreenBg.width + 5) backgroundXPos -= 5;
  }
  
  // Button: Potions Collection
  pCollectionButton.display("YOUR POTION COLLECTION", LEFT, pCollectionButtonXPos + textXSpacing, pCollectionButtonYPos + textYSpacing, homeScreenOpacity);
  
  // Program Info Box
  if (displayProgramInfo) programInfoBox();
  
  // Button: Program Info
  infoButton[0].display("ABOUT THE GAME", LEFT, pIBInfoButtonXPos + textXSpacing, pIBInfoButtonYPos + textYSpacing, homeScreenOpacity); 
  
  // Reset for fade in transitions
  reset();
}

void programInfoBox() {
  rectMode(CORNER); fill(0, 225);
  rect(0, 0, width, height);

  // Text
  float topLine = 225;
  float topLineCredits = topLine + 300; 
  float leftIndent = 300;
  
  textAlign(CENTER); textSize(20); fill(255);
  text("POTIONS MASTERY FOR MUGGLES", width / 2, topLine);
  lineDivider(width / 2, topLine + 30);
  textAlign(LEFT); textSize(15);
  text("Never received that coveted invitation letter to Hogwarts?"
    + "\n" + "Don't worry, muggle! The acclaimed Professor Severus"
    + "\n" + "Snape has generously brought his potions class to the"
    + "\n" + "digital world. POTIONS MASTERY FOR MUGGLES is an"
    + "\n" + "educational video game where muggles can learn about"
    + "\n" + "and create common magical potions, featuring actual items,"
    + "\n" + "potions, and recipes from the Harry Potter universe."
    + "\n" 
    + "\n"
    + "\n" + "POTIONS MASTERY FOR MUGGLES \u00a9 Jeanette Zhu, 2015."
    + "\n" + "For more information, visit jeanettezhu.com.", leftIndent, topLine + 75);
  fill(100); 
  text("CREDITS"
    + "\n" + "ART:  Andy Butnariu, Atomhawk Design, Bonnie Horton,"
    + "\n" + "Elizabethowl, Fang Wang Lin, Isabella Bran, Jane Mere,"
    + "\n" + "Jeanette Matthews, Joel Hustak, Kseniya, Mark Tarrisse,"
    + "\n" + "Mary E. Eaton, Nicolsche & Felidae, Quentin Soubrouillard"
    + "\n" + "& Pottermore"
    + "\n" + "AUDIO:  John Williams, Katsumi, SoundBible, Sound Jay"
    + "\n" + "WRITING:  Harry Potter Wiki, Jeanette Zhu, J.K. Rowling", leftIndent, topLineCredits);
    
  // Button: Close
  closeButton[0].display(); 
}

void reset() {
  // Brew Screen
  black1Opacity = 0;
  black2Opacity = 0;
  brewScreenBgOpacity = 0;
  brewOptionsOpacity = 0;
  cauldronOpacity = 0;
  litCauldronOpacity = 0;
  resultBoxOpacity = 0; 
  skullYPos = skullYStart; 
  addButtonActive = false;
  addButton.active = false; 
  removeButtonActive = false;
  removeButton.active = false; 
  ingredientActive = false;
  ingredientAdded = false;
  displayResult = false;
  displayLitCauldron = false; 
  resultBoxOpacity = 0;
  skullYPos = skullYStart; 

  // Converse Screen
  black3Opacity = 0;
  black4Opacity = 0;
  converseScreenBgOpacity = 0;
  snapeOpacity = 0;
  boxActive = 0;
  displaySnapeInfo = false;
  infoButton[1].active = false; 
  for (int i = 0; i < displayDialogueBox.length; i++) {
    displayDialogueBox[i] = false;
    dialogueBoxOpacity[i] = 0;
  }

  // Recipe Book Screen
  black5Opacity = 0;
  black6Opacity = 0;
  rBookBgOpacity = 0;
  rMessageOpacity = 0;
  displayRMenu = false;
  displayRMessage = false;
  potionActive = false;
  displayRecipe = false;
  recipeButton.active = false; 

  // iCabinet Screen
  black7Opacity = 0;
  black8Opacity = 0;
  iCabinetBgOpacity = 0;
  iMessageOpacity = 0;
  displayIMenu = false; 
  displayIMessage = false;
  displayStats = false;

  // pCollection Screen
  black9Opacity = 0;
  pCollectionBgOpacity = 0;
  pMessageOpacity = 0;
  displayPMessage = false;
}

