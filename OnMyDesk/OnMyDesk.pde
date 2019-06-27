int dx[] = {10, -10, 0, 0}; // speed, original=10
int dy[] = {0, 0, 10, -10};
int dx_eye[] = {0, 0, 10, 10};
int dy_eye[] = {10, 10, 0, 0};
int x_center = 600, y_center = 400;
int x_min = -1200;
int x_max = 1200;
int y_min = -800;
int y_max = 800;
int dir = 3;
int get = 0;
int eyes_blink = 0;
int total_things = 13;
int speedUp = 1; // for fever time
int feverGauge = 0;
int feverTime = 300;
int minimap_time = 180;
boolean is_complete = false;
boolean is_mouse_on_help = false;
boolean is_mouse_on_map = false;

// Variables for macBook
int macBookX, macBookY;
int macBookOriX = 600, macBookOriY = 100;
float macBook = PI/3;
boolean macBook_organized = false;

// Variables for iPad
int iPadX, iPadY;
int iPadOriX = 780, iPadOriY = 600;
float iPad = -PI/3;
boolean iPad_organized = false;

// Variables for apple pencil
int apX, apY;
int apOriX = 930, apOriY = 600;
float ap = -PI/6;
boolean ap_organized = false;

// Variables for iPhone
int iPhoneX, iPhoneY;
int iPhoneOriX = 1550, iPhoneOriY = 550;
float iPhone = PI/2.4;
boolean iPhone_organized = false;

// Variables for magic mouse
int mmX, mmY;
int mmOriX = 1050, mmOriY = 220;
float mm = -PI/12.7;
boolean mm_organized = false;

// Variables for book
int bookX, bookY;
int bookOriX = 320, bookOriY = 440;
float book = PI/9;
boolean book_organized = false;

// Variables for pencil
int pencilX, pencilY;
int pencilOriX = 1330, pencilOriY = 600;
float pencil = PI/1.7;
boolean pencil_organized = false;

// Variables for sharp pencil
int spX, spY;
int spOriX = 1370, spOriY = 600;
float sp = PI/2.1;
boolean sp_organized = false;

// Variables for eraser
int eraserX, eraserY;
int eraserOriX = 1410, eraserOriY = 600;
float eraser = PI/2.1;
boolean eraser_organized = false;

// Variables for notebook
int nbX, nbY;
int nbOriX = 1150, nbOriY = 600;
float nb = -PI/12.7;
boolean nb_organized = false;

// Variables for airPod
int airPodX, airPodY;
int airPodOriX = 1050,airPodOriY = 0;
float airPod = -PI/3;
boolean airPod_organized = false;
int cnt_piece = 0;
int leftX, leftY, rightX, rightY;
float left = PI/2.7, right = -PI/3.3;
boolean find_left = false, find_right = false;

PFont coor, notebook, jam, jam2;
PImage logo, logo2, book_processing;

float euclid(float x1, float y1, float x2, float y2) {
  return sqrt(pow(abs(x1-x2), 2) + pow(abs(y1-y2), 2));
}

void setup() {
  size(1200, 800); // max : (-1200~1200, -800~800)
  smooth();
  rectMode(CENTER); // CENTER(x, y);
  strokeJoin(ROUND);
  coor = loadFont("ArialRoundedMTBold-48.vlw");
  notebook = loadFont("AmericanTypewriter-Bold-20.vlw");
  jam = loadFont("Avenir-Heavy-14.vlw");
  jam2 = loadFont("Avenir-Heavy-9.vlw");
  logo = loadImage("logo.png");
  logo2 = loadImage("logo2.png");
  book_processing = loadImage("book.png");
  
  // get random locations
  macBookX = (int)random(2400)-600; // - base : (600, 400)
  macBookY = (int)random(1600)-400; // (-600 ~ 1800, -400, 1200)

  iPadX = (int)random(2400)-600;
  iPadY = (int)random(1600)-400;
  
  apX = (int)random(2400)-600;
  apY = (int)random(1600)-400;
  
  iPhoneX = (int)random(2400)-600;
  iPhoneY = (int)random(1600)-400;
  
  mmX = (int)random(2400)-600;
  mmY = (int)random(1600)-400;
  
  bookX = (int)random(2400)-600;
  bookY = (int)random(1600)-400;
  
  pencilX = (int)random(2400)-600;
  pencilY = (int)random(1600)-400;
  
  spX = (int)random(2400)-600;
  spY = (int)random(1600)-400;
  
  eraserX = (int)random(2400)-600;
  eraserY = (int)random(1600)-400;
  
  nbX = (int)random(2400)-600;
  nbY = (int)random(1600)-400;
  
  airPodX = (int)random(2400)-600;
  airPodY = (int)random(1600)-400;
  
  leftX = (int)random(2400)-600;
  leftY = (int)random(1600)-400;
  
  rightX = (int)random(2400)-600;
  rightY = (int)random(1600)-400;
}

void draw() {
  // desk
  strokeWeight(60);
  fill(0);
  rect(600-x_center, 400-y_center, 9000, 6000);
  stroke(220); // socket's line's end
  strokeWeight(7); // socket's line's end
  line(85-x_center, -441-y_center, 130-x_center, -435-y_center); // socket's line's end
  fill(204, 153, 102);
  stroke(153, 102, 51);
  strokeWeight(75);
  rect(600-x_center, 400-y_center, 2400, 1600);
  strokeWeight(60);
  stroke(204, 153, 102);
  rect(600-x_center, 400-y_center, 2400, 1600); // base : (600, 400)
  
  // socket
  stroke(220); // for line
  strokeWeight(7);
  line(60-x_center, -280-y_center, 10-x_center, -300-y_center);
  line(10-x_center, -300-y_center, -x_center, -305-y_center);
  line(-x_center, -305-y_center, -20-x_center, -320-y_center);
  line(-20-x_center, -320-y_center, -30-x_center, -335-y_center);
  line(-30-x_center, -335-y_center, -40-x_center, -360-y_center);
  line(-40-x_center, -360-y_center, -40-x_center, -365-y_center);
  line(-40-x_center, -365-y_center, -40-x_center, -380-y_center);
  line(-40-x_center, -380-y_center, -37-x_center, -390-y_center);
  line(-37-x_center, -390-y_center, -34-x_center, -400-y_center);
  line(-34-x_center, -400-y_center, -30-x_center, -410-y_center);
  line(-30-x_center, -410-y_center, -25-x_center, -415-y_center);
  line(-25-x_center, -415-y_center, -17-x_center, -420-y_center);
  line(-17-x_center, -420-y_center, -9-x_center, -425-y_center);
  line(-9-x_center, -425-y_center, 8-x_center, -429-y_center);
  line(8-x_center, -429-y_center, 30-x_center, -433-y_center);
  line(30-x_center, -433-y_center, 60-x_center, -437-y_center);
  line(60-x_center, -437-y_center, 80-x_center, -440-y_center);
  line(80-x_center, -440-y_center, 85-x_center, -442-y_center);
  fill(0); // cover
  noStroke(); // cover
  rect(85-x_center, -447-y_center, 30, 10); // cover
  stroke(1); // for body
  strokeWeight(1);
  for(int j=0; j<10; ++j) {
      ellipse(140-j*10+4-x_center, -300+4*3-y_center, 65, 65);
  }
  noStroke();
  fill(200);
  for(int i=0; i<5; ++i) {
    for(int j=0; j<10; ++j) {
      ellipse(140-j*10+i-x_center, -300+i*3-y_center, 65, 65);
    }
  }
  fill(230);
  for(int i=0; i<10; ++i) {
    ellipse(140-i*10-x_center, -300-y_center, 65, 65);
  }
  stroke(1);
  strokeWeight(1);
  fill(200);
  ellipse(140-x_center, -300-y_center, 35, 35);
  ellipse(95-x_center, -300-y_center, 35, 35);
  ellipse(50-x_center, -300-y_center, 35, 35);
  
  // recharger
  stroke(0);
  strokeWeight(30);
  fill(0);
  rect(50-x_center, -295-y_center, 11, 23);
  strokeWeight(5);
  line(50-x_center, -270-y_center, 47-x_center, -240-y_center);
  line(47-x_center, -240-y_center, 42-x_center, -210-y_center);
  line(42-x_center, -210-y_center, 34-x_center, -180-y_center);
  line(34-x_center, -180-y_center, 24-x_center, -150-y_center);
  line(24-x_center, -150-y_center, 20-x_center, -120-y_center);
  line(20-x_center, -120-y_center, 18-x_center, -90-y_center);
  line(18-x_center, -90-y_center, 18-x_center, 130-y_center);
  strokeWeight(103);
  stroke(0);
  rect(18-x_center, 150-y_center, 30, 30);
  strokeWeight(100);
  stroke(51);
  rect(18-x_center, 150-y_center, 30, 30);
  strokeWeight(7);
  stroke(0);
  fill(51);
  ellipse(18-x_center, 150-y_center, 80, 80);
  strokeWeight(6); // for light
  if (eyes_blink < 10) {
    stroke(153, 150);
  } else {
    stroke(51, 255, 51);
  }
  line(65-x_center, 197-y_center, 68-x_center, 200-y_center);
  fill(153); // for letters
  textFont(jam);
  text("JAM", 5-x_center, 210-y_center);
  if(euclid(width/2, height/2, 18-x_center, 150-y_center) < 130) { // for fever time
    feverGauge++;
  }
  else {
    feverGauge = 0;
  }
  if(feverGauge == 50) {
    feverGauge = 0;
    feverTime = 0;
  }
  if(feverTime == 300) {
    speedUp = 1;
  }
  else {
    feverTime++;
    speedUp = 3;
  }
  
  // macBook
  pushMatrix();
  if (!macBook_organized && euclid(width/2, height/2, macBookX-x_center, macBookY-y_center) < 160) {
    macBook_organized = true;
    macBookX = macBookOriX;
    macBookY = macBookOriY;
    get++;
  }
  translate(macBookX-x_center, macBookY-y_center);
  rotate(macBook);
  if (macBook_organized) {
    rotate(-macBook);
  }
  fill(0);
  stroke(0);
  strokeWeight(18);
  rect(0, 0, 600, 400);
  fill(102, 102, 102);
  stroke(102, 102, 102);
  strokeWeight(15);
  rect(0, 0, 600, 400);
  image(logo, -30, -30, 65, 76);
  popMatrix();

  // iPad
  pushMatrix();
  if (!iPad_organized && euclid(width/2, height/2, iPadX-x_center, iPadY-y_center) < 100) {
    iPad_organized = true;
    iPadX = iPadOriX;
    iPadY = iPadOriY;
    get++;
  }
  translate(iPadX-x_center, iPadY-y_center);
  rotate(iPad);
  if (iPad_organized) {
    rotate(-iPad);
  }
  stroke(0); // for outline
  strokeWeight(23); // for outline
  rect(0, 0, 200, 280); // for outline
  stroke(204, 204, 204); // for midline
  strokeWeight(22); // for midline
  rect(0, 0, 200, 280); // for midline
  fill(255); // for inline
  stroke(255); // for inline
  strokeWeight(15); // for inline
  rect(0, 0, 200, 280); // for inline
  noStroke(); // for display
  fill(51, 51, 51); // for display
  rect(0, -4, 205, 252); // for display
  fill(0); // for camera
  ellipse(0, -138, 5, 5); // for camera
  fill(153, 153, 153); // for button
  ellipse(0, 135, 16, 16); // for button
  fill(255); // for button
  ellipse(0, 135, 14, 14); // for button
  popMatrix();
  
  // book
  pushMatrix();
  if (!book_organized && euclid(width/2, height/2, bookX-x_center, bookY-y_center) < 220) {
    book_organized = true;
    bookX = bookOriX;
    bookY = bookOriY;
    get++;
  }
  translate(bookX-x_center, bookY-y_center);
  rotate(book);
  if (book_organized) {
    rotate(-book);
  }
  rectMode(CORNER); // push mode
  fill(130);
  for(int i=1; i<10; ++i)
    rect(i, i*2, 240, 320);
  rectMode(CENTER); // pop mode
  image(book_processing, 0, 0, 240, 320);
  popMatrix();
  
  // iPhone
  pushMatrix();
  if (!iPhone_organized && euclid(width/2, height/2, iPhoneX-x_center, iPhoneY-y_center) < 100) {
    iPhone_organized = true;
    iPhoneX = iPhoneOriX;
    iPhoneY = iPhoneOriY;
    get++;
  }
  translate(iPhoneX-x_center, iPhoneY-y_center);
  rotate(iPhone);
  if (iPhone_organized) {
    rotate(-iPhone);
  }
  stroke(0); // for outline
  strokeWeight(11.5); // for outline
  rect(0, 0, 49, 105); // for outline
  stroke(204, 204, 204); // for midline
  strokeWeight(11); // for midline
  rect(0, 0, 49, 105); // for midline
  stroke(30, 30, 30); // for display
  strokeWeight(8); // for display
  fill(30, 30, 30); // for display
  rect(0, 0, 49, 105); // for display
  fill(153, 153, 153); // for button
  noStroke(); // for button
  ellipse(0, 48, 11, 11); // for button
  fill(30, 30, 30); // for button
  ellipse(0, 48, 10, 10); // for button
  stroke(102, 102, 102); // for ear
  strokeWeight(2); // for ear
  line(-3, -51, 3, -51); // for ear
  popMatrix();
  
  // magic mouse
  pushMatrix();
  if (!mm_organized && euclid(width/2, height/2, mmX-x_center, mmY-y_center) < 100) {
    mm_organized = true;
    mmX = mmOriX;
    mmY = mmOriY;
    get++;
  }
  translate(mmX-x_center, mmY-y_center);
  rotate(mm);
  if (mm_organized) {
    rotate(-mm);
  }
  stroke(204, 204, 204); // for outline
  fill(204, 204, 204); // for outline
  strokeWeight(35); // for outline
  rect(0, 0, 6, 35); // for outline
  stroke(230, 230, 230); // for mid body
  fill(230, 230, 230); // for mid body
  strokeWeight(30); // for mid body
  rect(0, 0, 6, 35); // for mid body
  stroke(235); // for body
  fill(235); // for body
  strokeWeight(25); // for body
  rect(0, 0, 6, 35); // for body
  image(logo2, -5.3, 8, 12, 14); // for logo
  popMatrix();
  
  // apple pencil
  pushMatrix();
  if (!ap_organized && euclid(width/2, height/2, apX-x_center, apY-y_center) < 105) {
    ap_organized = true;
    apX = apOriX;
    apY = apOriY;
    get++;
  }
  translate(apX-x_center, apY-y_center);
  rotate(ap);
  if (ap_organized) {
    rotate(-ap);
  }
  stroke(0); // for outline
  strokeWeight(10); // for outline
  line(0, -80, 0, 60); // for outline
  stroke(255); // for body
  strokeWeight(9); // for body
  line(0, -80, 0, 60); // for body
  stroke(0); // for pen
  strokeWeight(4.3); // for pen
  triangle(0.5, 81, -2.7, 61, 3.7, 61); // for pen
  fill(255); // for pen
  stroke(255); // for pen
  strokeWeight(3); // for pen
  triangle(0.5, 81, -2.7, 61, 3.7, 61); // for pen
  noStroke(); // for covering
  fill(255); // for covering
  ellipse(0.5, 60, 9, 9); // for covering
  strokeWeight(1); // for end-line
  stroke(0); // for end-line
  line(-3, 72, 3, 72); // for end-line
  stroke(0); // for lid
  strokeWeight(1); // for lid
  fill(204, 204, 204); // for lid
  rect(0.47, -65, 9.3, 6.5); // for lid
  popMatrix();
  
  // pencil
  pushMatrix();
  if (!pencil_organized && euclid(width/2, height/2, pencilX-x_center, pencilY-y_center) < 105) {
    pencil_organized = true;
    pencilX = pencilOriX;
    pencilY = pencilOriY;
    get++;
  }
  translate(pencilX-x_center, pencilY-y_center);
  rotate(pencil);
  if (pencil_organized) {
    rotate(-pencil);
  }
  stroke(0); // for outline
  strokeWeight(10); // for outline
  line(0, -50, 0, 60); // for outline
  stroke(0); // for pen
  strokeWeight(4.3); // for pen
  triangle(0.5, 76, -2.7, 61, 3.7, 61); // for pen
  fill(255, 204, 153); // for pen
  stroke(255, 204, 153); // for pen
  strokeWeight(3); // for pen
  triangle(0.5, 76, -2.7, 61, 3.7, 61); // for pen
  stroke(255, 153, 0); // for body
  strokeWeight(9); // for body
  line(0, -50, 0, 60); // for body
  noStroke(); // for point
  fill(51, 51, 51); // for point
  triangle(-1.6, 75, 2.2, 75, 0.5, 82); // for point
  stroke(0); // for eraser
  strokeWeight(10); // for eraser
  line(0, -50, 0, -66); // for eraser
  stroke(255, 102, 51); // for eraser
  strokeWeight(9); // for eraser
  line(0, -50, 0, -66); // for eraser
  stroke(0); // for lid
  strokeWeight(1); // for lid
  fill(71, 71, 71); // for lid
  rect(0.47, -52, 9.3, 14.5); // for lid
  popMatrix();
  
  // sharp pencil
  pushMatrix();
  if (!sp_organized && euclid(width/2, height/2, spX-x_center, spY-y_center) < 105) {
    sp_organized = true;
    spX = spOriX;
    spY = spOriY;
    get++;
  }
  translate(spX-x_center, spY-y_center);
  rotate(sp);
  if (sp_organized) {
    rotate(-sp);
  }
  stroke(0); // for outline
  strokeWeight(10); // for outline
  line(0, -50, 0, 60); // for outline
  stroke(0); // for pen
  strokeWeight(4.3); // for pen
  triangle(0.5, 76, -2.7, 61, 3.7, 61); // for pen
  fill(222, 222, 222); // for pen
  stroke(222, 222, 222); // for pen
  strokeWeight(3); // for pen
  triangle(0.5, 76, -2.7, 61, 3.7, 61); // for pen
  stroke(51, 51, 51); // for body
  strokeWeight(9); // for body
  line(0, -50, 0, 60); // for body
  noStroke(); // for point
  fill(222, 222, 222); // for point
  triangle(-1.6, 75, 2.2, 75, 0.5, 83); // for point
  strokeWeight(1); // for point-end
  stroke(0); // for point-end
  line(0.5, 79, 0.5, 84); // for point-end
  stroke(0); // for lid
  strokeWeight(5.5); // for lid
  rect(0, -58, 3, 10); // for lid
  stroke(222, 222, 222); // for lid
  strokeWeight(4.5); // for lid
  rect(0, -58, 3, 10); // for lid
  noStroke(); // for side
  rect(0.5, -39, 10, 6); // for side
  stroke(0);
  strokeWeight(4);
  line(-3.5, -43, -3.5, -10);
  stroke(222, 222, 222);
  strokeWeight(3);
  line(-3.5, -43, -3.5, -10);
  popMatrix();
  
  // eraser
  pushMatrix();
  if (!eraser_organized && euclid(width/2, height/2, eraserX-x_center, eraserY-y_center) < 75) {
    eraser_organized = true;
    eraserX = eraserOriX;
    eraserY = eraserOriY;
    get++;
  }
  translate(eraserX-x_center, eraserY-y_center);
  rotate(eraser);
  if (eraser_organized) {
    rotate(-eraser);
  }
  stroke(235, 235, 235);
  strokeWeight(8);
  fill(235, 235, 235);
  rect(0, 0, 12, 20);
  stroke(0, 0, 210);
  strokeWeight(2);
  fill(0, 0, 210);
  rect(0, 11, 18, 25);
  strokeWeight(1);
  stroke(202, 202, 202);
  line(-5, -3, -5, 24);
  
  pushMatrix(); // for letters
  textFont(jam2);
  rotate(PI/2);
  fill(255);
  text("JAM", 1, 2);
  popMatrix();
  
  popMatrix();
  
  // notebook
  pushMatrix();
  if (!nb_organized && euclid(width/2, height/2, nbX-x_center, nbY-y_center) < 75) {
    nb_organized = true;
    nbX = nbOriX;
    nbY = nbOriY;
    get++;
  }
  translate(nbX-x_center, nbY-y_center);
  rotate(nb);
  if (nb_organized) {
    rotate(-nb);
  }
  stroke(255, 255, 204); // for pages
  fill(255, 255, 204);
  strokeWeight(2); // for pages
  for(int i=0; i<5; ++i) { // for pages
    rect(i, i*2, 200, 280);
  }
  stroke(153, 0, 0); // for book cover
  fill(153, 0, 0); // for book cover
  rect(0, 0, 200, 280); // for book cover
  fill(255); // for "NOTEBOOK"
  textFont(notebook); // for "NOTEBOOK"
  text("NOTEBOOK", -80, -50); // for "NOTEBOOK"
  stroke(255);
  strokeWeight(1);
  line(-80, -48, 40, -48);
  for(int i=0; i<6; ++i) {
    line(-70, -30 + i*10, 0, -30 + i*10);
  }
  fill(51);
  textFont(jam);
  textSize(20);
  text("CS 201311154", -88, -117);
  popMatrix();
  
  // airPod
  pushMatrix();
  if (!airPod_organized && euclid(width/2, height/2, airPodX-x_center, airPodY-y_center) < 75) {
    airPod_organized = true;
    airPodX = airPodOriX;
    airPodY = airPodOriY;
    get++;
  }
  translate(airPodX-x_center, airPodY-y_center);
  rotate(airPod);
  if (airPod_organized) {
    rotate(-airPod);
  }
  stroke(214, 214, 214); // for outline
  strokeWeight(20); // for outline
  fill(214, 214, 214); // for outline
  rect(0, 0, 15, 21); // for outline
  stroke(235, 235, 235); // for body
  strokeWeight(16); // for body
  fill(235, 235, 235); // for body
  rect(0, 0, 15, 21); // for body
  stroke(170); // for gap
  strokeWeight(1); // for gap
  line(-16.5, -7, 15.5, -7); // for gap
  noStroke();  // for light
  if (eyes_blink < 10) { // for light
    fill(214);
  } else {
    fill(0, 255, 0, 150); // for light
  }
  ellipse(0, -1.5, 3, 3);  // for light
  popMatrix();
  if(!find_left) { // for left
    pushMatrix();
    translate(leftX-x_center, leftY-y_center);
    rotate(left);
    stroke(212); // for outline
    strokeWeight(10);
    fill(212);
    ellipse(0, 0, 10, 8);
    stroke(102); // for body
    strokeWeight(8);
    line(6, 2, 6, 30);
    stroke(222);
    strokeWeight(8);
    line(6, 0, 6, 26);
    stroke(245);
    strokeWeight(4);
    line(6, 0, 6, 26);
    stroke(250); // for head
    strokeWeight(6);
    fill(245);
    ellipse(0, 0, 10, 8);
    popMatrix();
    
    if(euclid(width/2, height/2, leftX-x_center, leftY-y_center) < 70) {
      find_left = true;
      get++;
    }
  }
  if(!find_right) { // for right
    pushMatrix();
    translate(rightX-x_center, rightY-y_center);
    rotate(right);
    stroke(212); // for outline
    strokeWeight(10);
    fill(212);
    ellipse(0, 0, 10, 8);
    stroke(102); // for body
    strokeWeight(8);
    line(-6, 2, -6, 30);
    stroke(222);
    strokeWeight(8);
    line(-6, 0, -6, 26);
    stroke(245);
    strokeWeight(4);
    line(-6, 0, -6, 26);
    stroke(250); // for head
    strokeWeight(6);
    fill(245);
    ellipse(0, 0, 10, 8);
    popMatrix();
    
    if(euclid(width/2, height/2, rightX-x_center, rightY-y_center) < 70) {
      find_right = true;
      get++;
    }
  }

  // robot
  noStroke();
  if (keyPressed && ((keyCode==RIGHT)||(keyCode==DOWN)|| 
    (keyCode==UP)||(keyCode==LEFT))) {
    if (keyCode == RIGHT) {
      dir = 0;
    } else if (keyCode == LEFT) {
      dir = 1;
    } else if (keyCode == DOWN) {
      dir = 2;
    } else if (keyCode == UP) {
      dir = 3;
    }
    x_center += dx[dir] * speedUp; // by recharging
    y_center += dy[dir] * speedUp;
  }
  // limit of map
  if (x_center > x_max) x_center = x_max;
  if (x_center < x_min) x_center = x_min;
  if (y_center > y_max) y_center = y_max;
  if (y_center < y_min) y_center = y_min;

  // Antennae
  strokeWeight(3);
  stroke(0);
  line(width/2, height/2, width/2 + dx[dir] * 10 + dx_eye[dir] * 5, 
    height/2 + dy[dir] * 10 + dy_eye[dir] * 5);
  line(width/2, height/2, width/2 + dx[dir] * 10 - dx_eye[dir] * 5, 
    height/2 + dy[dir] * 10 - dy_eye[dir] * 5);

  // body
  noStroke();
  fill(0);
  ellipse(width/2, height/2, 162, 162);
  fill(255);
  ellipse(width/2, height/2, 160, 160);
  fill(190);
  ellipse(width/2, height/2, 156, 156);

  // eyes
  if (++eyes_blink == 20) {
    eyes_blink = 0;
  }
  if (eyes_blink < 10) {
    fill(0);
  } else {
    fill(255, 0, 0);
  }
  ellipse(width/2 + dx[dir] * 6 + dx_eye[dir], 
    height/2 + dy[dir] * 6 + dy_eye[dir], 9, 9);
  ellipse(width/2 + dx[dir] * 6 - dx_eye[dir], 
    height/2 + dy[dir] * 6 - dy_eye[dir], 9, 9);
    
  // letters
  noFill();
  stroke(210);
  strokeWeight(12);
  ellipse(width/2, height/2, 90, 90);
  textFont(jam);
  textAlign(CENTER); // push mode
  fill(102);
  pushMatrix();
  translate(width/2, height/2);
  switch(dir) {
    case 0 :
      rotate(PI/2);
      break;
    case 1 :
      rotate(-PI/2);
      break;
    case 2 :
      rotate(PI);
      break;
  }
  text("JAM", 0, 0);
  textAlign(LEFT); // pop mode
  popMatrix();

  // location and count
  textFont(coor);
  fill(255);
  textSize(30);
  String location = "LOCATION : (" + Integer.toString(x_center)
    + ", " + Integer.toString(y_center) + ")";
  String count = Integer.toString(get) + " pieces";
  String total = " / " + Integer.toString(total_things);
  text(location, 15, 780);
  text("COUNT : ", 780, 35);
  if(get != total_things) {
    text(total, 1070, 35);
    fill(255, 0, 0);
    text(count, 920, 35);
  }
  else {
    fill(51, 51, 255);
    text("COMPLETE !", 920, 35);
  }
  
  if(speedUp == 1) {
    fill(102, 100);
  }
  else {
    int r = (int)random(255);
    int g = (int)random(255);
    int b = (int)random(255);
    fill(r, g, b);
  }
  textSize(40);
  text("F E V E R  T I M E !", 130, 40);
  
  // help button
  fill(235, 100);
  stroke(255, 100);
  if(is_mouse_on_help) {
    if(eyes_blink < 10) {
      stroke(255, 100);
    }
    else {
      stroke(255);
    }
    
  }
  strokeWeight(30);
  rect(55, 30, 70, 20);
  fill(153, 51, 0);
  stroke(153, 51, 0);
  strokeWeight(18);
  rect(55, 30, 70, 20);
  textSize(22);
  textAlign(CENTER);
  fill(234);
  text("HELP", 57, 40);
  if(2 < mouseX && mouseX < 100 && 2 < mouseY && mouseY < 50) { // on help
    is_mouse_on_help = true;
    stroke(0);
    strokeWeight(35);
    rect(width/2, height/2, 900, 700);
    stroke(255);
    fill(255);
    strokeWeight(30);
    rect(width/2, height/2, 900, 700);
    fill(0);
    textSize(50);
    text("HOW TO PLAY", width/2, 100);
    textAlign(LEFT);
    textSize(40);
    text("1. If you use the ROBOT to move items", 170, 200);
    text("     to the right position, JAM will be happy!", 170, 250);
    text("2. It can MOVE ITEMS to the right position!", 170, 320);
    text("3. You can check how many items you have", 170, 390);
    text("     moved on the top of the right!", 170, 440);
    text("4. You can CHARGE it on the charger to", 170, 510);
    text("     SPEED UP FOR SOME TIME!", 170, 560);
    text("5. You can see the mini-map on the bottom", 170, 630);
    text("     of the right FOR JUST 3 SECONDS!", 170, 680);
  }
  else {
    is_mouse_on_help = false;
  }
  
  // mini map button
  fill(235, 100);
  stroke(255, 100);
  if(is_mouse_on_map) {
    if(eyes_blink < 10) {
      stroke(255, 100);
    }
    else {
      stroke(255);
    }
    
  }
  strokeWeight(30);
  rect(1135, 760, 70, 20);
  fill(153, 51, 0);
  stroke(153, 51, 0);
  strokeWeight(18);
  rect(1135, 760, 70, 20);
  textSize(22);
  textAlign(CENTER);
  fill(234);
  text("MAP", 1135, 770);
  if(minimap_time > 0 && (1100 < mouseX && mouseX < 1200 && 750 < mouseY && mouseY < 800)) { // on mini map
    minimap_time--;
  
    is_mouse_on_map = true;
    stroke(0);
    strokeWeight(35);
    rect(width/2, height/2, 480, 320); // desk size (2400, 1600) / 5
    stroke(255);
    fill(255);
    strokeWeight(30);
    rect(width/2, height/2, 480, 320);
    
    noStroke(); // robot
    fill(0, 0, 255);
    ellipse(width/2+(float)x_center/5, height/2+(float)y_center/5, 10, 10);
    
    fill(0, 255, 0); // recharger
    ellipse(width/2+((float)18-600)/5, height/2+((float)150-400)/5, 10, 10);
    
    fill(255, 0, 0); // targets
    if(!macBook_organized) { // items on (-600 ~ 1800, -400, 1200) -> (-120 ~ 360, -80, 240)
      ellipse(width/2+((float)macBookX-600)/5, height/2+((float)macBookY-400)/5, 10, 10);
    }
    if(!iPad_organized) {
      ellipse(width/2+((float)iPadX-600)/5, height/2+((float)iPadY-400)/5, 10, 10);
    }
    if(!ap_organized) {
      ellipse(width/2+((float)apX-600)/5, height/2+((float)apY-400)/5, 10, 10);
    }
    if(!iPhone_organized) {
      ellipse(width/2+((float)iPhoneX-600)/5, height/2+((float)iPhoneY-400)/5, 10, 10);
    }
    if(!pencil_organized) {
      ellipse(width/2+((float)pencilX-600)/5, height/2+((float)pencilY-400)/5, 10, 10);
    }
    if(!book_organized) {
      ellipse(width/2+((float)bookX-600)/5, height/2+((float)bookY-400)/5, 10, 10);
    }
    if(!mm_organized) {
      ellipse(width/2+((float)mmX-600)/5, height/2+((float)mmY-400)/5, 10, 10);
    }
    if(!sp_organized) {
      ellipse(width/2+((float)spX-600)/5, height/2+((float)spY-400)/5, 10, 10);
    }
    if(!airPod_organized) {
      ellipse(width/2+((float)airPodX-600)/5, height/2+((float)airPodY-400)/5, 10, 10);
    }
    if(!eraser_organized) {
      ellipse(width/2+((float)eraserX-600)/5, height/2+((float)eraserY-400)/5, 10, 10);
    }
    if(!book_organized) {
      ellipse(width/2+((float)bookX-600)/5, height/2+((float)bookY-400)/5, 10, 10);
    }
    if(!nb_organized) {
      ellipse(width/2+((float)nbX-600)/5, height/2+((float)nbY-400)/5, 10, 10);
    }
    if(!find_left) {
      ellipse(width/2+((float)leftX-600)/5, height/2+((float)leftY-400)/5, 10, 10);
    }
    if(!find_right) {
      ellipse(width/2+((float)rightX-600)/5, height/2+((float)rightY-400)/5, 10, 10);
    }
  }
  else {
    is_mouse_on_map = false;
  }
  
  
  textAlign(LEFT);
}
