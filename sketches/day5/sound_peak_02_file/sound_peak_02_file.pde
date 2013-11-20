/**
  * Displays the sound intensity of a played sound file.
  * Also displays the peak intensity. The peak falls of because it is actually
  * set with a low-pass filter (against zero).
  */

import ddf.minim.*;

Minim minim;
AudioSource audioSource;

float peak = 0.0;

void setup() {
  size(600, 200);

  minim = new Minim(this);

  AudioPlayer soundPlayer = minim.loadFile("popeye_theme.mp3");
  soundPlayer.play();
  soundPlayer.loop();

  audioSource = soundPlayer;
}

void draw() {
  background(52);

  float level = audioSource.mix.level();
  
  if (level > peak) {   // set
    peak = level;   
  } else {  // decay
    peak = 0.96 * peak + 0.1 * 0.0; 
  }
  
  noStroke();
  
  float levelX = map(level, 0.0, 1.0, 0.0, width);

  fill(255);
  rect(0, 50, levelX, 100);
  
  float peakX = map(peak, 0.0, 1.0, 0.0, width);
  
  fill(255, 69, 0);
  rect(peakX, 50, 10, 100); 
}

