class Particle {
  PVector position;
  PVector velocity;

  float maxSize = 200;
  float maxAge = 400;  // how long do we live (in frames)

  PImage texture;
  
  int age = 0;

  Particle(float theX, float theY, PImage theTexture) {
    position = new PVector(theX, theY);
    texture = theTexture;
    
    velocity = new PVector(random(-0.1, 0.1), -1.0);   // up and a little bit sideways
  }

  void update() {
    age = age + 1;
    
    position.add(velocity);
  }
  
  boolean isDead() {
     return age >= maxAge;  
  }

  void draw() {
    float size = map(age, 0.0, maxAge, maxSize * 0.25, maxSize);  // Particles get bigger
    float opacity = map(age, 0.0, maxAge, 128.0, 0.0); 
    
    tint(255, opacity);
    imageMode(CENTER);
    image(texture, position.x, position.y, size, size);
  }

}

