/****************************************************************************************************************************************
 * SCREEN: Potions Collection
 ****************************************************************************************************************************************/
 
PImage pCollectionBg;
float pCollectionBgOpacity = 0;
float black9Opacity = 0;
float pMessageOpacity = 0;
boolean displayPMessage = false;
float potionSpacing = 200; 
float potionXPos = 200;
float potionYPos = 400; 
int numOfPotions = 0;
int month, day, year, hour, minute; 
String minuteF; 

ArrayList<String> potionsAdded = new ArrayList<String>();
ArrayList<String> potionsAddedNames = new ArrayList<String>(); 
ArrayList<int[]> datesAdded = new ArrayList<int[]>(); 

void pCollectionScreenSetup() {
  pCollectionBg = loadImage("images/environment/smoke-background.png");
}

void pCollectionScreen() {
  // Transition: Fade In
  if (black9Opacity < 255) black9Opacity += 10;
  if (black9Opacity >= 200 && pCollectionBgOpacity < 255) pCollectionBgOpacity += 10;
  if (pCollectionBgOpacity >= 200) displayPMessage = true;
  
  // Transition Elements
  imageMode(CORNER); noTint();
  image(homeScreenBg, backgroundXPos, 0);
  rectMode(CORNER); fill(0, black9Opacity);
  rect(0, 0, width, height);

  // Background
  tint(255, pCollectionBgOpacity);
  image(pCollectionBg, 0, 0);

  // Message
  if (displayPMessage) pMessageOpacity = 255;
  else pMessageOpacity = 0;
  
  if (potionsAdded.size() == 0) {
    textAlign(CENTER); textSize(20); fill(255, pMessageOpacity);
    text("YOUR COLLECTION IS EMPTY.", width / 2, height / 2 + 30);
  } else {
    textAlign(CENTER); textSize(20); fill(255, pMessageOpacity);
    text("YOU HAVE " + numOfPotions + " POTION(S).", width / 2, 275); 
    // Potions
    if (pMessageOpacity >= 255) {
      imageMode(CENTER); 
      for (int i = 0; i < potionsAdded.size(); i++) {
        if (hovered(loadImage(potionsAdded.get(i)), potionXPos + i * potionSpacing, potionYPos) && !leftArrow.hovered() && !rightArrow.hovered()) {
          noTint(); // potion image has full opacity when not hovered
          // Caption
          lineDivider(potionXPos + i * potionSpacing - 50, 525, 100);
          textAlign(LEFT); textSize(15); 
          text("NAME:  " + potionsAddedNames.get(i), potionXPos + i * potionSpacing - 50, 525 + captionYSpacing);
          int[] date = datesAdded.get(i); // get relevant date and convert to array
          minuteF = nf(date[4], 2); // format minutes so there are always 2 digits
          text("BREWED:  " + date[0] + "/" + date[1] + "/" + date[2] + "  " + date[3] + ":" + minuteF, potionXPos + i * potionSpacing - 50, 525 + captionYSpacing + lineSpacing);
        }
        else tint(255, 100); // potion image has low opacity when not hovered
        image(loadImage(potionsAdded.get(i)), potionXPos + i * potionSpacing, potionYPos);
      }
    }
    // Buttons
    if (potionsAdded.size() > 3) { // 3+ potions exceeds screen width
      leftArrow.display(); 
      rightArrow.display(); 
      float addSpeed = 7; 
      if (leftArrow.hovered() && mousePressed && potionXPos <= 200) potionXPos += scrollSpeed + addSpeed;
      if (keyCode == LEFT && keyPressed && potionXPos <= 200) potionXPos += scrollSpeed + addSpeed;
      if (rightArrow.hovered() && mousePressed && potionXPos >= -(potionsAdded.size() * 200 + 150 - width)) potionXPos -= scrollSpeed + addSpeed;
      if (keyCode == RIGHT && keyPressed && potionXPos >= -(potionsAdded.size() * 200 + 150 - width)) potionXPos -= scrollSpeed + addSpeed;
    }
  }
  
  // Header (Button: Potions Collection)
  imageMode(CENTER); noTint();
  image(pCollectionButtonImage[1], pCollectionButtonXPos, pCollectionButtonYPos);
  textAlign(LEFT); textSize(20); fill(255);
  text("YOUR POTION COLLECTION", pCollectionButtonXPos + textXSpacing, pCollectionButtonYPos + textYSpacing);
  
  // Button: Back
  backButton.display(); 
  
  // Program Info Box
  if (displayProgramInfo) programInfoBox();
  
  // Button: Program Info
  infoButton[0].display("ABOUT THE GAME", LEFT, pIBInfoButtonXPos + textXSpacing, pIBInfoButtonYPos + textYSpacing, homeScreenOpacity);
}
