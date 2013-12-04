Circle circle;

void setup() {
  size(800, 600);

  circle = new Circle(width * 0.5, height * 0.5, 100);
}

void draw() {
  background(52);

  circle.draw();
}
