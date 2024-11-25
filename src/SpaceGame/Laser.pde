class Laser {
  // Member Variables
  int x, y, w, h, speed;

  // Constructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 5;
    h = 10;
    speed = 10;
  }

  void display() {
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(x, y, w, h);
  }

  void move() {
    y = y - speed;
  }

  boolean reachedTop() {
    if (y<-20) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Rock r) {
    float d = dist(r.x, r.y, x, y);
    if (d< r.diam/2) {
      return true;
    } else {
      return false;
    }
  }
}
