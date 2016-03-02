class Enemies {

  PShape rock;

  PVector rPosition, rVelocity, rAcceleration, rDirection;
  float rSpeed, rMaxS;

  boolean lilRock = false; 

  PVector getEnemyPosition() {
    return rPosition;
  }

  Enemies(float x, float y, float r, boolean lilrock) {
    //bool is true when making tiny rock
    lilRock = lilrock;

    //create custom PShape    
    stroke(color(255, 255, 255));
    strokeWeight(2);
    fill(0);

    rock = createShape();
    rock.beginShape();


    rock.vertex(random(-6, 6), random(12, 20));////1
    rock.vertex(random(8, 20), random(2, 8));////2
    rock.vertex(random(8, 20), random(-8, -2));////3
    rock.vertex(random(-6, 6), random(-20, -12));////4
    rock.vertex(random(-20, -8), random(-2, -8));/////5
    rock.vertex(random(-20, -8), random(2, 8));////6

    rock.endShape(CLOSE);

    //translate to random spot on screen(500,500)
    pushMatrix();
    translate(x, y);
    shape(rock);
    popMatrix();

    //????????????????????????????????????????????????????????????????
    if (collision.brCollision) {
      pushMatrix();
      scale(.2);
      shape(rock);
      popMatrix();
      //lilRock = false;
    }

    //Movement&Vectors
    rPosition = new PVector(x, y);
    rVelocity = new PVector(0, 0);
    rAcceleration = new PVector(0, .1);  
    //rDirection = PVector.fromAngle(radians(r));
    rDirection = PVector.sub(ship.sPosition, rPosition);

    rSpeed = 0.5;
    rMaxS = .5;
  }

  void rUpdate() {

    rAcceleration = PVector.mult(rDirection, rSpeed);
    rVelocity.add(rAcceleration);
    rVelocity.limit(rMaxS);
    rPosition.add(rVelocity);
    //reset acceleration;
    rAcceleration.set(0, 0);

    //screen wrapping
    if (rPosition.x > width) {
      rPosition.x = 0-50;
    }
    if (rPosition.x < 0-50) {
      rPosition.x = 500;
    }

    if (rPosition.y > height) {
      rPosition.y = 0-50;
    }
    if (rPosition.y < 0-50) {
      rPosition.y = 500;
    }
  }

  void display() {
    
    //println(lilRock);
    
    pushMatrix();
    translate(rPosition.x, rPosition.y);
    if(lilRock){
    scale(.5);
    }
    shape(rock);
    popMatrix();
    
        //????????????????????????????????????????????????????????????????
    //if (collision.brCollision) {
    //  pushMatrix();
    //  scale(.2);
    //  shape(rock);
    //  popMatrix();
    //  //lilRock = false;
    //}
  }
}