/****************************************************************************************************************************************
 * SCREEN: Converse
 ****************************************************************************************************************************************/
 
PImage converseScreenBg;
float converseScreenBgOpacity = 0;
float black3Opacity = 0;
float black4Opacity = 0;

Item snapeFront; 
PImage[] snapeFrontImage;
float snapeOpacity = 0;
boolean displaySnapeInfo = false;

PImage[] circleIcon;
int numOfDialogue = 4;
float[] dialogueBoxOpacity;
boolean[] displayDialogueBox;
int boxActive = 0;
float optionXPos = 100;
float optionYPos = sIBCloseButtonYPos;
float optionYSpacing = 50;

void converseScreenSetup() {
  converseScreenBg = loadImage("images/environment/potions-table.png");

  snapeFrontImage = new PImage[2];
  snapeFrontImage[0] = loadImage("images/environment/snape.png");
  snapeFrontImage[1] = loadImage("images/environment/snape-glow.png");
  snapeFront = new Item(snapeFrontImage, width - snapeFrontImage[0].width, 0);
  
  circleIcon = new PImage[2];
  circleIcon[0] = loadImage("images/graphics/circle-icon.png");
  circleIcon[1] = loadImage("images/graphics/circle-icon-hovered.png");

  dialogueBoxOpacity = new float[numOfDialogue];
  displayDialogueBox = new boolean[numOfDialogue];
  for (int i = 0; i < displayDialogueBox.length; i++) {
    displayDialogueBox[i] = false;
    dialogueBoxOpacity[i] = 0;
  }
}

void converseScreen() {
  // Transition: Fade In
  if (black3Opacity < 255) black3Opacity += 10;
  if (black3Opacity >= 200 && black4Opacity < 255) black4Opacity += 5;
  if (black4Opacity >= 200 && converseScreenBgOpacity < 175) converseScreenBgOpacity += 10;
  if (converseScreenBgOpacity >= 150 && snapeOpacity < 255) snapeOpacity += 20;
  if (snapeOpacity >= 255) {
    displayDialogueBox[boxActive] = true;
    if (dialogueBoxOpacity[boxActive] < 255) dialogueBoxOpacity[boxActive] += 20;
  }
  
  // Transition Elements
  imageMode(CORNER); noTint();
  image(homeScreenBg, backgroundXPos, 0);
  rectMode(CORNER); fill(0, black3Opacity);
  rect(0, 0, width, height);
  image(snapeImage[1], backgroundXPos + snapeImageXPos, snapeImageYPos);
  fill(0, black4Opacity);
  rect(0, 0, width, height);

  // Background
  tint(255, converseScreenBgOpacity);
  image(converseScreenBg, 0, 0);

  // Header
  header("CONVERSE WITH PROFESSOR SNAPE");
  
  // Dialogue
  displayDialogue();
  
  // Snape
  imageMode(CORNER); tint(255, snapeOpacity);
  image(snapeFrontImage[0], width - snapeFrontImage[0].width, 0);
  if (snapeFront.hovered(0) && !backButton.hovered()) image(snapeFrontImage[1], width - snapeFrontImage[1].width, 0);
  
  // Info Box
  if (displaySnapeInfo) snapeInfoBox();
  
  // Buttons
  if ((snapeFront.hovered(0) && !backButton.hovered()) || displaySnapeInfo) infoButton[1].display("ABOUT", RIGHT, sIBInfoButtonXPos - textXSpacing, sIBInfoButtonYPos + textYSpacing, snapeOpacity); 
  backButton.display(); 
}

void snapeInfoBox() {
  rectMode(CORNER); fill(0, 225);
  rect(0, 0, width, height);

  // Text
  float leftIndent = 100;
  float topLine = 200;
  
  textAlign(LEFT); textSize(20); fill(255);
  text("PROFESSOR SEVERUS SNAPE", leftIndent, topLine);
  lineDivider(leftIndent, topLine + 30, 750 - leftIndent);
  textSize(15);
  text("A skilled half-blood wizard and your mighty Potions"
    + "\nMaster. He has a varied and impressive collection of"
    + "\ncredentials, including esteemed positions like Head"
    + "\nof Slytherin House, Headmaster of Hogwarts, member"
    + "\nof the Order of the Phoenix, Voldemort's favorite"
    + "\nDeath Eater, slayer of Albus Dumbledore, 5-time"
    + "\nDefence Against the Dark Arts professorship reject,"
    + "\nand topnotch triple agent."
    + "\n\nHe is notoriously strict, cold, and sarcastic, so don't"
    + "\nget on his bad side.", leftIndent, topLine + 75);

  // Snape
  imageMode(CORNER); tint(255, snapeOpacity);
  image(snapeFrontImage[1], width - snapeFrontImage[1].width, 0);
  
  // Button: Close
  closeButton[3].display(); 
}

void displayDialogue() {
  if (displayDialogueBox[0]) {
    boxActive = 0;
    dialogueBox("WHAT DO YOU WANT?", 1, 400, 225, 325);
    dialogueOption("I NEED YOUR HELP.", optionYPos, 1);
    dialogueOption("OH, UM... NOTHING.", optionYPos + optionYSpacing, 2);
  }

  if (displayDialogueBox[1]) {
    boxActive = 1;
    dialogueBox("LOVELY. ANOTHER STUDENT" + "\nINCAPABLE OF BASIC READING" + "\nCOMPREHENSION.", 3, 300, 275, 400);
    dialogueOption("CONTINUE", optionYPos + optionYSpacing, 3);
  }

  if (displayDialogueBox[2]) {
    boxActive = 2;
    dialogueBox("THEN STOP WASTING" + "\nMY TIME. BE GONE.", 2, 350, 300, 300);
  }

  if (displayDialogueBox[3]) {
    boxActive = 3;
    dialogueBox("MY ADVICE?" + "\nREAD THE BOOK AGAIN." + "\nMORE SLOWLY THIS TIME.", 3, 325, 350, 350);
  }
}

void dialogueBox(String dialogue, int lines, float x, float y, float w) {
  rectMode(CENTER); fill(225, dialogueBoxOpacity[boxActive]);
  rect(x, y, w, 100 + (lines - 1) * 25, 20); // speech box
  rectMode(CORNER);
  rect(x + w / 2, y, 750 - (x + w / 2), 1); // line

  textAlign(CENTER); textSize(20); fill(0, dialogueBoxOpacity[boxActive]);
  text(dialogue, x, y + textYSpacing - (lines - 1) * 12);
}

void dialogueOption(String option, float y, int nextBox) {
  imageMode(CENTER); tint(255, dialogueBoxOpacity[boxActive] - 100);
  image(circleIcon[0], optionXPos, y);
  textAlign(LEFT); textSize(20); fill(255, dialogueBoxOpacity[boxActive] - 100);
  text(option, optionXPos + textXSpacing, y + textYSpacing);

  if (hovered(optionXPos, y, 400)) {
    imageMode(CENTER); tint(255, dialogueBoxOpacity[boxActive]);
    image(circleIcon[1], optionXPos, y);
    fill(255, dialogueBoxOpacity[boxActive]);
    text(option, optionXPos + textXSpacing, y + textYSpacing);
    if (mousePressed) {
      soundfx[0].rewind(); soundfx[0].play();
      displayDialogueBox[boxActive] = false;
      displayDialogueBox[nextBox] = true;
    }
  }
}
