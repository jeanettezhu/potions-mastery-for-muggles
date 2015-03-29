/****************************************************************************************************************************************
 * SCREEN: Instructions
 ****************************************************************************************************************************************/
 
PImage instructScreenBg;
float instructScreenBgOpacity = 0;
float panSpeed = 1;
String panDir = "left";
boolean displayInstructScreen = false; 
boolean displayNextButton = false; 

float text1Opacity = 0;
float text2Opacity = 0;
float text3Opacity = 0;

void instructScreenSetup() {
  instructScreenBg = loadImage("images/environment/potions-classroom-dim.png"); 
}

void instructScreen() {
  // Transition: Fade In
  if (instructScreenBgOpacity < 255) instructScreenBgOpacity += 10;
  if (instructScreenBgOpacity >= 255) displayInstructScreen = true;
    
  // Transition Elements  
  imageMode(CORNER); noTint();
  image(startScreenBg, 0, 0);
  tint(255, instructScreenBgOpacity);
  image(instructScreenBg, backgroundXPos, 0);
  noTint();
  image(brewImage[0], 0, 0);

  if (displayInstructScreen) {
    image(instructScreenBg, backgroundXPos, 0); // redraw the image as one unit

    // Animation: instructScreenBg pans left and right
    if (backgroundXPos > 0) panDir = "left";
    else if (backgroundXPos < width - instructScreenBg.width) panDir = "right";
    if (panDir == "left") backgroundXPos -= panSpeed; // pan left
    else if (panDir == "right") backgroundXPos += panSpeed; // pan right

    // Text
    float leftIndent = 300;
    float topLine = 250;

    textAlign(LEFT); textSize(20); fill(255, text1Opacity);
    text("YOU'VE ENTERED THE CLASSROOM OF", leftIndent, topLine);
    text("PROFESSOR SEVERUS SNAPE FOR AN-", leftIndent, topLine + lineSpacing);
    text("OTHER THRILLING POTIONS LESSON.", leftIndent, topLine + 2 * lineSpacing);
    fill(255, text2Opacity);
    text("YOU CAN CREATE, STORE, AND DESTROY", leftIndent, topLine + 4 * lineSpacing);
    text("YOUR OWN ARSENAL OF POTIONS.", leftIndent, topLine + 5 * lineSpacing);
    fill(255, text3Opacity);
    text("USE YOUR MOUSE AND THE ARROW", leftIndent, topLine + 7 * lineSpacing);
    text("KEYS TO EXPLORE THE CLASSROOM.", leftIndent, topLine + 8 * lineSpacing);

    // Animation: Text Fade In
    if (text1Opacity < 255) text1Opacity += 3;
    if (text1Opacity >= 150 && text2Opacity < 255) text2Opacity += 3;
    if (text2Opacity >= 150 && text3Opacity < 255) { text3Opacity += 3; displayNextButton = true; }
  }

  // Button: Next
  if (displayNextButton) nextButton.display(); 
}

