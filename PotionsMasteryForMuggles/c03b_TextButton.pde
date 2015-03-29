/**************************
 * CLASS: Text Button
 **************************/

class TextButton {
  PImage[] image;
  float xPos, yPos; 
  float opacity = 0; 
  String opacityDir = "increase"; 
  // boolean nextState = false; 

  TextButton(PImage[] image, float xPos, float yPos) {
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
    imageMode(CENTER);
    if (this.hovered()) {
      noTint();
      image(image[1], xPos, yPos); 
    } else { 
      tint(255, opacity);
      image(image[0], xPos, yPos);
      if (opacity > 225) opacityDir = "decrease";
      else if (opacity < 75) opacityDir = "increase";
      if (opacityDir == "decrease") opacity -= 1;
      else if (opacityDir == "increase") opacity += 2;
    }
  }
}
