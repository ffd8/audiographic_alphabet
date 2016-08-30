
/*---- YOUR CUSTOM CODE BELOW ------------------------*/
/*---- PUT OWN VARIABLES JUST BEFORE customSetup()-----*/
// float myCustomVar = 0; 

void uSetup() { // custom setup = runs ones
}

void uDraw() { // custom draw = renders fooorever
  //SETTINGS [change, plz don't delete any]
  credits = "isis.novell"; // put your name[s] here!
  modes = 3; // keys 1-__? max=10 then use if(modeSwitch == __){}
  myTextFont = "FreeSans.ttf"; // ie. "apple_ii.ttf";
  myTextSize = height*.75; // <- custom size
  myTextLength = 10; // <- custom length for cuts
  processType(); // <- function happens below
  background(0); // <- up to you if you want a background!

  pushMatrix(); // only adjusts translate/scale within matrix
  translate(width/2, height/2); // suggestion to draw from center out 
  scale(.65); // <- custom scale of letters

  if (points != null) { // only draw if points ready 
    noFill(); // optional.. 
    stroke(255); // optional...

    beginShape(); // just demo below.. replace me!
    //fill(255);
    for (int i=0; i < points.length; i++) { 
      int grabRandom = floor(random(points.length));
      int audioIndex = floor(map(i, 0, points.length, 0, fft.avgSize()));
      float audioLevel = fft.getAvg(audioIndex)*amp*.5;
      if (modeSwitch == 3) {
        strokeWeight(random(8));
        point(points[i].x, points[i].y+random(150)/audioLevel+avgAudio);
      } else if (modeSwitch == 2) {
        strokeWeight(.1);
        ellipse(points[i].x*audioLevel, points[i].y*audioLevel, 5, 5); // try other shapes with points[i].x/y!
        fill(255);

        //int randomPoint = floor(random(points.length));
        //strokeWeight(1);
        //stroke(255, 255, 255, random(255));
        //fill(255, 255, 255, random(100, 255));
        //vertex(points[grabRandom].x-avgAudio, points[grabRandom].y-audioLevel);
      } else if (modeSwitch == 1) {


        strokeWeight(audioLevel);
        line(points[i].x+audioLevel, points[i].y+random(1)/audioLevel, points[i].x+audioLevel, points[i].y*audioLevel);

        //ellipse(points[i].x, points[i].y+random(150)/audioLevel+avgAudio,points[i].x+audioLevel, points[i].y+random(150)/audioLevel+avgAudio);
      }
    } 
    endShape();
  }

  popMatrix();
} // END CUSTOM CODE

