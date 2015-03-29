/****************************************************************************************************************************************
 
 * POTIONS MASTERY FOR MUGGLES
 * @author Jeanette Zhu
 * @updated 2015-03-20
 * @version 3.0 
 
 ****************************************************************************************************************************************/

/****************************************************************************************************************************************
 * PRELOAD/IMPORT
 ****************************************************************************************************************************************/
 
import ddf.minim.*;
import java.util.*; 

/****************************************************************************************************************************************
 * MAIN/DRIVER
 ****************************************************************************************************************************************/
 
void setup() {
  uiSetup();
  menusSetup();
  buttonsSetup(); 
  soundSetup(); 
  startScreenSetup();
  instructScreenSetup();
  homeScreenSetup();
  brewScreenSetup();
  converseScreenSetup();
  rBookScreenSetup();
  iCabinetScreenSetup();
  pCollectionScreenSetup();
} 

void draw() {
  if (PROGRAM_STATE == "start") startScreen();
  else if (PROGRAM_STATE == "instructions") instructScreen();
  else if (PROGRAM_STATE == "home") homeScreen();
  else if (PROGRAM_STATE == "brew") brewScreen();
  else if (PROGRAM_STATE == "converse") converseScreen();
  else if (PROGRAM_STATE == "rBook") rBookScreen();
  else if (PROGRAM_STATE == "iCabinet") iCabinetScreen();
  else if (PROGRAM_STATE == "pCollection") pCollectionScreen();

  soundControls(); 
  customCursor();
} 

/* NOTE: Arrow functions are not placed in keyPressed() and mousePressed() because it results in staggering movement. 
Placing it directly in the draw() results in a smoother movement. */

void keyPressed() {
  // Quick Navigation
  if (key == '1') PROGRAM_STATE = "start";
  if (key == '2') PROGRAM_STATE = "instructions";
  if (key == '3') PROGRAM_STATE = "home";
  if (key == '4') PROGRAM_STATE = "brew";
  if (key == '5') PROGRAM_STATE = "converse";
  if (key == '6') PROGRAM_STATE = "iCabinet";
  if (key == '7') PROGRAM_STATE = "rBook";
  if (key == '8') PROGRAM_STATE = "pCollection";
  if (key == '9') saveFrame();
  
  // backButton Navigation
  if (PROGRAM_STATE == "brew" || PROGRAM_STATE == "converse" || PROGRAM_STATE == "iCabinet" 
    || PROGRAM_STATE == "rBook" || PROGRAM_STATE == "pCollection") {
    if (keyCode == BACKSPACE) {
      soundfx[0].rewind(); soundfx[0].play();
      displayHomeScreen = false;
      homeScreenOpacity = 0;
      PROGRAM_STATE = "home";
    }
  }
} 

void mousePressed() {
  // soundButton
  if (soundButton.hovered()) soundOn = !soundOn;
  
  // backButton
  if (PROGRAM_STATE == "brew" || PROGRAM_STATE == "converse" || PROGRAM_STATE == "iCabinet" 
    || PROGRAM_STATE == "rBook" || PROGRAM_STATE == "pCollection") {
    if (backButton.hovered()) {
      soundfx[0].rewind(); soundfx[0].play();
      displayHomeScreen = false;
      homeScreenOpacity = 0;
      PROGRAM_STATE = "home";
    }
  }

  // start Navigation
  if (PROGRAM_STATE == "start") {
    if (startButton.hovered()) {
      soundfx[0].rewind(); soundfx[0].play();
      PROGRAM_STATE = "instructions"; 
    }
  }
  
  // instructions Navigation
  if (PROGRAM_STATE == "instructions") {
    if (nextButton.hovered() && displayNextButton) {
      soundfx[0].rewind(); soundfx[0].play();
      PROGRAM_STATE = "home"; 
    }
  }
  
  // home Navigation
  if (PROGRAM_STATE == "home") {
    // Buttons
    if (infoButton[0].hovered()) {
      soundfx[1].rewind(); soundfx[1].play();
      displayProgramInfo = true; 
      infoButton[0].active = true; 
    } else if (displayProgramInfo && closeButton[0].hovered()) {
      soundfx[1].rewind(); soundfx[1].play();
      displayProgramInfo = false;
      infoButton[0].active = false; 
    } else if (pCollectionButton.hovered() && !displayProgramInfo) { 
      soundfx[1].rewind(); soundfx[1].play();
      PROGRAM_STATE = "pCollection";
    } 
    // Items
    if (!displayProgramInfo && !navButton.hovered() && !navLeftArrow.hovered() && !navRightArrow.hovered()) {
      if (iCabinet.hovered() && !rBook.hovered() && !snape.hovered() && !brewer.hovered()) {
        soundfx[2].rewind(); soundfx[2].play(); 
        PROGRAM_STATE = "iCabinet"; 
      } else if (rBook.hovered()) {
        soundfx[4].rewind(); soundfx[4].play(); 
        PROGRAM_STATE = "rBook"; 
      } else if (snape.hovered() && !nextButton.hovered()) {
        soundfx[5].rewind(); soundfx[5].play(); 
        PROGRAM_STATE = "converse"; 
      } else if (brewer.hovered() && !holder.hovered()) {
        soundfx[6].rewind(); soundfx[6].play(); 
        PROGRAM_STATE = "brew"; 
      }
    }
  }
  
  // brew Navigation
  if (PROGRAM_STATE == "brew") {
    // Button: Add
    if (addButton.hovered() && !displayResult) {
      soundfx[1].rewind(); soundfx[1].play();
      addButtonActive = true;
      removeButtonActive = false;
      ingredientInactive = false; 
      addButton.active = true; 
      removeButton.active = false; 
    } else if (addButtonActive) {
      for (int i = 0; i < INGREDIENTS.length; i++) {
        if (addMenu.option[i].hovered()) {
          soundfx[1].rewind(); soundfx[1].play();
          ingredientActive = true;
          indexActive = i;
          ingredientsAdded.add(INGREDIENTS[i][0]);
          numOfIngredients++;
        } 
      }
      if (closeButton[1].hovered()) {
        soundfx[1].rewind(); soundfx[1].play();
        addButtonActive = false;
        ingredientActive = false;
        addButton.active = false; 
      }
    } 
    // Button: Remove
    if (removeButton.hovered() && !displayResult) {
      soundfx[1].rewind(); soundfx[1].play();
      addButtonActive = false;
      removeButtonActive = true;
      ingredientActive = false; 
      addButton.active = false; 
      removeButton.active = true; 
    } else if (removeButtonActive) {
      for (int i = 0; i < ingredientsAdded.size(); i++) {
        if (hovered(leftIndent, topLine[1] + i * lineSpacing, menuWidth) && !soundButton.hovered()) {
          soundfx[1].rewind(); soundfx[1].play();
          ingredientHolder = ingredientsAdded.get(i);
          ingredientInactive = true;
          indexRemoved = i;
          ingredientsAdded.remove(i);
          numOfIngredients--;
        }
      }
      if (closeButton[1].hovered()) {
        soundfx[1].rewind(); soundfx[1].play();
        removeButtonActive = false;
        ingredientInactive = false;
        removeButton.active = false;
      } 
    }
    // Cauldron
    if (cauldron.hoveredCenter() && cauldronOpacity >= 255 && !isEmpty && !addButtonActive && !removeButtonActive) {
      soundfx[3].rewind(); soundfx[3].play();
      displayLitCauldron = true; 
      for (int i = 0; i < ingredientsAdded.size(); i++) {
        submittedFormula = ingredientsAdded.toArray(new String[ingredientsAdded.size()]);
        // /* CHECK */ println(submittedFormula); 
        while (numOfIngredients > 0) {
          ingredientsAdded.remove(i);
          numOfIngredients--;
        }
      }
      // Check Results
      displayResult = true; 
      if (Arrays.equals(submittedFormula, ANTIDOTE_TO_COMMON_POISONS)) { 
        potionsAdded.add(POTIONS[1][1]); potionsAddedNames.add(POTIONS[1][0]); numOfPotions++; // store potion image, name, and increase # of potions added
        month = month(); day = day(); year = year(); hour = hour(); minute = minute(); int[] date = { month, day, year, hour, minute }; datesAdded.add(date);  // store date and time
      }
      if (Arrays.equals(submittedFormula, BEAUTIFICATION_POTION)) { 
        potionsAdded.add(POTIONS[2][1]); potionsAddedNames.add(POTIONS[2][0]); numOfPotions++;
        month = month(); day = day(); year = year(); hour = hour(); minute = minute(); int[] date = { month, day, year, hour, minute }; datesAdded.add(date);
      }
      if (Arrays.equals(submittedFormula, CURE_FOR_BOILS)) { 
        potionsAdded.add(POTIONS[3][1]); potionsAddedNames.add(POTIONS[3][0]); numOfPotions++; 
        month = month(); day = day(); year = year(); hour = hour(); minute = minute(); int[] date = { month, day, year, hour, minute }; datesAdded.add(date);
      }
      if (Arrays.equals(submittedFormula, DOXYCIDE)) { 
        potionsAdded.add(POTIONS[4][1]); potionsAddedNames.add(POTIONS[4][0]); numOfPotions++; 
        month = month(); day = day(); year = year(); hour = hour(); minute = minute(); int[] date = { month, day, year, hour, minute }; datesAdded.add(date);
      }
      if (Arrays.equals(submittedFormula, DRAGON_DUNG_FERTILIZER)) { 
        potionsAdded.add(POTIONS[5][1]); potionsAddedNames.add(POTIONS[5][0]); numOfPotions++;
        month = month(); day = day(); year = year(); hour = hour(); minute = minute(); int[] date = { month, day, year, hour, minute }; datesAdded.add(date);
      }
      if (Arrays.equals(submittedFormula, DRAUGHT_OF_LIVING_DEATH)) { 
        potionsAdded.add(POTIONS[6][1]); potionsAddedNames.add(POTIONS[6][0]); numOfPotions++; 
        month = month(); day = day(); year = year(); hour = hour(); minute = minute(); int[] date = { month, day, year, hour, minute }; datesAdded.add(date);
      }
      if (Arrays.equals(submittedFormula, DRAUGHT_OF_PEACE)) { 
        potionsAdded.add(POTIONS[7][1]); potionsAddedNames.add(POTIONS[7][0]); numOfPotions++; 
        month = month(); day = day(); year = year(); hour = hour(); minute = minute(); int[] date = { month, day, year, hour, minute }; datesAdded.add(date);
      }
      if (Arrays.equals(submittedFormula, ELIXIR_TO_INDUCE_EUPHORIA)) { 
        potionsAdded.add(POTIONS[9][1]); potionsAddedNames.add(POTIONS[9][0]); numOfPotions++; 
        month = month(); day = day(); year = year(); hour = hour(); minute = minute(); int[] date = { month, day, year, hour, minute }; datesAdded.add(date);
      }
      if (Arrays.equals(submittedFormula, FELIX_FELICIS)) { 
        potionsAdded.add(POTIONS[11][1]); potionsAddedNames.add(POTIONS[11][0]); numOfPotions++; 
        month = month(); day = day(); year = year(); hour = hour(); minute = minute(); int[] date = { month, day, year, hour, minute }; datesAdded.add(date);
      }
      if (Arrays.equals(submittedFormula, FIRE_PROTECTION_POTION)) { 
        potionsAdded.add(POTIONS[12][1]); potionsAddedNames.add(POTIONS[12][0]); numOfPotions++; 
        month = month(); day = day(); year = year(); hour = hour(); minute = minute(); int[] date = { month, day, year, hour, minute }; datesAdded.add(date);
      }
      if (Arrays.equals(submittedFormula, FORGETFULNESS_POTION)) { 
        potionsAdded.add(POTIONS[14][1]); potionsAddedNames.add(POTIONS[14][0]); numOfPotions++; 
        month = month(); day = day(); year = year(); hour = hour(); minute = minute(); int[] date = { month, day, year, hour, minute }; datesAdded.add(date);
      }
      if (Arrays.equals(submittedFormula, GIRDING_POTION)) { 
        potionsAdded.add(POTIONS[15][1]); potionsAddedNames.add(POTIONS[15][0]); numOfPotions++; 
        month = month(); day = day(); year = year(); hour = hour(); minute = minute(); int[] date = { month, day, year, hour, minute }; datesAdded.add(date);  
      }
      if (Arrays.equals(submittedFormula, HERBICIDE_POTION)) { 
        potionsAdded.add(POTIONS[16][1]); potionsAddedNames.add(POTIONS[16][0]); numOfPotions++; 
        month = month(); day = day(); year = year(); hour = hour(); minute = minute(); int[] date = { month, day, year, hour, minute }; datesAdded.add(date);
      }
      if (Arrays.equals(submittedFormula, LOVE_POTION)) { 
        potionsAdded.add(POTIONS[18][1]); potionsAddedNames.add(POTIONS[18][0]); numOfPotions++; 
        month = month(); day = day(); year = year(); hour = hour(); minute = minute(); int[] date = { month, day, year, hour, minute }; datesAdded.add(date);
      }
      if (Arrays.equals(submittedFormula, OCULUS_POTION)) { 
        potionsAdded.add(POTIONS[19][1]); potionsAddedNames.add(POTIONS[19][0]); numOfPotions++; 
        month = month(); day = day(); year = year(); hour = hour(); minute = minute(); int[] date = { month, day, year, hour, minute }; datesAdded.add(date);
      }
      if (Arrays.equals(submittedFormula, POLYJUICE_POTION)) { 
        potionsAdded.add(POTIONS[20][1]); potionsAddedNames.add(POTIONS[20][0]); numOfPotions++; 
        month = month(); day = day(); year = year(); hour = hour(); minute = minute(); int[] date = { month, day, year, hour, minute }; datesAdded.add(date);
      }
      if (Arrays.equals(submittedFormula, SHRINKING_SOLUTION)) { 
        potionsAdded.add(POTIONS[23][1]); potionsAddedNames.add(POTIONS[23][0]); numOfPotions++; 
        month = month(); day = day(); year = year(); hour = hour(); minute = minute(); int[] date = { month, day, year, hour, minute }; datesAdded.add(date);
      }
      if (Arrays.equals(submittedFormula, SKELE_GRO)) { 
        potionsAdded.add(POTIONS[24][1]); potionsAddedNames.add(POTIONS[24][0]); numOfPotions++; 
        month = month(); day = day(); year = year(); hour = hour(); minute = minute(); int[] date = { month, day, year, hour, minute }; datesAdded.add(date);
      }
      if (Arrays.equals(submittedFormula, SLEEPING_DRAUGHT)) { 
        potionsAdded.add(POTIONS[25][1]); potionsAddedNames.add(POTIONS[25][0]); numOfPotions++; 
        month = month(); day = day(); year = year(); hour = hour(); minute = minute(); int[] date = { month, day, year, hour, minute }; datesAdded.add(date);
      }
      if (Arrays.equals(submittedFormula, SWELLING_SOLUTION)) { 
        potionsAdded.add(POTIONS[26][1]); potionsAddedNames.add(POTIONS[26][0]); numOfPotions++;
        month = month(); day = day(); year = year(); hour = hour(); minute = minute(); int[] date = { month, day, year, hour, minute }; datesAdded.add(date);
      }
      if (Arrays.equals(submittedFormula, VOLUBILIS_POTION)) { 
        potionsAdded.add(POTIONS[28][1]); potionsAddedNames.add(POTIONS[28][0]); numOfPotions++;
        month = month(); day = day(); year = year(); hour = hour(); minute = minute(); int[] date = { month, day, year, hour, minute }; datesAdded.add(date);
      }
      if (Arrays.equals(submittedFormula, WIDEYE_POTION)) { 
        potionsAdded.add(POTIONS[29][1]); potionsAddedNames.add(POTIONS[29][0]); numOfPotions++; 
        month = month(); day = day(); year = year(); hour = hour(); minute = minute(); int[] date = { month, day, year, hour, minute }; datesAdded.add(date);
      }
      if (Arrays.equals(submittedFormula, WIGGENWELD_POTION)) { 
        potionsAdded.add(POTIONS[30][1]); potionsAddedNames.add(POTIONS[30][0]); numOfPotions++; 
        month = month(); day = day(); year = year(); hour = hour(); minute = minute(); int[] date = { month, day, year, hour, minute }; datesAdded.add(date);
      }
      if (Arrays.equals(submittedFormula, WIT_SHARPENING_POTION)) { 
        potionsAdded.add(POTIONS[31][1]); potionsAddedNames.add(POTIONS[31][0]); numOfPotions++; 
        month = month(); day = day(); year = year(); hour = hour(); minute = minute(); int[] date = { month, day, year, hour, minute }; datesAdded.add(date);
      }
    }
    
    // Results Box
    if (displayResult && closeButton[2].hovered()) {
      soundfx[1].rewind(); soundfx[1].play();
      displayResult = false;
      displayLitCauldron = false; 
      litCauldronOpacity = 0;
      resultBoxOpacity = 0;
      skullYPos = skullYStart; 
    }
  }
  
  // converse Navigation
  if (PROGRAM_STATE == "converse") {
    if (infoButton[1].hovered()) {
      soundfx[1].rewind(); soundfx[1].play();
      displaySnapeInfo = true; 
      infoButton[1].active = true; 
    } else if (displaySnapeInfo && closeButton[3].hovered()) {
      soundfx[1].rewind(); soundfx[1].play();
      displaySnapeInfo = false;
      infoButton[1].active = false; 
    }
  }
  
  // iCabinet Navigation
  if (PROGRAM_STATE == "iCabinet") {
    if (displayIMenu) {
      for (int i = 0; i < INGREDIENTS.length; i++) {
        if (ingredientsMenu.option[i].hovered()) {
          soundfx[1].rewind(); soundfx[1].play();
          ingredientActive = true;
          indexActive = i;
          ingredientsMenu.option[indexActive].active = true;
          displayStats = false; 
        } 
      }
    }
    if (statsButton.hovered()) {
      soundfx[1].rewind(); soundfx[1].play();
      displayStats = true; 
      statsButton.active = true; 
      displayIMessage = false;
      ingredientActive = false;
    } 
  }
  
  // rBook Navigation
  if (PROGRAM_STATE == "rBook") {
    if (displayRMenu) {
      for (int i = 0; i < POTIONS.length; i++) {
        if (potionsMenu.option[i].hovered()) {
          soundfx[1].rewind(); soundfx[1].play();
          potionActive = true;
          indexActive = i;
          potionsMenu.option[indexActive].active = true;
        } 
      }
    }
    if (potionActive && recipeButton.hovered()) {
      soundfx[1].rewind(); soundfx[1].play();
      displayRecipe = true;
      recipeButton.active = true; 
    } else if (displayRecipe && closeButton[4].hovered()) {
      soundfx[1].rewind(); soundfx[1].play();
      displayRecipe = false;
      recipeButton.active = false; 
    }
  }
  
  // pCollection Navigation
  if (PROGRAM_STATE == "pCollection") {
    if (infoButton[0].hovered()) {
      soundfx[1].rewind(); soundfx[1].play();
      displayProgramInfo = true; 
      infoButton[0].active = true; 
    } else if (displayProgramInfo && closeButton[0].hovered()) {
      soundfx[1].rewind(); soundfx[1].play();
      displayProgramInfo = false;
      infoButton[0].active = false; 
    } 
  }
}
