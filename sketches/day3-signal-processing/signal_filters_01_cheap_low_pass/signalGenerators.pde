float sineWave(float time, float frequency) {
  return sin(time * TWO_PI * frequency); 
}


float triangleWave(float time, float frequency) {
  float period = (1.0 / frequency);
  return abs((time % period) - 0.5 * period) * frequency * 4.0 - 1.0;
}


float sawtoothWave(float time, float frequency) {
  float p = time * frequency;
  return (p % 1.0) * 2.0 - 1.0;
}


float squareWave(float time, float frequency) {  
  return signum(sin(time * TWO_PI * frequency));
}


float signum(float value) {
  if (value == 0.0) return 0;
  else if (value > 0.0) return 1;
  else return -1;
}
