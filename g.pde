

/*---- YOUR CUSTOM CODE BELOW ------------------------*/
/*---- PUT OWN VARIABLES JUST BEFORE customSetup()-----*/
// float myCustomVar = 0; 

void gSetup() { // custom setup = runs ones
}

void gDraw() { // custom draw = renders fooorever
  //SETTINGS [change, plz don't delete any]
  credits = "anna-lena.spieler"; // put your name[s] here!
  modes = 2; // keys 1-__? max=10 then use if(modeSwitch == __){}
  myTextFont = "FreeSans.ttf"; // ie. "apple_ii.ttf";
  myTextSize = height*.75; // <- custom size
  myTextLength = 15; // <- custom length for cuts
  processType(); // <- function happens below
  background(0); // <- up to you if you want a background!

  pushMatrix(); // only adjusts translate/scale within matrix
  translate(width/2, height/2); // suggestion to draw from center out 
  scale(.65); // <- custom scale of letters

  if (points != null) { // only draw if points ready 
    noFill(); // optional.. 
    stroke(255); // optional...
    avgAudio *= .1;
    beginShape();
    if (modeSwitch == 1) {
      for (int i=0; i < points.length; i++) { 
        triangle(points[i].x, points[i].y, points[i].x-avgAudio, points[i].y+avgAudio*2, points[i].x+avgAudio, points[i].y+avgAudio*2);
      }
    } else {
      for (int i=0; i < points.length; i++) { 
        vertex(points[i].x+(avgAudio*amp*(random(-1, 1))), points[i].y+(avgAudio*amp*(random(-1, 1))));
      }
    }
    endShape();
  }
  popMatrix();
} // END CUSTOM CODE

/*---- YOUR CUSTOM CODE ABOVE ------------------------*/
