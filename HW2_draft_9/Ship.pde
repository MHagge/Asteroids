class Ship {

  PShape ship;
  PShape half1;
  PShape half2;

  PVector sPosition, sVelocity, sAcceleration, sDirection;
  float sSpeed, sMaxS;

  float colorChange;

  PVector getShipPosition() {
    return sPosition;
  }

  Ship(float x, float y) {
    //create custom PShape
    stroke(color(255, 255, 255));
    strokeWeight(2);
    fill(0);

    ship = createShape();
    ship.beginShape();

    ship.vertex(-20, -10);
    ship.vertex(20, 0);
    ship.vertex(-20, 10);
    ship.vertex(-10, 0);

    ship.endShape(CLOSE);

    //PShapes when ship is hit-----
    half1 = createShape();
    half1.beginShape();

    half1.vertex(-20, -10);
    half1.vertex(20, 0);
    half1.vertex(-10, 0);

    half1.endShape(CLOSE);
    //-----------------------------
    half2 = createShape();
    half2.beginShape();

    half2.vertex(-10, 0);    
    half2.vertex(20, 0);
    half2.vertex(-20, 10);

    half2.endShape(CLOSE);

    //Movement&Vectors==========================================
    sPosition = new PVector(x, y);
    sVelocity = new PVector(0, 0);
    sAcceleration = new PVector(0, 0);  
    sDirection = PVector.fromAngle(radians(270));

    sSpeed = 0.1;
    sMaxS = 3;
  }

  void sUpdate() {
    if (keyPressed && key == 'w') {    
      sAcceleration = PVector.mult(sDirection, sSpeed);
    } else {
      sVelocity.mult(.99);
    }
    //if left
    if (keyPressed && key == 'a') {
      sDirection.rotate(-0.09);
    }

    //if right
    if (keyPressed && key == 'd') {
      sDirection.rotate(0.09);
    }


    sVelocity.add(sAcceleration);
    sPosition.add(sVelocity);
    sVelocity.limit(sMaxS);
    //reset acceleration;
    sAcceleration.mult(0);



    //screen wrapping
    if (sPosition.x > width) {
      sPosition.x = 0-40;
    }
    if (sPosition.x < 0-40) {
      sPosition.x = 500;
    }

    if (sPosition.y > height) {
      sPosition.y = 0-20;
    }
    if (sPosition.y < 0-20) {
      sPosition.y = 500;
    }
  }
  void sUpdateBroken() {

    //sAcceleration = PVector.mult(sDirection, sSpeed);

    sVelocity.mult(.99);
    //sVelocity.add(sDirection);

    //sDirection.rotate(-0.02);

    // sDirection.rotate(0.05);


    sVelocity.add(sAcceleration);
    sPosition.add(sVelocity);
    sVelocity.limit(sMaxS);
    //reset acceleration;
    sAcceleration.mult(0);



    //screen wrapping
    if (sPosition.x > width) {
      sPosition.x = 0-40;
    }
    if (sPosition.x < 0-40) {
      sPosition.x = 500;
    }

    if (sPosition.y > height) {
      sPosition.y = 0-20;
    }
    if (sPosition.y < 0-20) {
      sPosition.y = 500;
    }
  }

  float v = 5;
  float a = 1;
  float t = 255;

  void display() {

    pushMatrix();
    translate(sPosition.x, sPosition.y);
    rotate(atan2(sDirection.y, sDirection.x));
    shape(ship);
    popMatrix();
  }

  void displayBroken() {

    half1.setStroke(color(255, 255, 255, t));
    half1.setFill(false);//;color(0, 0, 0, t));
    half2.setStroke(color(255, 255, 255, t));    
    half2.setFill(false);//color(0, 0, 0, t));
    
    pushMatrix();
    translate(sPosition.x-v, sPosition.y-v);
    rotate(atan2(sDirection.y, sDirection.x));
    shape(half1);
    popMatrix();

    pushMatrix();
    translate(sPosition.x+v, sPosition.y+v);
    rotate(atan2(sDirection.y, sDirection.x));
    shape(half2);
    popMatrix();

    v+=a;
    a= a*.95;
    t= t*.99;
    
    if(t < 10  ){
        exit();
    }
  }
}