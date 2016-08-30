float basss; 
float speeed = 0;

void fSetup() { // custom setup = runs ones
}

void fDraw() { // custom draw = renders fooorever
  //SETTINGS [change, plz don't delete any]
  credits = "cosimo.wunderlin"; // put your name[s] here!
  modes = 4; // keys 1-__? max=10 then use if(modeSwitch == __){}
  myTextFont = "FreeSans.ttf"; // ie. "apple_ii.ttf";
  myTextSize = height*.75; // <- custom size
  myTextLength = random(50); // <- custom length for cuts
  processType(); // <- function happens below
  background(0); // <- up to you if you want a background!

  //pushMatrix(); // only adjusts translate/scale within matrix
  translate(width/2, height/2); // suggestion to draw from center out 
  scale(.65); // <- custom scale of letters



  if (modeSwitch == 1) {

    basss = fft.calcAvg(0, 1000)*amp/10;

    noFill();
    strokeWeight(1);
    stroke(255, map(basss, 0, basss, 50, 100));





    speeed += 5;

    if (speeed >= 100) {
      speeed = 0;
    }

    for (int i=0; i < points.length*4; i++) {
      int audioFreqIndex = floor(map(i, 0, points.length, 0, fft.avgSize())); 
      float audioFreq = fft.getAvg(audioFreqIndex)*amp; 

      line(points[i].x-basss*9, -80+points[i].y+speeed, points[i].x+speeed, -80+points[i].y+basss*9);
    }
  } else if (modeSwitch == 2) {

    basss = fft.calcAvg(0, 1000)*amp/2;

    if (points != null) { // only draw if points ready 
      noFill(); // optional.. 
      stroke(255); // optional...
      if (basss > 10) {
        strokeWeight(1);
      } else {
        strokeWeight(2);
      }

      rotateY(speeed);

      speeed += 0.09;


      for (int i=0; i < points.length; i++) {
        int audioFreqIndex = floor(map(i, 0, points.length, 0, fft.avgSize())); 
        float audioFreq = fft.getAvg(audioFreqIndex)*amp; 
        float rDist = constrain(map(basss, 0, 10, 100, 0), 0, 100);

        point(points[i].x+random(-rDist, rDist), -30+points[i].y+random(-rDist, rDist));
      }
    }
  } else if (modeSwitch == 3) {

    basss = fft.calcAvg(0, 1000)*amp/5;

    noFill();
    strokeWeight(2);
    stroke(255, 30);




    if (basss >= 20) {

      stroke(#fb5a1b, 30);
    } else {
      stroke(255, 30);
    }




    for (int i=0; i < points.length*4; i++) {
      int audioFreqIndex = floor(map(i, 0, points.length, 0, fft.avgSize())); 
      float audioFreq = fft.getAvg(audioFreqIndex)*amp; 

      ellipse(points[i].x/2, -50+points[i].y/2+basss*2, points[i].x/2, points[i].y/2);
    }
  } else if (modeSwitch == 4) {

    basss = fft.calcAvg(0, 1000)*amp/5;

    noFill();
    strokeWeight(noise(10));
    stroke(255, 80);


    speeed += 1;

    if (speeed >= 100) {
      speeed = 0;
    }



    for (int i=0; i < points.length*4; i++) {
      int audioFreqIndex = floor(map(i, 0, points.length, 0, fft.avgSize())); 
      float audioFreq = fft.getAvg(audioFreqIndex)*amp; 

      line(-speeed*2+points[i].x+basss*15, points[i].y+basss, points[i].x-basss*15+speeed, points[i].y);
    }
  }
}

