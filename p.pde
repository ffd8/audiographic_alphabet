/*---- YOUR CUSTOM CODE BELOW ------------------------*/
/*---- PUT OWN VARIABLES JUST BEFORE customSetup()-----*/
// float myCustomVar = 0; 

void pSetup() { // custom setup = runs ones
}

void pDraw() { // custom draw = renders fooorever
  //SETTINGS [change, plz don't delete any]
  credits = "david.zumbrunn"; // put your name[s] here!
  modes = 2; // keys 1-__? max=10 then use if(modeSwitch == __){}
  myTextFont = "FreeSans.ttf"; // ie. "apple_ii.ttf";
  myTextSize = height*.75; // <- custom size
  myTextLength = 2; // <- custom length for cuts
  processType(); // <- function happens below
  background(0); // <- up to you if you want a background!

  pushMatrix(); // only adjusts translate/scale within matrix
  translate(width/2, height/2); // suggestion to draw from center out 
  scale(.4); // <- custom scale of letters

  float audioShrink = .15;

  if (points != null) { // only draw if points ready 
    noFill(); // optional.. 
    stroke(255); // optional...



    beginShape();

    //fill(255, 255, 255, 20);
    //rect(displayWidth, displayHeight, displayWidth, displayHeight);

    for (int i=0; i < points.length; i++) { 

      int audioIndex = floor(map(i, 0, points.length, 0, fft.avgSize()));
      int audioMouseX = floor(map(mouseY/2, 0, points.length, 0, fft.avgSize()));
      float audiolLevel = fft.getAvg(audioIndex)*amp*i/10*audioShrink;



      //noCursor();
      noStroke();

      float distance = abs(avgAudio/3);

      fill(255, distance);

      rotateY(avgAudio/amp*10); // use mouseX to rotate one axis of entire shape 

      //rotateX(map(height, 0, width, PI, -PI)/200); // use mouseX to rotate one axis of entire shape 
      ellipse(points[i].x + audiolLevel*10, points[i].y, 7, 7);
      ellipse(points[i].x - audiolLevel*10, points[i].y, 7, 7);
      //size audio
      ellipse(points[i].x, points[i].y, 7 + avgAudio*audioShrink, 7 + avgAudio*audioShrink);


      if (avgAudio*audioShrink < amp*2) {
        fill(255, distance);
        rotateY(0);
        ellipse(points[i].x, points[i].y, avgAudio*2*audioShrink, avgAudio*2*audioShrink);
        ellipse(points[i].x, points[i].y, avgAudio*2*audioShrink, avgAudio*2*audioShrink);
      }

      if (avgAudio*audioShrink < amp*4) {
        fill(200, 200, 255, distance);
        rotateY(0);
        ellipse(points[i].x, points[i].y, avgAudio*audioShrink, avgAudio*audioShrink);
        ellipse(points[i].x, points[i].y, avgAudio*audioShrink, avgAudio*audioShrink);
      }

      if (modeSwitch == 2) {
        rotateY(0);
        rotateX(0);
        rotateZ(noise(audiolLevel/200));
      }
    } 
    endShape();

    //shape2
    /*
    beginShape(); 
     for (int i=0; i < points.length; i++) { 
     
     int audioIndex = floor(map(i, 0, points.length, 0, fft.avgSize()));
     int audioMouseX = floor(map(mouseX/2, 0, points.length, 0, fft.avgSize()));
     float audiolLevel = fft.getAvg(audioIndex)*amp*i/10;
     
     noCursor();
     noStroke();
     fill(255, 50);
     ellipse(points[i].x + audiolLevel, points[i].y -audiolLevel, amp, amp);
     } 
     endShape();*/
  }
  popMatrix();
} // END CUSTOM CODE

/*---- YOUR CUSTOM CODE ABOVE ------------------------*/
