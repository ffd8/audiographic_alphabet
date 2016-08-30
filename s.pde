void sSetup() { // custom setup = runs ones
  smooth();
  rectMode(CENTER);
}

void sDraw() { // custom draw = renders fooorever
  //SETTINGS [change, plz don't delete any]
  credits = "fabienne.schmutz"; // put your name[s] here!
  modes = 1; // keys 1-__? max=10 then use if(modeSwitch == __){}
  myTextFont = "FreeSans.ttf"; // ie. "apple_ii.ttf";
  myTextSize = height*.75; // <- custom size
  myTextLength = 15; // <- custom length for cuts
  processType(); // <- function happens below
  background(0); // <- up to you if you want a background!

  pushMatrix(); // only adjusts translate/scale within matrix
  translate(width/2, height/2); // suggestion to draw from center out 
  scale(.65); // <- custom scale of letters

  if (points != null) { // only draw if points ready 
    background(0);   
    fill(255);   
    stroke(0);

    for (int i = -width/2; i < width/2; i++) {
      float r = (450+in.right.get(0)*500);
      float l = (0+in.left.get(0)*500);
      pushMatrix();
      //translate(0, 0);
      rect(i*5, 6, r, r);
      //ellipse(i*-5, 2, r, r);
      popMatrix();
    }

    fill(0); 
    stroke(255); 
    //translate(width/2.5, height*.8); // where to draw points 

    // all points together! 
    beginShape(); 
    for (int i=0; i < points.length; i++) { // points.length = number of points being stored 
      int audioIndex = floor(map(i, 0, points.length, 0, fft.avgSize()));
      float audioLevel = fft.getAvg(audioIndex)*amp;
      //vertex(points[i].x+audioLevel, points[i].y+audioLevel);
      vertex(points[i].x, points[i].y, audioLevel, audioLevel);
      rect(points[i].x, points[i].y, audioLevel+100, audioLevel+50); // try other shapes with points[i].x/y!
    } 
    endShape();
  }
  popMatrix();
} // END CUSTOM CODE

/*---- YOUR CUSTOM CODE ABOVE ------------------------*/
