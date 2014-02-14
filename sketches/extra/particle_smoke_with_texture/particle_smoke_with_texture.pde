PImage particleTexture;  
ArrayList<Particle> particles;

void setup() {
  size(800, 800, P2D);
  
  particleTexture = loadImage("sprite.png");    // try different textures!
 
  particles = new ArrayList<Particle>();   // list to store particles

  // In case you are using P3D (faster). Forces processing to draw a particle even if there is one already
  hint(DISABLE_DEPTH_MASK);
} 

void draw () {
  background(255);

  /* Update and draw particles */
  for (int i = 0; i < particles.size(); i++) {
    Particle particle = particles.get(i);

    particle.update();
    particle.draw();
  }
  
  /* Remove dead particles from the list */
  for (int i = particles.size() - 1; i > -1; i--) {   // backwards through the list, so we can remove things
    Particle particle = particles.get(i);
    
    if (particle.isDead()) {
       particles.remove(i); 
    }
  }
  
  /* Add new particles when the mouse is down */
  if (mousePressed) {
    Particle newParticle = new Particle(mouseX, mouseY, particleTexture);

    particles.add(newParticle);    
  }
  
  /* What's the framerate? */
  fill(0);
  textSize(10);
  text("FPS: " + int(frameRate), 10, 20);
}
