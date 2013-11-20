/**
 * Displays the sound intensity of a live sound input (e.g. microphone)
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

  AudioInput microphone = minim.getLineIn();
  audioSource = microphone;
}

void draw() {
  background(52);

  float level = audioSource.mix.level();  

  if (level > peak) {   // set
    peak = level;
  } 
  else {  // decay
    peak = 0.99 * peak + 0.01 * 0.0;
  }

  noStroke();

  float levelX = map(level, 0.0, 1.0, 0.0, width);

  fill(255);
  rect(0, 50, levelX, 100);

  float peakX = map(peak, 0.0, 1.0, 0.0, width);

  fill(255, 69, 0);
  rect(peakX, 50, 10, 100);
}


