/**
 * Displays the sound intensity of a live sound input (e.g. microphone)
 * on a scale in decibels.
 * Also displays the peak intensity. The peak falls of because it is actually
 * set with a low-pass filter (against zero).
 */

import ddf.minim.*;

Minim minim;
AudioSource audioSource;

PFont font;

float peak = 0.0;

float ticks[] = {
  0, -5, -10, -20, -30, -40, -50
};


void setup() {
  size(200, 600);

  font = loadFont("Futura-Medium-14.vlw");
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
    peak = 0.96 * peak + 0.1 * 0.0;
  }

  float levelDb = 10.0 * log10(level);
  float peakDb = 10.0 * log10(peak);

  /* Levels */
  noStroke();

  float levelY = map(iecDbScale(levelDb), 0.0, 1.0, height, 0.0);

  fill(255);
  rect(20, levelY, width - 40, height - levelY);

  float peakY = map(iecDbScale(peakDb), 0.0, 1.0, height, 0.0);

  fill(255, 69, 0);
  rect(20, peakY, width - 40, 5);


  /* Scale */
  textAlign(CENTER);
  textFont(font);

  for (int i = 0; i < ticks.length; i++) {
    float tickDb = ticks[i];
    float y = map(iecDbScale(tickDb), 0.0, 1.0, height, 0.0);

    noFill();
    stroke(255);
    line(0, y, 20, y);
    line(width, y, width - 20, y);
    
    noStroke();
    fill(128);
    text(tickDb + "", width * 0.5, y + 5.0);
  }
}


float iecDbScale(float theDb) {
  float percent = 0.0f;

  if (theDb < -70.0) {
    percent = 0.0f;
  } 
  else if (theDb < -60.0) {
    percent = (theDb + 70.0f) * 0.25f;
  } 
  else if (theDb < -50.0) {
    percent = (theDb + 60.0f) * 0.5f + 2.5f;
  } 
  else if (theDb < -40.0) {
    percent = (theDb + 50.0f) * 0.75f + 7.5f;
  } 
  else if (theDb < -30.0) {
    percent = (theDb + 40.0f) * 1.5f + 15.0f;
  } 
  else if (theDb < -20.0) {
    percent = (theDb + 30.0f) * 2.0f + 30.0f;
  } 
  else if (theDb < 0.0) {
    percent = (theDb + 20.0f) * 2.5f + 50.0f;
  } 
  else {
    percent = 100.0f;
  }

  return percent / 100.0f;
}


float log10(float theB) {
  return (float)Math.log10(theB);
}

