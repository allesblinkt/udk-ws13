/*
 * Drawing many scales with a different number of ticks.
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
    float y = map(i, 0, (numberOfScales - 1), 0, height);
    line(0, y, width, y); 

    int ticks = scales[i]; 

    for (int j = 0; j < ticks; j++) {
      float x = map(j, 0, ticks - 1, 0, width); 

      if (j % 5 == 0) { 
        line(x, y, x, y + singleHeight);
      } else {
        line(x, y + 0.5 * singleHeight, x, y + singleHeight);
      }
    }
  }

  //exit();
}

