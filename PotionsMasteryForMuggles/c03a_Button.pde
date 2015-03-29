/**************************
 * CLASS: Button
 **************************/
 
class Button {
  PImage[] image;
  float xPos, yPos;
  boolean active = false; 
  boolean on = true; 

  Button(PImage[] image, float xPos, float yPos) {
    this.image = image;
    this.xPos = xPos; 
    this.yPos = yPos;
  }

  boolean hovered() {
    if (mouseX > (xPos - image[0].width / 2 - 10) && mouseX < (xPos + image[0].width / 2 + 10)
      && mouseY > (yPos - image[0].height / 2 - 10) && mouseY < (yPos + image[0].height / 2 + 10))
      return true;
    else return false;
  }

  boolean clicked() {
    if (this.hovered() && mousePressed) return true;
    else return false;
  }

  void display() {
    imageMode(CENTER); noTint();
    if (this.hovered() || active) image(image[1], xPos, yPos);
    else image(image[0], xPos, yPos);
  }
  
  void display(int i) {
    imageMode(CENTER); noTint();
    if (this.hovered() || active) image(image[i], xPos, yPos);
    else image(image[i-1], xPos, yPos);
  }
  
  void display(String label, int alignment, float labelXPos, float labelYPos, float opacity) {
    imageMode(CENTER); tint(255, opacity);
    if (this.hovered() || active) {
      image(image[1], xPos, yPos);
      textAlign(alignment); textSize(20); fill(255);
      text(label, labelXPos, labelYPos);
    } else image(image[0], xPos, yPos);
  }
  
  void display(int i, String label, int alignment, float labelXPos, float labelYPos, float opacity) {
    imageMode(CENTER); tint(255, opacity);
    if (this.hovered() || active) {
      image(image[i], xPos, yPos);
      textAlign(alignment); textSize(20); fill(255);
      text(label, labelXPos, labelYPos);
    } else image(image[i-1], xPos, yPos);
  }
  
  void toggle() {
    active = !active;
  }
} 
