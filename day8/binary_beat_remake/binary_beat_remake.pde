/**
 * This sketch is a remake of Niklas Roy's little video 
 * "Binary Beat": 
 * http://www.niklasroy.com/project/159/MicroMonsterModular
 *
 * The Roland TR-909 drum machine samples are from:
 * http://cl516.blogspot.de/2009/04/free-tr-909-samples.html
 */

import ddf.minim.*;

Minim minim;
AudioSample[] samples;

int count = 0;

PFont font;

void setup() {
  size(500, 200);

  minim = new Minim(this);

  samples = new AudioSample[8];

  samples[0] = minim.loadSample("909hat2.wav", 512);
  samples[1] = minim.loadSample("909snare.wav", 512);
  samples[2] = minim.loadSample("909hat.wav", 512);
  samples[3] = minim.loadSample("909BD.wav", 512);
  samples[4] = minim.loadSample("909crash.wav", 512);
  samples[5] = minim.loadSample("909ltom.wav", 512);
  samples[6] = minim.loadSample("909clap.wav", 512);
  samples[7] = minim.loadSample("909ride.wav", 512);

  font = loadFont("Futura-Medium-14.vlw");
  
  frameRate(5);
}

void draw() {
  background(52);

  int prevCount = count;

  count++;

  for (int i = 0; i < samples.length; i++) {
    AudioSample sample = samples[i];

    int change = (count & ~prevCount) >> i;

    if (change == 1) {
      sample.trigger();
    }

    float x = map(i, 0, samples.length - 1, width - 30, 30);

    int digit = (count >> i) & 1;

    if (change == 1) {
      fill(128);
    }
    else {
      noFill();
      stroke(255);
    }

    rectMode(CENTER);
    rect(x, 50, 20, 20);

    fill(255);
    
    textFont(font);
    textAlign(CENTER);
    text(str(digit), x, 56);
    
    text(str(int(pow(2, i))), x, 80);
  }
}

