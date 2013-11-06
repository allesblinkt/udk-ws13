/** Takes two signals and displays them on plots.
  * Also mixes the signals and displays the result. */

SignalPlotter plotterA;
SignalPlotter plotterB;
SignalPlotter plotterMix;

void setup() {
  size(600, 300);
  frameRate(60);
  
  int resolution = 300;
  plotterA = new SignalPlotter(resolution); 
  plotterB = new SignalPlotter(resolution); 
  plotterMix = new SignalPlotter(resolution); 
  plotterMix.strokeColor = color(255, 69, 0);  // make the mix red
}

void draw() {
  background(23);
 
  float time = millis() / 1000.0;  // to seconds
  float valueA = squareWave(time, 8.0);
  float valueB = sineWave(time, 2.0);
  float valueMix = (valueA + valueB) * 0.5;

  plotterA.put(valueA);
  plotterB.put(valueB);
  plotterMix.put(valueMix);

  float thirdHeight = height / 3.0;
  plotterA.draw(0, 0, width, thirdHeight - 20);
  plotterB.draw(0, thirdHeight, width, thirdHeight - 20);
  plotterMix.draw(0, thirdHeight * 2.0, width, thirdHeight - 20);
}

