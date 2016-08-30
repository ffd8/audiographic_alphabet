//BeatDetect beat;
int  r = 200;
float rad = 10;
void mSetup() { 
  smooth();
  //background(-1);
  noCursor();
  // custom setup = runs one
}

void mDraw() {
  noStroke();

  // custom draw = renders fooorever
  //SETTINGS [change, plz don't delete any]
  credits = "céline.degrenus + mayar.elhayawan"; // put your name[s] here!
  modes = 1; // keys 1-__? max=10 then usre if(modeSwitch == __){}
  myTextFont = "FreeSans.ttf"; // ie. "apple_ii.ttf";
  myTextSize = height*.80; // <- custom size
  myTextLength = 15; // <- custom length for cuts
  processType(); // <- function happens below
  // <- up to you if you want a background!

  fill(0, 10);
  rect(0, 0, width*2, height*2);
  pushMatrix(); // only adjusts translate/scale within matrix
  translate(width/2, height*0.5); // suggestion to draw from center out 
  scale(.65); // <- custom scale of letters

  if (points != null) { // only draw if points ready 
    //noFill(); // optional.. 
    stroke(255); // optional...

    beginShape(); // just demo below.. replace me!
    for (int i=0; i < points.length; i++) { 
      vertex(points[i].x, points[i].y);
    }
    endShape();
    /*
    for (int i=0; i < points.length; i++) { 
     stroke(255);
     //strokeWeight(0.5);
     int bsize = in.bufferSize();
     for (int j = 0; j < bsize; j+=20) // less lines if i grows
     {
     //stroke(255);
     float x = (r)*cos(i*8*PI/bsize*100); // to ad more point x*PI for symetric use power of 4 
     float y = (r)*sin(i*8*PI/bsize*100);
     float x2 = (r + in.right.get(i)*100)*cos(j*4/bsize*1.05); // 1.05 is to make it symetrical 
     float y2 = (r + in.left.get(i)*100)*sin(j*4/bsize*1.05);
     line(points[i].x, points[i].y - sin(x), x2, y2);
     }
     } 
     */
  }
  popMatrix();
  translate(width/2, height/2);
  scale(1.35); // boosted size to match letters
  //stroke(-1, 100);
  stroke(255, 100);
  strokeWeight(0.125);
  int bsize = in.bufferSize();
  for (int i = 0; i < bsize; i+=4) // less lines if i grows
  {
    float x = (r)*cos(i*8*PI/bsize*586); // to ad more point x*PI for symetric use power of 4 
    float y = (r)*sin(i*8*PI/bsize*280);
    float x2 = (r + in.right.get(i)*600)*cos(i*4/bsize*1.05); // 1.05 is to make it symetrical 
    float y2 = (r + in.left.get(i)*600)*sin(i*4/bsize*1.05);
    line(x, y, x2, y2);
  }
} // END CUSTOM CODE

