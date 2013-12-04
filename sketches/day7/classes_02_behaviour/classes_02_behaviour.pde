Circle circle;
Circle secondCircle;

void setup() {
  size(800, 600);

  circle = new Circle(width * 0.5 + 100, height * 0.5, 50);
  secondCircle = new Circle(width * 0.5 - 100, height * 0.5, 100);
}

void draw() {
  background(52);

  circle.draw();
  secondCircle.draw();
}

