class Button {
  // Member Variables
  float w, h, x, y;
  color c1, c2;
  String val;
  boolean on, isNum;

  // Constructor
  Button(int w, int h, float x, float y, color c1, String val, boolean isNum) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h= h;
    this.c1 = c1;
    c2 = color(80);
    this.val = val;
    on = false;
    this.isNum = isNum;
  }

  //Member Methods
  void display() {
    fill(c1);
    if (on) {
      fill(c2);
    }
    rectMode(CENTER);
    rect(x, y, w, h, 10);
    fill(0);
    textAlign(CENTER, CENTER);
    text(val, x, y);
  }

  boolean hover(int mx, int my) {
    if (mx > x-w/2 && mx < x+w/2 && my > y-h/2 && my < y+h/2) {
      on = true;
      return on;
    } else {
      on = false;
      return on;
    }
  }
}
