// float myCustomVar = 0; 
float mo = 0;
//float bass;
//float high; 
//float mid;
void iSetup() { // custom setup = runs ones
}

void iDraw() { // custom draw = renders fooorever
  //SETTINGS [change, plz don't delete any]
  credits = "martina.hareter"; // put your name[s] here!
  modes = 5; // keys 1-__? max=10 then use if(modeSwitch == __){}
  myTextFont = "FreeSans.ttf"; // ie. "apple_ii.ttf";
  myTextSize = height*.55; // <- custom size
  myTextLength = 15; // <- custom length for cuts
  processType(); // <- function happens below
  background(0); // <- up to you if you want a background!
  float shrinkAmp = .15; 

  if (modeSwitch == 1) {
    myTextLength = 40; // <- custom length for cuts
    processType(); // <- function happens below
  } else if (modeSwitch == 2) {
    myTextLength = 25; // <- custom length for cuts
    processType(); // <- function happens below
  }





  if (modeSwitch == 1) {
    shrinkAmp = .55;
    pushMatrix(); // only adjusts translate/scale within matrix
    translate(width/2, height/2); // suggestion to draw from center out 
    scale(.20, .65); // <- custom scale of letters

    if (points != null) { // only draw if points ready 
      fill(0); // optional.. 
      stroke(255); // optional...
    }
    bass = fft.calcAvg(0, 800)*amp*shrinkAmp;
    mid = fft.calcAvg(800, 4000)*amp*shrinkAmp;
    high = fft.calcAvg(4000, 20000)*amp*shrinkAmp;

    //println(bass +" / "+ mid +" / "+ high);
    for (int j=0; j<5; j++) {
      //  for (start; finish; count by)
      beginShape(); 

      for (int i=0; i < points.length; i++) { // points.length = number of points being stored 

        int audioIndex = floor(map(i, 0, points.length, 0, fft.avgSize()));
        float audioLevel = fft.getAvg(audioIndex)*amp*shrinkAmp;


        vertex(points[i].x +bass, points[i].y + j*audioLevel); // try other shapes with points[i].x/y!
        vertex(points[i].x+ audioLevel*-mid, points[i].y +j);
        vertex(points[i].x*j/2 + audioLevel, points[i].y + high*2*j);


        if (bass >= 25) {
          fill(255);
          stroke(0);
        } else {
          fill(0);
          stroke(255);
        }




        //ellipse(points[i].x, points[i].y, 2*j*bass, audioLevel);
      }
      endShape();
    }

    popMatrix();
  } else if (modeSwitch == 2) {
    shrinkAmp = .43;
    myTextFont = "FreeSans.ttf";
    pushMatrix(); // only adjusts translate/scale within matrix
    translate(width/2, height/2); // suggestion to draw from center out 
    scale(.45, .85); // <- custom scale of letters

    if (points != null) { // only draw if points ready 
      noFill(); // optional.. 
      stroke(255); // optional...
    }

    for (int j=0; j< 13; j++) {
      //  for (start; finish; count by)


      for (int i=0; i < points.length; i++) { // points.length = number of points being stored 

        int audioIndex = floor(map(i, 0, points.length, 0, fft.avgSize()));
        float audioLevel = fft.getAvg(audioIndex)*amp*shrinkAmp;

        ellipse(points[i].x, points[i].y, points[i].x/4+ audioLevel*j, points[i].y/4 + audioLevel);
      }
    }  
    popMatrix();
  } else if (modeSwitch == 3) {

    shrinkAmp = .45;
    pushMatrix(); // only adjusts translate/scale within matrix
    rotateX(mo); //auto rotate with growing value
    translate(width/2, height/2); // suggestion to draw from center out 
    scale(avgAudio/30); // <- custom scale of letters
    translate(2, 2, -2); // puts next rectangle further into Z/depth axis 
    rotate(radians(40)); // 




    if (points != null) { // only draw if points ready 
      background(0); // background(255); // switched to black to match other sketches
      noFill(); // optional.. 

      stroke(255); // optional...
    }

    //for (int j=0; j< 15; j++) {
    //  for (start; finish; count by)

    for (int i=0; i < points.length; i++) { // points.length = number of points being stored 

      int audioIndex = floor(map(i, 0, points.length, 0, fft.avgSize()));
      float audioLevel = fft.getAvg(audioIndex)*amp*shrinkAmp;



      int gridSize = 70; 
      for (int l=0; l < width; l+=gridSize) { 
        for (int j=0; j < height; j+=gridSize) { 
          //rect(l, j, gridSize, gridSize);
        }
      }

      for (int n=0; n < 10; n++) {

        rect(points[i].x, points[i].y, points[i].x+n*bass, points[i].y);
      }
    }

    popMatrix();

    mo += .01;
  } else if (modeSwitch == 4) {
    myTextLength = 25;

    pushMatrix(); // only adjusts translate/scale within matrix
    translate(width/2, height/2); // suggestion to draw from center out 
    scale(random(.10, .80)); // <- custom scale of letters

    if (points != null) { // only draw if points ready 
      noFill(); // optional.. 
      stroke(255); // optional...
    }

    for (int j=0; j< 28; j++) {
      //  for (start; finish; count by)


      for (int i=0; i < points.length; i++) { // points.length = number of points being stored 

        int audioIndex = floor(map(i, 0, points.length, 0, fft.avgSize()));
        float audioLevel = fft.getAvg(audioIndex)*amp*shrinkAmp;

        line(points[i].x + high, points[i].y+ high*j, points[i].x*audioLevel, points[i].y +audioLevel);
      }
    }  
    popMatrix();
  } else if (modeSwitch == 5) {
    myTextFont = "FreeSans.ttf";
    shrinkAmp = .75;

    pushMatrix(); // only adjusts translate/scale within matrix
    translate(width/2, height/2); // suggestion to draw from center out 
    scale(.65); // <- custom scale of letters
    if (mid >= 1000) {
      scale(.80);
    } else {
    }

    if (points != null) { // only draw if points ready 
      //noFill(); // optional.. 
      stroke(255); // optional...
    }



    //  for (start; finish; count by)
    beginShape(); 
    for (int j=0; j< 20; j+=2.1) {

      for (int i=0; i < points.length; i++) { // points.length = number of points being stored 

        int audioIndex = floor(map(i, 0, points.length, 0, fft.avgSize()));
        float audioLevel = fft.getAvg(audioIndex)*amp;
        strokeWeight(avgAudio/3);
        point(points[i].x +audioLevel*j/2, points[i].y+j*high);
        strokeWeight(0.6);
        line(points[i].x, points[i].y, points[i].x +j, points[i].y+j*audioLevel/2);
      }
    }



    endShape();



    popMatrix();
  }
}

