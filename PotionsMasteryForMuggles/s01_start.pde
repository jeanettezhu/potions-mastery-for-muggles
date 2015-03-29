/****************************************************************************************************************************************
 * SCREEN: Start
 ****************************************************************************************************************************************/

PImage[] brewImage;
float brewImageOpacity = 0;

PImage startScreenBg, title;
float startScreenBgOpacity = 0;
float titleOpacity = 0;
float titleYPos, titleYStart, titleYStop;
float titleYSpeed = (float) 0.1;
String titleYDir = "up";

void startScreenSetup() {
  brewImage = new PImage[3];
  brewImage[0] = loadImage("images/environment/potions-classroom-brew.png");
  brewImage[1] = loadImage("images/environment/potions-classroom-brew-glow.png");
  brewImage[2] = loadImage("images/environment/potions-classroom-brew-holder.png");

  startScreenBg = loadImage("images/environment/potions-classroom-dark.png");
  title = loadImage("images/graphics/title-text-2.png");
  titleYStart = height / 2 - 40;
  titleYPos = height / 2 - 40;
  titleYStop = height / 2 - 45; 
}

void startScreen() {  
  // Transition: Fade In
  if (brewImageOpacity < 255) brewImageOpacity += 5;
  if (brewImageOpacity > 100 && startScreenBgOpacity < 255) startScreenBgOpacity += 5;
  if (startScreenBgOpacity > 100 && titleOpacity < 255) titleOpacity += 3;

  background(0); 
  imageMode(CORNER); tint(255, startScreenBgOpacity);
  image(startScreenBg, 0, 0);

  imageMode(CENTER); tint(255, titleOpacity);
  image(title, width / 2, titleYPos);

  imageMode(CORNER); tint(255, brewImageOpacity);
  image(brewImage[0], 0, 0);

  // Button: Start
  startButton.display(); 

  // Animation: title Float
  if (titleYPos > titleYStart) titleYDir = "up";
  else if (titleYPos < titleYStop) titleYDir = "down";
  if (titleYDir == "up") titleYPos -= titleYSpeed; // float up
  else if (titleYDir == "down") titleYPos += titleYSpeed; // float down
}

