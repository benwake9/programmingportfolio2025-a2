// Ben Wakefield | 6 Nov. 2024 | SpaceGame
import processing.sound.*;
SoundFile laser1;
int score, level, rockTime;
boolean play;
Spaceship s1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Powerup> powups = new ArrayList<Powerup>();
ArrayList<Star> stars = new ArrayList<Star>();
Timer rTime, puTime;

void setup() {
  size(800, 800);
  laser1 = new SoundFile(this, "laser1.wav");
  s1 = new Spaceship();
  rockTime = 1000;
  rTime = new Timer (rockTime);
  //rTime = new Timer(1000);
  rTime.start();
  puTime = new Timer(5000);
  puTime.start();
  level = 1;
  play = false;
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    if (frameCount % 100 == 0) {
      level = level + 1;
      rockTime-=50;
    }
    noCursor();

    background(0);
    stars.add(new Star());
    for (int i = 0; i<stars.size(); i++) {
      Star s = stars.get(i);
      s.display();
      s.move();
      if (s.reachedBottom()) {
        stars.remove(s);
      }
    }

    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (laser.intersect(r)) {
          rocks.remove(r);
          lasers.remove(laser);
          score += r.diam;
        }
      }
      laser.display();
      laser.move();
      if (laser.reachedTop()) {
        lasers.remove(laser);
      }
    }
    if (rTime.isFinished()) {
      rocks.add(new Rock());
      rTime.start();
    }
    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();
      if (s1.intersect(rock)) {
        s1.health -= rock.diam;
        rocks.remove(rock);
        score -= rock.diam;
      }
      if (rock.reachedBottom()) {
        rocks.remove(rock);
      }
    }
    if (puTime.isFinished()) {
      powups.add(new Powerup());
      puTime.start();
    }
    for (int i = 0; i < powups.size(); i++) {
      Powerup pu = powups.get(i);
      pu.display();
      pu.move();
      if (pu.intersect(s1)) {
        powups.remove(pu);
        if (pu.type == 'h') {
          s1.health += 5;
        } else if (pu.type == 'a') {
          s1.laserCount += 50;
        }
      }
      if (pu.reachedBottom()) {
        powups.remove(pu);
      }
    }
    s1.display();
    s1.move(mouseX, mouseY);
    infoPanel();
    if (s1.health < 1) {
      gameOver();
      noLoop();
      cursor();
    }
  }
}
void keyPressed() {
  if (key == ' ' && s1.fire()) {
    laser1.play();
    lasers.add(new Laser(s1.x, s1.y));
    s1.laserCount--;
  }
}

void infoPanel() {
  fill(127, 127);
  rectMode(CENTER);
  rect(width/2, 20, width, 40);
  fill(255);
  textSize(35);
  text("Score:" + score, 100, 35);
  text("Health:" + s1.health, 300, 35);
  text("Ammo:" + s1.laserCount, 500, 35);
  text("Level:" + level, 700, 35);
}

void startScreen() {
  background(0);
  fill(255);
  textSize (75);
  textAlign(CENTER);
  text("Welcome to SpaceGame", width/2, 300);
  text("Click to Start...", width/2, 500);
  if (mousePressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  fill(255);
  textSize (75);
  textAlign(CENTER);
  text("GAME OVER", width/2, 300);
  text("Score:" + score, width/2, 500);
  play = !true;
}

void ticker() {
}

void mousePressed() {
}
