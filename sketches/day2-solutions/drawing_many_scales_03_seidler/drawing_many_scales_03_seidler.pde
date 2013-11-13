/*
 * Drawing many very different scales.
 * Original by P. Seidler.
 */

PFont f;
import processing.pdf.*;

void setup() {
  //size (900, 600,PDF, "skalen.pdf");
  size (900, 600);
  
  //println(PFont.list());
  f = createFont("Futura-Medium", 24);
  textFont(f);
}

void draw() {
  background(255);

  int divisions = 50;
  int numberOfScales = 8;

  for (int i = 0; i < divisions; i++) {
    for (int j = 0; j < numberOfScales; j++) {
      float x = i * width / (divisions - 1);
      float y = j * height / (numberOfScales - 1);
      
      if (j == 5) {           // letzte Reihe
        line (0, y, width, y);

        if (i % 2 == 0) {       /// Modular Operation
          line (x, y, x, y+10);
        } 
        else if (i % 5 == 0) {
          line (x, y, x, y+20);

          fill(0, 0, 40);
          textSize(12);
          text(i, x, y-10);
        }
        else {
          line (x, y, x, y+5);
          //line (0, x, width,x);
        }
      }
      else if (j == 4) {          // sechste  Reihe
        line (0, y, width, y);
        if (i % 10 == 0) {       /// Modular Operation
          line (x, y, x, y+30);
          fill(0, 0, 40);
          textSize(12);
          text(i, x, y-10);
          //rect (0,y,in.left.get(b)*70,10);
        } 
        else if (i % 3 == 0) {
          line (x, y, x, y+10);
          fill(0, 0, 40);
          textSize(7);
          text(i, x, y-5);
        }
        else {
          line (x, y, x, y+5);
        }
      }
      else if (j == 3) {         // fünfte  Reihe
        line (0, y, width, y);
        if (i % 20 == 0) {       /// Modular Operation
          line (x, y, x, y+50);
        } 

        else {
          line (x, y, x, y+5);
          fill(0, 0, 40);
          textSize(6);
          text(i*2, x, y-5);
        }
      }
      else if (j == 2) {          // vierte Reihe
        line (0, y, width, y);
        if (i % 13 == 0) {       /// Modular Operation
          line (x, y, x, y+30);
          fill(0, 0, 40);
          textSize(13);
          text(i*50, x, y-5);
        } 
        else if (i % 4 == 0) {
          line (x, y, x, y+10);
        }
        else if (i % 9 == 0) {
          line (x, y, x, y+19);
          fill(0, 0, 40);
          textSize(9);
          text(i*50, x, y-20);
        }

        else {
        }
      }
      else if (j == 1) {                // dritte Reihe
        line (0, y, width, y); 
        if (i % 10 == 0) {              /// Modular Operation
          line (x, y, x, y+30);
        } 
        else if (i % 3 == 0) {
          line (x, y, x, y+10);
          fill(0, 0, 40);
          textSize(10);
          text(i*10, x, y-5);
        }
        else {
          line (x, y, x, y+5);
        }
      }
      else if (j == 0) {                 // zweite Reihe
        line (0, y, width, y);
        if (i % 6 == 0) {                /// Modular Operation
          line (x, y, x, y+8);
          line (x, y, x, y);
          fill(0, 0, 40);
          textSize(10);
        } 
        else if (i % 4 == 0) {
          line (x, y, x, y+10);
        }
        else {
          line (x, y, x, y+5);
        }
      }
      else {                               // erste Reihe
        line (0, y, width, y);
        if (i % 20 == 0) {                /// Modular Operation
          line (x, y, x, y + 30);
        } 
        else if (i % 10 == 0) {
          line (x, y, x, y + 10);
        } else {
          line (x, y, x, y+5);
        }
      }
    }
  }

  // exit();
}

