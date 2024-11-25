class Powerup {
  // Member Variables
  int x, y, diam, speed;
  char type;
  PImage pu1;
  PImage pu2;

  // Constructor
  Powerup() {
    x = int(random(width));
    y = -200;
    diam = int(random(45, 65));
    speed = int(random(1, 5));
    pu1 = loadImage("healthpowup.png");
    pu2 = loadImage("ammopowup.png");
    int rand = int(random(2));
    if (rand == 0) {
      type = 'h';
    } else if (rand == 1) {
      type = 'a';
    }
  }

  void display() {
    if (type == 'a') {
      pu1.resize (diam, diam);
      image (pu1, x, y);

      //fill(0, 222, 0);
    } else if (type =='h') {
      pu2.resize (diam, diam);
      image (pu2, x, y);
    }
    //fill(127);
    //ellipse(x, y, diam, diam);
  }

  void move() {
    y = y + speed;
  }

  boolean reachedBottom() {
    if (y > height + 200) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Spaceship s) {
    float d = dist(x, y, s.x, s.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
