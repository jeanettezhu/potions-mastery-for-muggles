/**************************
 * CLASS: Item
 **************************/

class Item {
  PImage[] image;
  float xPos, yPos;
  String header;

  Item(PImage[] image, float xPos, float yPos) {
    this.image = image;
    this.xPos = xPos; 
    this.yPos = yPos; 
  }
  
  Item(PImage[] image, float xPos, float yPos, String header) {
    this.image = image;
    this.xPos = xPos; 
    this.yPos = yPos; 
    this.header = header; 
  }

  // for Items with imageMode(CORNER) and changing positions (home Items)
  boolean hovered() {
    if (mouseX > (backgroundXPos + xPos) && mouseX < (backgroundXPos + xPos + image[0].width) 
      && mouseY > yPos && mouseY < (yPos + image[0].height)) 
      return true;
    else return false;
  }
  
  // for Items with imageMode(CORNER) and static postion (snapeFront)
  boolean hovered(float staticXPos) {
    if (mouseX > (staticXPos + xPos) && mouseX < (staticXPos + xPos + image[0].width) 
      && mouseY > yPos && mouseY < (yPos + image[0].height)) 
      return true;
    else return false;
  }
  
  // for Items with imageMode(CENTER) and static postion (cauldron)
  boolean hoveredCenter() {
    if (mouseX > (xPos - image[0].width / 2) && mouseX < (xPos + image[0].width / 2) 
      && mouseY > (yPos - image[0].height / 2) && mouseY < (yPos + image[0].height / 2))
      return true;
    else return false;
  }
  
  boolean clicked() {
    if (this.hovered() && mousePressed) return true;
    else return false;
  }
  
  void display() {
    imageMode(CORNER);
    noTint();
    if (this.hovered()) {
      image(image[1], backgroundXPos + xPos, yPos);
      header(header);
    } else image(image[0], backgroundXPos + xPos, yPos);
  }
}
