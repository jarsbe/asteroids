class Missle {
  PVector location;
  PVector velocity;
  float angle;
  
  Missle(Rocket rocket) { 
    location = rocket.location.copy();
    angle = rocket.trajectory;
  }
  
  void update() {
    velocity = PVector.fromAngle(angle);
    velocity.mult(10);
    location.add(velocity);
  }

  void render() {
    pushMatrix();
    fill(255);
    ellipse(location.x, location.y, 4, 4);
    popMatrix();
  }
  
  boolean hit(Asteroid a){
    PVector missleLocation = location.copy();
    PVector asteroidLocation = a.location.copy();
    float asteroidRadius = a.radius();
    
    float distanceFromAsteroid = missleLocation.dist(asteroidLocation);
      
    if (distanceFromAsteroid < asteroidRadius) {
      return true;
    } else {
      return false;
    }
  }
  
}
