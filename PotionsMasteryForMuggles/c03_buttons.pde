/****************************************************************************************************************************************
 * COMPONENT: Buttons
 ****************************************************************************************************************************************/

TextButton backButton; 
PImage[] backButtonImage;
float backButtonXPos = botButtonXPos;
float backButtonYPos = botButtonYPos;

TextButton navButton, navLeftArrow, navRightArrow; 
PImage[] navButtonImage, leftArrowImage, rightArrowImage;
float navButtonXPos = width / 2;
float navButtonYPos = botButtonYPos;

TextButton nextButton; 
PImage[] nextButtonImage;
float nextButtonXPos = botButtonXPos;
float nextButtonYPos = botButtonYPos;

TextButton startButton; 
PImage[] startButtonImage;
float startButtonXPos = botButtonXPos;
float startButtonYPos = botButtonYPos;

Button addButton; 
PImage[] addButtonImage;
float addButtonXPos = width / 2; 
float addButtonYPos = 200;

Button[] closeButton; 
PImage[] closeButtonImage;
float mCloseButtonXPos = menuButtonXPos; // for menus
float mCloseButtonYPos = topButtonYPos; 
float bRBCloseButtonXPos = width / 2; // for brewing results box
float bRBCloseButtonYPos = 150; 

Button[] infoButton; 
PImage[] infoButtonImage;

// for program info box
float pIBInfoButtonXPos = topButtonXPos;
float pIBInfoButtonYPos = topButtonYPos + buttonSpacing;
float pIBCloseButtonXPos = width - pIBInfoButtonXPos; 
float pIBCloseButtonYPos = pIBInfoButtonYPos; 

// for snape info box
float sIBInfoButtonXPos = 750;
float sIBInfoButtonYPos = 400;
float sIBCloseButtonXPos = sIBInfoButtonXPos + buttonSpacing;
float sIBCloseButtonYPos = sIBInfoButtonYPos; 

Button pCollectionButton; 
PImage[] pCollectionButtonImage;
float pCollectionButtonXPos = topButtonXPos;
float pCollectionButtonYPos = topButtonYPos + 2*buttonSpacing;

// for recipe box
Button recipeButton; 
PImage[] recipeButtonImage;
float recipeButtonXPos = rightMidXPos; 
float recipeButtonYPos = topButtonYPos + buttonSpacing;
float rBCloseButtonXPos = recipeButtonXPos + buttonSpacing;
float rBCloseButtonYPos = recipeButtonYPos;

Button removeButton; 
PImage[] removeButtonImage;
float removeButtonXPos = addButtonXPos; 
float removeButtonYPos = addButtonYPos + buttonSpacing;

Button soundButton; 
PImage[] soundButtonImage;
float soundButtonXPos = topButtonXPos;
float soundButtonYPos = topButtonYPos;

// for menus
Button statsButton; 
PImage[] statsButtonImage;
float statsButtonXPos = menuButtonXPos; 
float statsButtonYPos = topButtonYPos;

Button upArrow, downArrow, leftArrow, rightArrow;
PImage[] upArrowImage;
float upArrowXPos = menuButtonXPos; 
float upArrowYPos = topButtonYPos + buttonSpacing;
PImage[] downArrowImage;
float downArrowXPos = upArrowXPos; 
float downArrowYPos = botButtonYPos;
float leftArrowXPos = topButtonXPos;
float leftArrowYPos = height / 2 + 30; 
float rightArrowXPos = width - leftArrowXPos; 
float rightArrowYPos = leftArrowYPos; 

void buttonsSetup() {
  backButtonImage = new PImage[2];
  backButtonImage[0] = loadImage("images/buttons/back-button.png");
  backButtonImage[1] = loadImage("images/buttons/back-button-hovered.png");
  backButton = new TextButton(backButtonImage, backButtonXPos, backButtonYPos); 
  
  navButtonImage = new PImage[2];
  navButtonImage[0] = loadImage("images/buttons/navigate-button.png");
  navButtonImage[1] = loadImage("images/buttons/navigate-button.png");
  navButton = new TextButton(navButtonImage, navButtonXPos, navButtonYPos);
  leftArrowImage = new PImage[2];
  leftArrowImage[0] = loadImage("images/graphics/left-arrow.png");
  leftArrowImage[1] = loadImage("images/graphics/left-arrow-hovered.png");
  navLeftArrow = new TextButton(leftArrowImage, navButtonXPos - 90, navButtonYPos); 
  rightArrowImage = new PImage[2];
  rightArrowImage[0] = loadImage("images/graphics/right-arrow.png");
  rightArrowImage[1] = loadImage("images/graphics/right-arrow-hovered.png");
  navRightArrow = new TextButton(rightArrowImage, navButtonXPos + 90, navButtonYPos); 
  
  nextButtonImage = new PImage[2];
  nextButtonImage[0] = loadImage("images/buttons/next-button.png");
  nextButtonImage[1] = loadImage("images/buttons/next-button-hovered.png");
  nextButton = new TextButton(nextButtonImage, nextButtonXPos, nextButtonYPos);
  
  startButtonImage = new PImage[2];
  startButtonImage[0] = loadImage("images/buttons/start-button.png");
  startButtonImage[1] = loadImage("images/buttons/start-button-hovered.png");
  startButton = new TextButton(startButtonImage, startButtonXPos, startButtonYPos);
  
  addButtonImage = new PImage[2];
  addButtonImage[0] = loadImage("images/buttons/add-button.png");
  addButtonImage[1] = loadImage("images/buttons/add-button-hovered.png");
  addButton = new Button(addButtonImage, addButtonXPos, addButtonYPos); 
  
  closeButtonImage = new PImage[4];
  closeButtonImage[0] = loadImage("images/buttons/close-button.png");
  closeButtonImage[1] = loadImage("images/buttons/close-button-hovered.png");  
  closeButtonImage[2] = loadImage("images/buttons/close-button-black.png");
  closeButtonImage[3] = loadImage("images/buttons/close-button-hovered-black.png");
  closeButton = new Button[5];
  closeButton[0] = new Button(closeButtonImage, pIBCloseButtonXPos, pIBCloseButtonYPos); // for program info box
  closeButton[1] = new Button(closeButtonImage, mCloseButtonXPos, mCloseButtonYPos); // for menus
  closeButton[2] = new Button(closeButtonImage, bRBCloseButtonXPos, bRBCloseButtonYPos); // for brewing results box
  closeButton[3] = new Button(closeButtonImage, sIBCloseButtonXPos, sIBCloseButtonYPos); // for snape info box
  closeButton[4] = new Button(closeButtonImage, rBCloseButtonXPos, rBCloseButtonYPos); // for recipe box
  
  infoButtonImage = new PImage[2];
  infoButtonImage[0] = loadImage("images/buttons/info-button.png");
  infoButtonImage[1] = loadImage("images/buttons/info-button-hovered.png");
  infoButton = new Button[2];
  infoButton[0] = new Button(infoButtonImage, pIBInfoButtonXPos, pIBInfoButtonYPos); 
  infoButton[1] = new Button(infoButtonImage, sIBInfoButtonXPos, sIBInfoButtonYPos); 
  
  pCollectionButtonImage = new PImage[2];
  pCollectionButtonImage[0] = loadImage("images/buttons/potions-cabinet-button.png");
  pCollectionButtonImage[1] = loadImage("images/buttons/potions-cabinet-button-hovered.png");
  pCollectionButton = new Button(pCollectionButtonImage, pCollectionButtonXPos, pCollectionButtonYPos); 
  
  recipeButtonImage = new PImage[2];
  recipeButtonImage[0] = loadImage("images/buttons/recipe-button.png");
  recipeButtonImage[1] = loadImage("images/buttons/recipe-button-hovered.png");
  recipeButton = new Button(recipeButtonImage, recipeButtonXPos, recipeButtonYPos); 
  
  removeButtonImage = new PImage[2];
  removeButtonImage[0] = loadImage("images/buttons/remove-button.png");
  removeButtonImage[1] = loadImage("images/buttons/remove-button-hovered.png");
  removeButton = new Button(removeButtonImage, removeButtonXPos, removeButtonYPos); 
  
  soundButtonImage = new PImage[4];
  soundButtonImage[0] = loadImage("images/buttons/sound-button-on.png");
  soundButtonImage[1] = loadImage("images/buttons/sound-button-on-hovered.png");
  soundButtonImage[2] = loadImage("images/buttons/sound-button-off.png");
  soundButtonImage[3] = loadImage("images/buttons/sound-button-off-hovered.png");
  soundButton = new Button(soundButtonImage, soundButtonXPos, soundButtonYPos); 
  
  statsButtonImage = new PImage[2];
  statsButtonImage[0] = loadImage("images/buttons/stats-button.png");
  statsButtonImage[1] = loadImage("images/buttons/stats-button-hovered.png");
  statsButton = new Button(statsButtonImage, statsButtonXPos, statsButtonYPos);
  
  upArrowImage = new PImage[4];
  upArrowImage[0] = loadImage("images/graphics/up-arrow.png");
  upArrowImage[1] = loadImage("images/graphics/up-arrow-hovered.png");
  upArrowImage[2] = loadImage("images/graphics/up-arrow-black.png");
  upArrowImage[3] = loadImage("images/graphics/up-arrow-black-hovered.png");
  upArrow = new Button(upArrowImage, upArrowXPos, upArrowYPos); 
  downArrowImage = new PImage[4];
  downArrowImage[0] = loadImage("images/graphics/down-arrow.png");
  downArrowImage[1] = loadImage("images/graphics/down-arrow-hovered.png");
  downArrowImage[2] = loadImage("images/graphics/down-arrow-black.png");
  downArrowImage[3] = loadImage("images/graphics/down-arrow-black-hovered.png");
  downArrow = new Button(downArrowImage, downArrowXPos, downArrowYPos); 
  leftArrow = new Button(leftArrowImage, leftArrowXPos, leftArrowYPos); 
  rightArrow = new Button(rightArrowImage, rightArrowXPos, rightArrowYPos); 
}
