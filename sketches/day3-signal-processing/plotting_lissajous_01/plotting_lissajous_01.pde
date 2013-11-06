/** This sketch draws some simple lissajou figures. 
 * The X and Y frequencies are controlled by the mouse position. */

XyPlotter plotter;

void setup() {
  size(600, 600);

  plotter = new XyPlotter(300);
}


void draw() {
  background(255);

  float time = millis() / 1000.0;
  float frequencyX = map(mouseX, 0, width, 0.2, 1.0);
  float frequencyY = map(mouseY, 0, height, 0.2, 1.0);

  float valueX = sineWave(time, frequencyX);
  float valueY = sineWave(time, frequencyY);
  
  plotter.put(valueX, valueY);
  plotter.draw(0, 0, width, height);
}

