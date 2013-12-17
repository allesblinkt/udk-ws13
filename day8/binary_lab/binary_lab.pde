/**
 * Experiment with binary operators...
 */

PFont font;

void setup() {
  size(1024, 500);

  font = loadFont("Futura-Medium-14.vlw");
}

void draw() {
  background(52);

  int digits = 8;    // max of 32 (32 bit standard integer)

  /* Calculate */
  int input = 255;
  int secondInput = unbinary("10101010");
  int output = input & secondInput;
  
  String operatorString = "&";    // just for display

  /* Display */
  drawBinary(input, digits, 100);

  fill(255);
  textAlign(CENTER);
  text(operatorString, 50, 190);
  
  drawBinary(secondInput, digits, 250);
  
  stroke(255);
  line(50, 320, width - 50, 320);

  drawBinary(output, digits, 350);
}


void drawBinary(int theValue, int theDigits, float theY) {
  pushMatrix();

  translate(0, theY);  // move down

  for (int i = 0; i < theDigits; i++) {
    int digit = (theValue >> i) & 1;

    float x = map(i, 0, theDigits - 1, width - 200, 60);

    noFill();
    stroke(255);

    rectMode(CENTER);
    rect(x, 0, 20, 20);

    fill(255);

    textFont(font);
    textAlign(CENTER);
    text(str(digit), x, 6);

    fill(128);
    text(str(int(pow(2, i))), x, 30);
  }

  fill(255);
  textAlign(LEFT);
  text("= " + theValue, width - 100, 6);

  popMatrix();
} 

