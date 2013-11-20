/**
  * Displays the sound intensity of a played sound file.
  */

import ddf.minim.*;

Minim minim;
AudioSource audioSource;

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
  
  noStroke();
  fill(255);

  float level = audioSource.mix.level();
  
  float w = map(level, 0.0, 1.0, 0.0, width);
  rect(0, 50, w, 100);
}

