/*
 * Drawing many very different scales.
 * Modified with classes.
 * Original by P. Seidler.
 */

import processing.pdf.*;

PFont font;

ArrayList<Scale> scales;
int numberOfScales = 10;


void setup() {
  //size (900, 600,PDF, "skalen.pdf");
  size (900, 600);

  //println(PFont.list());
  font = createFont("Futura-Medium", 24);
  textFont(font);

  scales = new ArrayList<Scale>();

  for (int i = 0; i < numberOfScales; i++) {
    float y = map(i, 0, numberOfScales, 0, height);
    float singleHeight = height / float(numberOfScales);

    Scale scale = new Scale(0, y, width);
    
    scale.divisions = int(random(10, 1000));
    
    scale.smallTickEvery = int(random(1, 3));
    scale.mediumTickEvery = int(random(4, 10));
    scale.bigTickEvery = int(random(10, 40));

    scale.tickHeight = singleHeight * random(0.1, 0.25);

    scale.mediumTickScale = random(1.0, 2.0);
    scale.bigTickScale = random(1.0, 4.0);

    scales.add(scale);
  }
}


void draw() {
  background(255);

  for (int i = 0; i < scales.size(); i++) {
    Scale scale = scales.get(i);

    scale.draw();
  }
}

