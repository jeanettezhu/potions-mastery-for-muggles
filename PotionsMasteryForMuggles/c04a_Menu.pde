/**************************
 * CLASS: Menu
 **************************/

class Menu {
  String[][] array;
  int topLineNum; 
  List[] option; 
  ArrayList<String> arrayList; 
  
  Menu(String[][] array, int topLineNum) {
    this.array = array; 
    this.topLineNum = topLineNum;
    option = new List[array.length]; 
    for (int i = 0; i < array.length; i++) option[i] = new List(array[i][0], i);
  }
  
  Menu(ArrayList<String> arrayList, int topLineNum) {
    this.arrayList = arrayList; 
    this.topLineNum = topLineNum;
  }
  
  // Dark Menu
  void display() {
    rectMode(CORNER); fill(0, 225);
    rect(0, 0, menuWidth, height);

    // Content
    for (int i = 0; i < array.length; i++) {
      option[i].display();
      if (i != indexActive || displayStats) option[i].active = false; 
    }

    // Menu Shading
    imageMode(CORNER);
    image(menuShading, 0, 0, menuWidth, height);

    // Buttons
    upArrow.display(); 
    downArrow.display(); 
    if (upArrow.hovered() && mousePressed && topLine[topLineNum] <= topLineHolder) topLine[topLineNum] += scrollSpeed;
    if (keyCode == UP && keyPressed && topLine[topLineNum] <= topLineHolder) topLine[topLineNum] += scrollSpeed;
    if (downArrow.hovered() && mousePressed && topLine[topLineNum] >= -(array.length * lineSpacing + topLineHolder - height)) topLine[topLineNum] -= scrollSpeed;
    if (keyCode == DOWN && keyPressed && topLine[topLineNum] >= -(array.length * lineSpacing + topLineHolder - height)) topLine[topLineNum] -= scrollSpeed;
  }
  
  // addMenu
  void display(PImage icon) {
    rectMode(CORNER); fill(225, 225);
    rect(0, 0, menuWidth, height);

    // Content
    for (int i = 0; i < array.length; i++) {
      option[i].display(0);
      if (option[i].hovered()) image(icon, menuIconXPos, topLine[topLineNum] + i * lineSpacing - 7);
    }

    // Menu Shading
    imageMode(CORNER);
    image(menuShadingWhite, 0, 0, menuWidth, height);

    // Buttons
    closeButton[1].display(3); 
    upArrow.display(3); 
    downArrow.display(3); 
    if (upArrow.hovered() && mousePressed && topLine[topLineNum] <= topLineHolder) topLine[topLineNum] += scrollSpeed;
    if (keyCode == UP && keyPressed && topLine[topLineNum] <= topLineHolder) topLine[topLineNum] += scrollSpeed;
    if (downArrow.hovered() && mousePressed && topLine[topLineNum] >= -(array.length * lineSpacing + topLineHolder - height)) topLine[topLineNum] -= scrollSpeed;
    if (keyCode == DOWN && keyPressed && topLine[topLineNum] >= -(array.length * lineSpacing + topLineHolder - height)) topLine[topLineNum] -= scrollSpeed;
  }
  
  // removeMenu -- can't figure out how to simplify this u____u;;
  void displayList() {
    rectMode(CORNER); fill(225, 225);
    rect(0, 0, menuWidth, height);

    // Content
    imageMode(CENTER); noTint();
    textAlign(LEFT); textSize(20); 
    for (int i = 0; i < arrayList.size(); i++) {
      fill(0, 100);
      text(arrayList.get(i), leftIndent, topLine[topLineNum] + i * lineSpacing);
      if (hovered(leftIndent, topLine[topLineNum] + i * lineSpacing, menuWidth) && !soundButton.hovered()) {
        fill(0);
        text(arrayList.get(i), leftIndent, topLine[topLineNum] + i * lineSpacing);
        image(removeIcon, menuIconXPos, topLine[topLineNum] + i * lineSpacing - 7);
      }
    }

    // Menu Shading
    imageMode(CORNER);
    image(menuShadingWhite, 0, 0, menuWidth, height);

    // Buttons
    closeButton[1].display(3); 
    upArrow.display(3); 
    downArrow.display(3); 
    if (upArrow.hovered() && mousePressed && topLine[topLineNum] <= topLineHolder) topLine[topLineNum] += scrollSpeed;
    if (keyCode == UP && keyPressed && topLine[topLineNum] <= topLineHolder) topLine[topLineNum] += scrollSpeed;
    if (downArrow.hovered() && mousePressed && topLine[topLineNum] >= -(arrayList.size() * lineSpacing + topLineHolder - height)) topLine[topLineNum] -= scrollSpeed;
    if (keyCode == DOWN && keyPressed && topLine[topLineNum] >= -(arrayList.size() * lineSpacing + topLineHolder - height)) topLine[topLineNum] -= scrollSpeed;
  }
  
  class List {
    String text;
    int lineNum; 
    boolean active = false; 
    
    List(String text, int lineNum) {
      this.text = text; 
      this.lineNum = lineNum;  
    }
    
    boolean hovered() {
      if (mouseX > (leftIndent) && mouseX < (leftIndent + menuWidth - 100) && mouseY > ((topLine[topLineNum] + lineNum * lineSpacing) - 15) 
        && mouseY < ((topLine[topLineNum] + lineNum * lineSpacing) + 15) && !soundButton.hovered()) 
        return true;
      else return false;  
    }
    
    void display() {
      textAlign(LEFT); textSize(20);
      if (this.hovered() || active) {
        fill(255);
        text(array[lineNum][0], leftIndent, topLine[topLineNum] + lineNum * lineSpacing);
      } else {
        fill(255, 100);
        text(array[lineNum][0], leftIndent, topLine[topLineNum] + lineNum * lineSpacing);
      }
    }
    
    void display(float textColor) {
      textAlign(LEFT); textSize(20);
      if (this.hovered() || active) {
        fill(textColor);
        text(array[lineNum][0], leftIndent, topLine[topLineNum] + lineNum * lineSpacing);
      } else {
        fill(textColor, 100);
        text(array[lineNum][0], leftIndent, topLine[topLineNum] + lineNum * lineSpacing);
      }
    }
  }
}
