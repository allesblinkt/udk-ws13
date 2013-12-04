/**
 * Same as classes_03_many_on_click, but with arrays instead of 
 * ArrayLists.
 * 
 * This WILL crash with too many circles... 
 */


Circle circles[] = new Circle[20];
int circleIndex = 0;

void setup() {
  size(800, 600);

  Circle circle = new Circle(width * 0.5, height * 0.5, 100);
  circles[0] = circle;  
}

void draw() {
  background(52);

  for (int i = 0; i < circles.length; i++) {
    Circle circle = circles[i];
    
    if (circle != null) {
      circle.draw();
    }
  }
}

void mouseClicked() {
  circleIndex = circleIndex + 1;
  
  circles[circleIndex] = new Circle(mouseX, mouseY, 100);
}

