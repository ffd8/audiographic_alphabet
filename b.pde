/*---- YOUR CUSTOM CODE BELOW ------------------------*/
/*---- PUT OWN VARIABLES JUST BEFORE customCode()-----*/
// float myCustomVar = 0; 
//***** add class for pelo

//ESFERA starts
Hair[] liste ;
float radius = 200;
float rx = 0;
float ry =0;
int number = 60;

class Hair {
  float z = random(-radius, radius);
  float phi = random(TWO_PI);
  float lang = random(1.15, 1.2);
  float theta = asin(z/radius);
  Hair() { // what's wrong with a constructor here
    z = random(-radius, radius);
    phi = random(TWO_PI);
    lang = random(1.15, 1.2);
    theta = asin(z/radius);
  }
  void drawing() {

    float off = (noise(millis() * 0.0005, sin(phi))-0.5) * 0.3;
    float offb = (noise(millis() * 0.0007, sin(z) * 0.01)-0.5) * 0.3;

    float thetaff = theta+off;
    float phff = phi+offb;
    float x = radius * cos(theta) * cos(phi);
    float y = radius * cos(theta) * sin(phi);
    float z = radius * sin(theta);

    float xo = radius * cos(thetaff) * cos(phff);
    float yo = radius * cos(thetaff) * sin(phff);
    float zo = radius * sin(thetaff);

    float xb = xo * lang;
    float yb = yo * lang;
    float zb = zo * lang;

    strokeWeight(1);
    beginShape(LINES);
    for (int i=0; i < points.length; i++) { // points.length = number of points being stored 
      int audioIndex = floor(map(i, 0, points.length, 0, fft.avgSize()));
      float audioLevel = fft.getAvg(audioIndex)*amp*.05;
      //vertex(points[i].x+audioLevel, points[i].y+audioLevel); // try other shapes with points[i].x/y! 

      myTextSize = height*0.75; // <- custom size

      stroke(255);
      vertex((points[i].x+audioLevel)/2, (points[i].y+audioLevel)/2);
      stroke(200, 150);
      vertex(points[i].x+audioLevel*xb/50, points[i].y+audioLevel*yb/50);
    } 
    endShape();
  }
} // Ending ESFERA 

void bSetup() { // custom setup = runs ones 

  //ESFERA
  radius = height/3.5;

  liste = new Hair[number];
  for (int i = 0; i < liste.length; i++) {
    liste[i] = new Hair();
  }
  noiseDetail(3);
}

void bDraw() { // custom draw = renders fooorever
  //SETTINGS [change, don't delete any]
  credits = "sarah.wolfsberger + mykim.tran"; // put your name[s] here!
  myTextSize = height*.75; // <- custom size
  myTextFont = "FreeSans.ttf"; // ie. "apple_ii.ttf";
  modes = 1;
  myTextLength = 15; // <- custom length for cuts
  processType(); // <- function happens below
  background(0); // <- up to you if you want a background!
  translate(width/2, height/2); // suggestion to draw from center out 
  scale(.5); // <- custom scale of letters

  // CUSTOMIZE WITHIN CODE BELOW 
  if (points != null) { // only draw if points ready 
    noFill(); // optional.. 
    stroke(255); // optional...
    strokeWeight(1);

    //ESFERA
    float rxp = (mouseX-(width/2)) * 0.005;
    float ryp = (mouseY-(height/2)) * 0.005;
    rx = rx*0.9 + rxp*0.1;
    ry = ry*0.9 + ryp*0.1;

    fill(0);
    noStroke();
    sphere(radius/100);

    for (int i = 0; i < liste.length; i++) {
      liste[i].drawing();
    }
  }
} // END CUSTOM CODE

