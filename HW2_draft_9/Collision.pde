class Collision {

  PShape ShipOrBulletBox;//a
  PShape RockBox;//v

  boolean brCollision;
  boolean srCollision;
  boolean secondhit = false;

  void IsCollision(PVector rBoxPosition, PVector sObBoxPosition, int rDimensionX, int rDimensionY, int sObDimensionX, int sObDimensionY, int iE, int jB, Enemies enemy) {

    //making boxes
    stroke(color(255, 255, 255));

    rectMode(CENTER);
    ShipOrBulletBox = createShape(RECT, sObBoxPosition.x, sObBoxPosition.y, sObDimensionX, sObDimensionY);

    rectMode(CENTER);
    RockBox = createShape(RECT, rBoxPosition.x, rBoxPosition.y, rDimensionX, rDimensionY);


    //Are they colliding?!?!?
    if (sObBoxPosition.x-sObDimensionX/2 < rBoxPosition.x+rDimensionX/2 && sObBoxPosition.x+sObDimensionX/2 > rBoxPosition.x-rDimensionX/2 && sObBoxPosition.y-sObDimensionY/2 < rBoxPosition.y+rDimensionY/2 && sObBoxPosition.y+sObDimensionY/2 > rBoxPosition.y-rDimensionY/2) {

      if (sObDimensionX == 3) {
        brCollision = true;
      } else {
        srCollision = true;
      }
    }
    if (brCollision) {
      
      
      if(!enemy.lilRock){
      enemy = new Enemies(rBoxPosition.x+40, rBoxPosition.y+40, 45, true);
      eList.add(enemy);
      enemy = new Enemies(rBoxPosition.x-40, rBoxPosition.y-40, 225, true);
      eList.add(enemy);
      
      enemy.lilRock = true;
      }

      
      eList.remove(iE);
      
      bList.remove(jB);
      
      
      
      brCollision = false;
      //background(255,150,200);
    }
  }
}