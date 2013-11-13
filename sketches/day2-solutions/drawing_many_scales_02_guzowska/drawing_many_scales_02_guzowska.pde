/*
 * Drawing many scales with a different number of ticks.
 * This time using a function and translate functions.
 * Original by K. Guzowska
 */

import processing.pdf.*;

int scales[] = {
  10, 12, 15, 18, 20, 25, 30, 45, 75, 50, 
  80, 90, 100, 95, 82, 70, 67, 54, 45, 34,
}; 

//int scales[] = {
// 10, 12, 15, 18, 20, 25, 30, 45, 75, 50, 
// 80, 90, 100, 95, 82, 70, 67, 54, 45, 34, 
// 25, 3, 50, 10, 100, 21, 20, 15, 18, 33
//};


void setup() {  
  size(400, 600); 
  //size(400, 600, PDF, "scales.pdf"); 

  smooth();
}

void draw() {
  background(255);
  stroke(0);

  int numberOfScales = scales.length;
  int singleHeight = height / (numberOfScales - 1);

  for (int i = 0; i < numberOfScales; i++) {
    pushMatrix();

    float y = map(i, 0, (numberOfScales - 1), 0, height);
    translate(0, y);  // move everything down

    int ticks = scales[i]; 

    drawScale(ticks, width, singleHeight);
    popMatrix();
  }

  //exit();
}


void drawScale(int theTicks, float theWidth, float theHeight) {
  for (int j = 0; j < theTicks; j++) {
    line(0, 0, theWidth, 0); 

    float x = map(j, 0, theTicks - 1, 0, theWidth); 

    if (j % 5 == 0) { 
      line(x, 0, x, theHeight);
    } 
    else {
      line(x, 0.5 * theHeight, x, theHeight);
    }
  }
}

