class Bullets {

  PShape bullet;
  PVector bPosition, bVelocity, bAcceleration, bDirection;
  float bSpeed, bMaxS;

  Bullets(PVector sPosition, PVector sDirection) {
    
    fill(255,255,255);
    bullet = createShape(ELLIPSE,0,0,3,3);
    

    bPosition = new PVector(sPosition.x, sPosition.y);
    bVelocity = new PVector(0, 0);
    bAcceleration = new PVector(0, .1);  
    bDirection = new PVector(sDirection.x, sDirection.y);//PVector.fromAngle(radians(0));
    
    bSpeed = 0.5;
    bMaxS = 4;
  }
  
  void bUpdate() {
    bAcceleration = PVector.mult(bDirection, bSpeed);
    bVelocity.add(bAcceleration);
    bVelocity.limit(bMaxS);
    bPosition.add(bVelocity);
    //reset acceleration;
    bAcceleration.set(0,0);
  }
  
  void display() {
    pushMatrix();
    translate(bPosition.x, bPosition.y);
    shape(bullet);
    popMatrix();
    
    //println("bullet x = " + bPosition.x);
  }
}