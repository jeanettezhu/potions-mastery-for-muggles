/****************************************************************************************************************************************
 * COMPONENT: Sound
 ****************************************************************************************************************************************/
 
Minim minim;
AudioPlayer music, ambient;
AudioPlayer[] soundfx;
boolean soundOn = true; 

void soundSetup() {
  minim = new Minim(this);
  music = minim.loadFile("audio/hedwigs-theme-music-box.mp3"); music.setGain(-5); music.loop(); // music plays immediately upon opening game
  ambient = minim.loadFile("audio/potions-classroom-ambient.mp3"); ambient.setGain(-25); ambient.loop(); // home screen ambient sounds
  soundfx = new AudioPlayer[7];
  soundfx[0] = minim.loadFile("audio/bloop.mp3"); soundfx[0].setGain(-10); // bloop (for text buttons)
  soundfx[1] = minim.loadFile("audio/click.mp3"); soundfx[1].setGain(-20); // click (for menu options/square buttons)
  soundfx[2] = minim.loadFile("audio/door-open.mp3"); // door open
  soundfx[3] = minim.loadFile("audio/match-strike.mp3"); // match strike
  soundfx[4] = minim.loadFile("audio/page-flip.mp3"); soundfx[4].setGain(-10); // page flip
  soundfx[5] = minim.loadFile("audio/snape-talks.mp3"); soundfx[5].setGain(-20); // snape talks
  soundfx[6] = minim.loadFile("audio/water-bubbling.mp3"); soundfx[6].setGain(-15); // water bubbling
}

void soundControls() {
  if (PROGRAM_STATE == "start" || PROGRAM_STATE == "instructions") {
    music.setGain(-5);
    ambient.setGain(-25);
  } else { 
    music.setGain(-30);
    ambient.setGain(-12);
  }
   
  if (soundOn) {
    music.unmute(); 
    ambient.unmute(); 
    for (int i = 0; i < soundfx.length; i++) soundfx[i].unmute();
    soundButton.display("ON", LEFT, soundButtonXPos + textXSpacing, soundButtonYPos + textYSpacing, 255);
  } else {
    music.mute(); 
    ambient.mute(); 
    for (int i = 0; i < soundfx.length; i++) soundfx[i].mute();
    soundButton.display(3, "OFF", LEFT, soundButtonXPos + textXSpacing, soundButtonYPos + textYSpacing, 255);
  }
}
