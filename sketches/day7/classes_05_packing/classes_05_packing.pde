/** 
 * Places a number of circles around a given center as closely as possible growing 
 * inside out 
 */

ArrayList<Circle> circles;

void setup() {
  size(800, 600);

  circles = new ArrayList<Circle>();

  for (int i = 0; i < 100; i++) {
    float x = random(width);
    float y = random(height);
    float diameter = map(i, 0, 99, 100, 10);

    Circle circle = new Circle(x, y, diameter);

    circles.add(circle);
  }
  
  
  distributeCircles(circles, new PVector(width * 0.5, height * 0.5), 10);
}

void distributeCircles(ArrayList<Circle> theCircles, PVector theCenter, float theMargin) { 
  /* Bail out */
  if (theCircles.size() == 0) {
     return;  
  }
  
  ArrayList<Circle> placedCircles = new ArrayList<Circle>();
  
  /* Find the smallest diameter to try with something sensible */
  float[] diameters = new float[theCircles.size()];
  
  for (int i = 0; i < circles.size(); i++) {
    Circle circle = circles.get(i);
    diameters[i] = circle.diameter;
  }
  
  float[] sortedDiamters = sort(diameters);
  float smallestDiameter = sortedDiamters[0] * 0.5; 

  /* Initial numbers */
  int thetaSteps = 111;
  float radiusIncrement = smallestDiameter * 0.1;
  
  float searchRadius = 0;
  
  /* Search */
  for (int i = 0; i < circles.size(); i++) {
    Circle circleToPlace = circles.get(i);

    boolean foundSpot = false;
    int tries = 0;

    /* Loop as long as we haven't found something */
    while (!foundSpot) {
      float theta = tries / float(thetaSteps) * TWO_PI;   // need to convert theta steps here from an int, otherwise the division would also be an int...
            
      float x = cos(theta) * searchRadius;
      float y = -sin(theta) * searchRadius;
      PVector newPosition = new PVector(x, y);
      newPosition.add(theCenter);

      boolean collides = false;   // true when there is a found collision

      for (int j = 0; j < placedCircles.size(); j++) {
        Circle existingCircle = placedCircles.get(j);

        float distance = existingCircle.position.dist(newPosition);
        float collisionDistance = (circleToPlace.diameter + existingCircle.diameter) * 0.5 + theMargin;        

        if (distance < collisionDistance) {   // collision. No need to look further
          collides = true;
          break;
        }
      }

      if (!collides) {   // we have found a place...
        circleToPlace.position.set(newPosition);
        placedCircles.add(circleToPlace);
        
        foundSpot = true;  // let's us escape
      } 
      else {
        tries++;
        
        if (tries % thetaSteps == 0) {   // increment the search radius
          searchRadius = searchRadius + radiusIncrement;
        }
      }
    }
  }    
}

void draw() {
  background(52);

  for (int i = 0; i < circles.size(); i++) {
    Circle circle = circles.get(i);
    circle.draw();
  }
}

