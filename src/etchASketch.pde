// Ben Wakefield | Etch A Sketch | 18 September 2024
int x, y;
void setup() {
  size(500, 500);
  background(127);
  x = width/2;
  y = height/2;
}

void draw() {
  if (keyPressed) {
    if (key == 'a' || key == 'A') {
      x = x-1;
    } else if (key == 's' || key == 'S') {
      y = y+1;
    } else if (key == 'w' || key == 'W') {
      y = y-1;
    } else if (key == 'd' || key == 'D') {
      x = x+1;
    } else if (key == 'c' || key == 'C') {
      background(127);
    }
  }
  strokeWeight(3);
  point(x, y);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      y = y-3;
    } else if (keyCode == DOWN) {
      y = y+3;
    } else if (keyCode == RIGHT) {
      x = x+3;
    } else if (keyCode == LEFT) {
      x = x-3;
    }
  }
}

void mousePressed() {
  saveFrame("line-######.png");
}
