// Ben Wakefield | Timeline Project | 28 August 2024

void setup() {
  size(900, 400);
  background(127);
}

void draw() {
  background(127);
  drawRef();
  histEvent(100, 200, "Z3 - 1941", "Fully Automatic Digital Computer \n In 1941, Conrad Zuse created the worlds first working fully automatic digital computer in Germany.", true);
  histEvent(187, 300, "ABC - 1942", "Atanasoff-Berry Computer \n In 1942, John Atanasoff and Clifford Berry of Iowa State University created the first binary electronic digital calculating device.", false);
  histEvent(275, 200, "MB - 1948", "Manchester Baby \n In 1948 Frederic Willians, Tom Kilburn, and Geoff Tootill built the world's first fully electronic stored-program computer at the Victoria University of Manchester. \n It was intended to act as a testbed fir the first random-access digital storage device.", true);
  histEvent(362, 300, "MMk1 - 1949", "Manchester Mark 1 \n A year later, in 1949, developers at the University of Manchester created the Manchester Mark 1 and ran Mersenne primes for nine hours. \n It pioneered the inclusion of index registers which made it easier for programs to read.", false);
  histEvent(450, 200, "TC - 1953", "Transistor Computer \n In 1953, developers at the University of Manchester created the firs computer to use transistors instead of hte traditional vacuum tubes. \n transistors were much smaller and required less power than vacuum tubes.", true);
  histEvent(537, 300, "HC - 1955", "Harwell Cadet \n Built by the electronics division of the Atomic Energy Research Establishment at Harwell. \n The design featured a 64-kilobyte magnetic drum memory store with multiple moving heads that had been designed at the National Physical Laboratory, UK.", false);
  histEvent(625, 200, "MV 950 - 1956", "Metrovick 950 \n After the transistor computer was created in Manchester a local company created the first commercially available transistor computer", true);
  histEvent(712, 300, "IC - 1958", "The first working integrated circuits were invented by Jack Kilby at Texas Instruments and Robert Noyce at Fairchild Semiconductor.", false);
}


void drawRef() {
  // timeline format
  strokeWeight(3);
  stroke(50);
  line(100, 250, 800, 250);
  textSize(18);
  fill(0);
  text("1940", 80, 270);
  text("1960", 815, 270);

  // title text
  textAlign(CENTER);
  textSize(30);
  text("History of Computers", width/2, 60);
  textSize(20);
  text("by Ben Wakefield", width/2, 90);
}

void histEvent(int x, int y, String val, String detail, boolean top) {
  if (top) {
    line(x, y, x+20, y+50);
  } else {
    line(x, y, x+20, y-50);
  }
  fill(200);
  rect(x, y, 80, 20);
  rectMode(CENTER);
  fill(0);
  textSize(12);
  text(val, x, y+5);

  if (mouseX>x-40 && mouseX<x+40 && mouseY>y-10 && mouseY<y+10) {
    text(detail, width/2, 350);
  }
}
