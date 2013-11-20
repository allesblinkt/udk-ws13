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


float iecDbScale(float db) {
  float percent = 0.0f;

  if (db < -70.0) {
    percent = 0.0f;
  } 
  else if (db < -60.0) {
    percent = (db + 70.0f) * 0.25f;
  } 
  else if (db < -50.0) {
    percent = (db + 60.0f) * 0.5f + 2.5f;
  } 
  else if (db < -40.0) {
    percent = (db + 50.0f) * 0.75f + 7.5f;
  } 
  else if (db < -30.0) {
    percent = (db + 40.0f) * 1.5f + 15.0f;
  } 
  else if (db < -20.0) {
    percent = (db + 30.0f) * 2.0f + 30.0f;
  } 
  else if (db < 0.0) {
    percent = (db + 20.0f) * 2.5f + 50.0f;
  } 
  else {
    percent = 100.0f;
  }

  return p / 100.0f;
}

