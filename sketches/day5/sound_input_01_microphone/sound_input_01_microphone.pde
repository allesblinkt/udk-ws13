/**
  * Displays the sound intensity of a live sound input (e.g. microphone)
  */

import ddf.minim.*;

Minim minim;
AudioSource audioSource;

void setup() {
  size(600, 200);

  minim = new Minim(this);

  AudioInput microphone = minim.getLineIn();
  audioSource = microphone;
}

void draw() {
  background(52);
  
  noStroke();
  fill(255);

  float level = audioSource.mix.level();
  
  float w = map(level, 0.0, 1.0, 0.0, width);
  rect(0, 50, w, 100);
}

