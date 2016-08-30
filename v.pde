

void vSetup() { // custom setup = runs ones
}

void vDraw() { // custom draw = renders fooorever
  //SETTINGS [change, plz don't delete any]
  credits = "sarah.wolfsberger + mykim.tran"; // put your name[s] here!
  modes = 3; // keys 1-2 ? max=10 then use if(modeSwitch == __){}
  myTextFont = "FreeSans.ttf";  //ie. "apple_ii.ttf";
  //myTextSize = height*.75; // <- custom size
  myTextLength = 15; // <- custom length for cuts
  processType(); // <- function happens below
  background(0); // <- up to you if you want a background!

  pushMatrix(); // only adjusts translate/scale within matrix
  translate(width/2, height/2); // suggestion to draw from center out 
  scale(.50); // <- custom scale of letters
  if (points != null) { // only draw if points ready 


    if (modeSwitch == 1) {

      noFill(); // optional.. 
      stroke(255); // optional...
      strokeWeight(random(5));

      beginShape(); 
      for (int i=0; i < points.length; i++) {
        int audioIndex = floor(map(i, 0, points.length, 0, fft.avgSize()));
        float audioLevel = fft.getAvg(audioIndex)*amp;  

        point(points[i].x+audioLevel, points[i].y+audioLevel, 150);
        myTextSize = random(height*75+audioLevel);
      } 
      endShape();
    } else if (modeSwitch == 2) {

      noFill(); // optional.. 
      stroke(255, 50); // optional...
      strokeWeight(random(40));

      beginShape(); 
      for (int i=0; i < points.length; i++) {
        int audioIndex = floor(map(i, 0, points.length, 0, fft.avgSize()));
        float audioLevel = fft.getAvg(audioIndex)*amp; 

        ellipse(points[i].x+audioLevel, points[i].y+audioLevel, 20, 10);
        myTextSize = random(height*75+audioLevel);
      } 
      endShape();
    } else if (modeSwitch == 3) {


      fill(255); // optional.. 
      stroke(255, 30); // optional...
      strokeWeight(15);

      beginShape(); 
      for (int i=0; i < points.length; i++) {
        int audioIndex = floor(map(i, 0, points.length, 0, fft.avgSize()));
        float audioLevel = fft.getAvg(audioIndex)*amp; 

        point(points[i].x+audioLevel, points[i].y+audioLevel, 50);
        point(points[i].x+audioLevel, points[i].y+audioLevel, random(100));
        point(points[i].x+audioLevel, points[i].y+audioLevel, 10);
        point(points[i].x+audioLevel, points[i].y+audioLevel, random(150));

        myTextSize = random(height*75+audioLevel);
      } 
      endShape();
    }
  }
  popMatrix();
  fill(255, avgAudio*5); // map(avgAudio, 0, maxAudio, 0, 255)
  for (int i = 0; i < 1000; i++) {
    float x = random(width);
    float y = random(height);
    //textSize(random(5,15));
    text(myText.toUpperCase(), x, y);
  }
}

// END CUSTOM CODE

