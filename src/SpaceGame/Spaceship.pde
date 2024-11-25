class Spaceship {
  // Member Variables
  int x, y, w, health, laserCount, turretCount;
  PImage s1;
  // Constructor
  Spaceship () {
    x = width/2;
    y = height/2;
    w = 100;
    s1 = loadImage("spaceship1.png");
    health = 100;
    laserCount = 100;
  }

  void display() {
    imageMode(CENTER);
    s1.resize(100, 100);
    image(s1, x, y);
    //fill(80);
    //rectMode(CENTER);
    //rect(x+17, y+45, 10, 20);
    //rect(x-17, y+45, 10, 20);
    //fill(127);
    //triangle(x, y-40, x+35, y+40, x-35, y+40);
    //fill(80);
    //triangle(x, y-38, x+8, y-20, x-8, y-20);
    //ellipse(x, y+10, 20, 50);
    //stroke(220);
    //strokeWeight(2);
    //line(x+20, y-20, x+20, y+20);
    //line(x-20, y-20, x-20, y+20);
  }

  void move(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }

  boolean fire() {
    if (laserCount > 0) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock r) {
    float d = dist(r.x, r.y, x, y);
    if (d<45) {
      return true;
    } else {
      return false;
    }
  }
}
