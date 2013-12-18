/**
 * Captures a portion of the screen and displays the image on a rotating quad...
 */


import java.awt.Robot;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;

Robot robot;


void setup() {
  size(500, 500, P3D);

  try {
    robot = new Robot();
  } 
  catch(Exception e) {
    die("Could not make a robot. " + e.toString());
  }
}


void draw() {
  background(52);

  /* Capture the screen */
  PImage screenCapture = captureScreen(200, 200, 300, 300);

  noStroke();

  //pushMatrix();

//  translate(width * 0.5, height * 0.5);
//  scale(200);
//  rotateY(millis() * 0.002);

  image(screenCapture, 0, 0);

//  beginShape();
//  texture(screenCapture);
//
//  textureMode(NORMAL);
//  vertex(-1, -1, 0, 0);
//  vertex(1, -1, 1, 0);
//  vertex(1, 1, 1, 1);
//  vertex(-1, 1, 0, 1);
//  endShape();
//  
//  popMatrix();  
}


PImage captureScreen(int theX, int theY, int theWidth, int theHeight) {
  Rectangle rect = new Rectangle(theX, theY, theWidth, theHeight);
  BufferedImage captureImg = robot.createScreenCapture(rect) ;

  PImage img = new PImage(captureImg);

  return img;
}

