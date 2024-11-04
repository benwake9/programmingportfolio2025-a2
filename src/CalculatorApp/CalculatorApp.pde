// Ben Wakefield | Calculator App | 30 Sept. 24
Button[] buttons = new Button[23];
String dVal = "0";
char op;
float l, r, result;
boolean left;

void setup() {
  size(315, 375);
  background(50);
  left = true;
  op = ' ';
  l = 0.0;
  r = 0.0;
  result = 0.0;
  buttons[0] = new Button(105, 45, 67.5, 337.5, color (#6D7076), "0", true);
  buttons[1] = new Button(45, 45, 37.5, 277.5, color (#6D7076), "1", true);
  buttons[2] = new Button(45, 45, 97.5, 277.5, color (#6D7076), "2", true);
  buttons[3] = new Button(45, 45, 157.5, 277.5, color (#6D7076), "3", true);
  buttons[4] = new Button(45, 45, 37.5, 217.5, color (#6D7076), "4", true);
  buttons[5] = new Button(45, 45, 97.5, 217.5, color (#6D7076), "5", true);
  buttons[6] = new Button(45, 45, 157.5, 217.5, color (#6D7076), "6", true);
  buttons[7] = new Button(45, 45, 37.5, 157.5, color (#6D7076), "7", true);
  buttons[8] = new Button(45, 45, 97.5, 157.5, color (#6D7076), "8", true);
  buttons[9] = new Button(45, 45, 157.5, 157.5, color (#6D7076), "9", true);
  buttons[10] = new Button(45, 45, 157.5, 337.5, color (#6D7076), ".", false);
  buttons[11] = new Button(45, 45, 217.5, 337.5, color (#4C619D), "-", false);
  buttons[12] = new Button(45, 105, 277.5, 307.5, color (#4C619D), "=", false);
  buttons[13] = new Button(45, 45, 217.5, 157.5, color (#4C619D), "÷", false);
  buttons[14] = new Button(45, 45, 217.5, 217.5, color (#4C619D), "x", false);
  buttons[15] = new Button(45, 45, 217.5, 277.5, color (#4C619D), "+", false);
  buttons[16] = new Button(45, 45, 277.5, 157.5, color (#E55C2E), "C", false);
  buttons[17] = new Button(45, 45, 277.5, 217.5, color (#4C619D), "±", false);
  buttons[18] = new Button(45, 45, 37.5, 97.5, color (#6D7076), "√", false);
  buttons[19] = new Button(45, 45, 97.5, 97.5, color (#6D7076), "x²", false);
  buttons[20] = new Button(45, 45, 157.5, 97.5, color (#6D7076), "π", false);
  buttons[21] = new Button(45, 45, 217.5, 97.5, color (#6D7076), "%", false);
  buttons[22]= new Button(45, 45, 277.5, 97.5, color (#6D7076), "←", false);
}

void draw() {
  background(50);
  println("Left:" + l + " Op:" + op + " Right:" + r + " Result:" + result);
  textSize(20);
  for (int i = 0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void mousePressed() {

  for (int i=0; i<buttons.length; i++) {
    if (buttons[i].on && buttons[i].isNum && left && dVal.length () <27) {
      if (dVal.equals("0")) {
        dVal = buttons[i].val;
        l = float(dVal);
      } else {
        dVal += buttons[i].val;
        l = float(dVal);
      }
    } else if (buttons[i].on && buttons[i].isNum && !left && dVal.length () <27) {
      if (dVal.equals("0")) {
        dVal = buttons[i].val;
        r = float(dVal);
      } else {
        dVal += buttons[i].val;
        r = float(dVal);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("+")) {
      dVal = "0";
      op = '+';
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("-")) {
      dVal = "0";
      op = '-';
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("x")) {
      dVal = "0";
      op = '*';
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("÷")) {
      dVal = "0";
      op = '/';
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("C")) {
      left = true;
      op = ' ';
      l = 0.0;
      r = 0.0;
      result = 0.0;
      dVal = "0";
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("=")) {
      performCalc();
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals(".")) {
      if (!dVal.contains(".")) {
        dVal += buttons[i].val;
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("%")) {
      if (left) {
        l = l * 0.01;
        dVal = str(l);
      } else {
        r = r * 0.01;
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("±")) {
      if (left) {
        l = l * -1;
        dVal = str(l);
      } else {
        r = r * -1;
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("←")) {
      handleEvent("←", false);
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("√")) {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("x²")) {
      if (left) {
        l = sq(l);
        dVal = str(l);
      } else {
        r = sq(r);
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("π")) {
      if (left) {
        l = (PI);
        dVal = str(l);
      } else {
        r = (PI);
        dVal = str(r);
      }
    }
  }
}
void updateDisplay() {
  rectMode(CENTER);
  fill(222);
  rect(width/2, 37.5, 285, 45);
  fill(0);
  if (dVal.length() <16) {
    textSize(35);
  } else if (dVal.length() < 23) {
    textSize(25);
  }
  textAlign(RIGHT);
  text(dVal, width-25, 47.5);
}

void performCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '*') {
    result = l * r;
  } else if (op == '/') {
    result = l / r;
  }
  dVal = str(result);
  l = result;
  r = 0.0;
  left = true;
}

void handleEvent(String keyVal, boolean isNum) {
  //handle numbers
  if (left && dVal.length() < 27 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  } else if (!left && dVal.length() < 27  && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    r = float(dVal);
  } else if (keyVal.equals("+") && !isNum) {
    left = false;
    dVal = "0";
    op = '+';
  } else if (keyVal.equals("-") && !isNum) {
    left = false;
    dVal = "0";
    op = '-';
  } else if (keyVal.equals("/") && !isNum) {
    left = false;
    dVal = "0";
    op = '/';
  } else if (keyVal.equals("*") && !isNum) {
    left = false;
    dVal = "0";
    op = '*';
  } else if (keyVal.contains(".") && !isNum) {
    dVal += keyVal;
  } else if (keyVal.equals("=") && !isNum) {
    performCalc();
  } else if (keyVal.equals("←") && !isNum) {
    if (left) {
      dVal = dVal.substring(0, dVal.length() -1);
      l = float(dVal);
    } else {
      dVal = dVal.substring(0, dVal.length() -1);
      r = float(dVal);
    }
  }
}
void keyPressed() {
  println("key:" + key);
  println("keycode:" + keyCode);
  if (key == 0 || keyCode == 96 || keyCode == 48) {
    handleEvent("0", true);
  } else if (key == 1 || keyCode == 97 || keyCode == 49) {
    handleEvent("1", true);
  } else if (key == 2 || keyCode == 98 || keyCode == 50) {
    handleEvent("2", true);
  } else if (key == 3 || keyCode == 99 || keyCode == 51) {
    handleEvent("3", true);
  } else if (key == 4 || keyCode == 100 || keyCode == 52) {
    handleEvent("4", true);
  } else if (key == 5 || keyCode == 101 || keyCode == 53) {
    handleEvent("5", true);
  } else if (key == 6 || keyCode == 102 || keyCode == 54) {
    handleEvent("6", true);
  } else if (key == 7 || keyCode == 103 || keyCode == 55) {
    handleEvent("7", true);
  } else if (key == 8 || keyCode == 104 || keyCode == 56) {
    handleEvent("8", true);
  } else if (key == 9 || keyCode == 105 || keyCode == 57) {
    handleEvent("9", true);
  } else if (key == '+' || keyCode == 107) {
    handleEvent("+", false);
  } else if (key == '-' || keyCode == 109) {
    handleEvent("-", false);
  } else if (key == '*' || keyCode == 106) {
    handleEvent("*", false);
  } else if (key == '/' || keyCode == 111) {
    handleEvent("/", false);
  } else if (key == '.' || keyCode == 110) {
    handleEvent(".", false);
  } else if (key == '=' || keyCode == 10) {
    handleEvent("=", false);
    //} else if (keyCode == 8) {
    //  handleEvent("←", false);
  }
}
