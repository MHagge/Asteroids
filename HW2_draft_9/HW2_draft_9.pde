

Ship ship;

Bullets bullet;

Collision collision;

import ddf.minim.*;


AudioPlayer audio;
Minim minim;

ArrayList<Bullets> bList;
ArrayList<Enemies> eList;

boolean fired = false;
boolean alive = true;
int i;


void setup() {
  size(500, 500);
  
  minim = new Minim(this);
  audio = minim.loadFile("Nom.mp3", 2048);
  audio.loop();

  ship = new Ship(width/2, height/2);
  
    collision = new Collision();

  eList = new ArrayList<Enemies>();

  for (int i = 0; i<5; i++) {
    float x;
    float y;

    do {
      x = random(0, 500);
    } while (x>200 && x< 300);
    do {
      y = random(0, 500);
    } while (y>200 && y< 300);

    Enemies enemy = new Enemies(x, y, random(0, 360), false);
    eList.add(enemy);
  }





  bList = new ArrayList<Bullets>();
}


void draw() {
  background(0);
  //if(collision.brCollision){
  //background(255,50,50);
  //}

  for (int i = 0; i<eList.size(); i++) {
    eList.get(i).display();
    eList.get(i).rUpdate();
  }


  if (!collision.srCollision) {
    ship.sUpdate();
    ship.display();
  } else {
    ship.displayBroken();
    ship.sUpdateBroken();
  }

  //**************************************************************
  if (collision.brCollision) {
  }
  //**************************************************************

  //Add new bullet to ArrayList
  if ( keyPressed && key == ' ' && !collision.srCollision && (i+10)%10 == 0) {
    bullet = new Bullets(ship.sPosition, ship.sDirection);
    bList.add(bullet);

    fired = true;
  }
  if (fired) {
    for (int j = 0; j< bList.size(); j++) {

      bList.get(j).bUpdate();
      bList.get(j).display();
    }
  }

  if (bList.size() > 10) {
    bList.remove(0);
  }

  //check for ship/enemy collision
  for (int i = 0; i<eList.size(); i++) {
    collision.IsCollision(eList.get(i).rPosition, ship.sPosition, 40, 40, 40, 20, i, 0, eList.get(i));
  }
  if (fired) {
    for (int i = 0; i<eList.size(); i++) {
      for(int j = 0; j<bList.size(); j++){
        //println("");
        collision.IsCollision(eList.get(i).rPosition, bList.get(j).bPosition, 40, 40, 3, 3, i, j, eList.get(i));
        //println("");
        println(eList.size());
      }
    }
  }
  i++;
  if(i%5 ==0){
  //saveFrame("line-#######.png");
  }
}




//Still need to

//Make Enemies break up into smaller enemies
//Make Enemies look like they are being destroyed
//Comment
//Documantation