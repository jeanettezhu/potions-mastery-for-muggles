/****************************************************************************************************************************************
 * COMPONENT: UI
 ****************************************************************************************************************************************/

String PROGRAM_STATE;

int width = 1000;
int height = 700;
float backgroundXPos = 0; // carries background x position over states
float rightMidXPos = 700; // for screens with menus

float topButtonYPos = 50;
float topButtonXPos = 60;
float botButtonXPos = width - 100; 
float botButtonYPos = height - 50;
float menuButtonXPos = 370;
float buttonSpacing = 50; // for 30x30 buttons

float topLineHolder = 110;
float leftIndent = 50;
float lineSpacing = 30;
float textXSpacing = 35;
float textYSpacing = 7; // for textSize(20)
float headerYPos = topButtonYPos + textYSpacing;
float lineDividerYPos = 455; 
float captionYSpacing = 45; 

PFont gothamBook;
PImage cursor;

// UI Setup
void uiSetup() {
  size(width, height);
  background(0);
  smooth();
  frameRate(60);
  noStroke();
  noTint();
  rectMode(CORNER);
  PROGRAM_STATE = "start";
  gothamBook = createFont("fonts/Gotham-Book.otf", 20);
  textFont(gothamBook);
  noCursor();
  cursor = loadImage("images/graphics/cursor.png");
}

// Cursor
void customCursor() {
  if (mousePressed) {
    tint(175);
    image(cursor, mouseX, mouseY, 20, 20);
  } else {
    tint(255);
    image(cursor, mouseX, mouseY, 20, 20);
  }
}

// Hover Detection
// for images with imageMode(CENTER)
boolean hovered(PImage image, float xPos, float yPos) {
  if (mouseX > (xPos - image.width / 2) && mouseX < (xPos + image.width / 2)
    && mouseY > (yPos - image.height / 2) && mouseY < (yPos + image.height / 2))
    return true;
  else return false;
}

// for menu options with textSize(20)
boolean hovered(float xPos, float yPos, float w) {
  if (mouseX > xPos && mouseX < (xPos + w - 100) && mouseY > (yPos - 15) && mouseY < (yPos + 15))
    return true;
  else return false;
}

// Header
void header(String header) {
  textAlign(CENTER); textSize(20); fill(255);
  text(header, width / 2, headerYPos);
}

// Line Dividers
void lineDivider(float xPos) {
  rectMode(CENTER);
  rect(xPos, lineDividerYPos, 200, 3);
}

void lineDivider(float xPos, float yPos) {
  rectMode(CENTER);
  rect(xPos, yPos, 200, 3);
}

void lineDivider(float xPos, float yPos, float w) {
  rectMode(CORNER);
  rect(xPos, yPos, w, 3);
}

// Placeholder Message
void placeholder() {
  float leftIndent = 300;
  float topLine = 250;
  float lineSpacing = 30;

  textAlign(LEFT); textSize(20); fill(255);
  text("OH BOLLOCKS! THERE'S NOTHING HERE.", leftIndent, topLine);
  text("TO CONTINUE PLAYING, PURCHASE THE", leftIndent, topLine + 2 * lineSpacing);
  text("FULL GAME FOR THE VERY LOW PRICE", leftIndent, topLine + 3 * lineSpacing);
  text("OF $999.99!", leftIndent, topLine + 4 * lineSpacing);
  text("(THIS MESSAGE WAS SPONSORED BY", leftIndent, topLine + 6 * lineSpacing);
  text("ELECTRONIC ARTS, INC.)", leftIndent, topLine + 7 * lineSpacing);
}

