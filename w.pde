//float m = 0;
void wSetup() { // custom setup = runs ones
}

void wDraw() { // custom draw = renders fooorever
  //SETTINGS [change, plz don't delete any]
  credits = "alessandro.thueler + megan.adé"; // put your name[s] here!
  modes = 3; // keys 1-__? max=10 then use if(modeSwitch == __){}
  myTextFont = "FreeSans.ttf"; // ie. "apple_ii.ttf";
  myTextSize = height*.75; // <- custom size
  myTextLength = 15; // <- custom length for cuts
  processType(); // <- function happens below
  background(0); // <- up to you if you want a background!

  //pushMatrix(); // only adjusts translate/scale within matrix
  translate(width/2, height/2); // suggestion to draw from center out 
  scale(0.5+avgAudio/1000); // <- custom scale of letters

  if (points != null) { // only draw if points ready 
    noFill(); // optional.. 
    stroke(255); // optional...

    pushMatrix();

    strokeWeight(1);


    if (modeSwitch == 2) {

      beginShape(); // just demo below.. replace me!
      for (int i=0; i < points.length; i++) { 
        int audioWaveIndex = floor(map(i, 0, points.length, 0, in.bufferSize())); 
        float audioWave = (in.left.get(audioWaveIndex))*ampWave/20; 

        int bassFreqIndex = floor(map(i, 0, points.length, 0, fft.avgSize()*1/3)); 
        float bassFreq = fft.getAvg(bassFreqIndex)*amp/20;

        int midFreqIndex = floor(map(i, 0, points.length, 0, fft.avgSize()*2/3)); 
        float midFreq = fft.getAvg(midFreqIndex)*amp/20;

        int highFreqIndex = floor(map(i, 0, points.length, 0, fft.avgSize())); 
        float highFreq = fft.getAvg(highFreqIndex)*amp/20;

        //translate(0, 0, audioWave/100);
        //vertex(points[i].x, points[i].y, audioWave*avgAudio); // try other shapes with points[i].x/y!
        //vertex(0, 0, -avgAudio);
        if (i < points.length) {
          line(points[i].x+audioWave, points[i].y+audioWave, (avgAudio+bassFreq), 0, 0, audioWave);
          vertex(0, avgAudio, avgAudio);
        }

        if (i < points.length) {
          line(points[i].x*avgAudio/10, points[i].y, (avgAudio+bassFreq)/10, 0, 0, audioWave);
          //vertex(0, 0);
        }

        if (i < points.length) {
          line(points[i].x, points[i].y*avgAudio/10, (avgAudio+bassFreq)/10, 0, 0, audioWave);
          //vertex(0, 0);
        }
      } 
      endShape();
    }
  }
  popMatrix();
  if (modeSwitch == 3) {

    pushMatrix();
    strokeWeight(1);
    scale(0.8);
    m += 0.001;
    //ortho();
    //rotateZ(m+avgAudio/200);
    //rotateX(m);
    //rotateY(m+avgAudio/200);

    beginShape(); // just demo below.. replace me!
    for (int i=0; i < points.length; i++) { 


      int audioWaveIndex = floor(map(i, 0, points.length, 0, in.bufferSize())); 
      float audioWave = (in.left.get(audioWaveIndex)+0.5)*ampWave*2; 

      int bassFreqIndex = floor(map(i, 0, points.length, 0, fft.avgSize()*1/3)); 
      float bassFreq = fft.getAvg(bassFreqIndex)*amp;

      int midFreqIndex = floor(map(i, 0, points.length, 0, fft.avgSize()*2/3)); 
      float midFreq = fft.getAvg(midFreqIndex)*amp;

      int highFreqIndex = floor(map(i, 0, points.length, 0, fft.avgSize())); 
      float highFreq = fft.getAvg(highFreqIndex)*amp;



      //translate(0, 0, audioWave/100);
      //vertex(points[i].x, points[i].y, audioWave*avgAudio); // try other shapes with points[i].x/y!
      //vertex(0, 0, -avgAudio);
      /* if (i < points.length) {
       ellipse(points[i].x, points[i].y, (avgAudio+bassFreq)/10, audioWave);
       //vertex(0, 0);
       }*/

      if (i < points.length) {


        ellipse(points[i].x+0.1*audioWave/10*avgAudio*highFreq/20, points[i].y+0.1*audioWave/10*avgAudio*highFreq/20, (avgAudio*5)+250, (avgAudio*5)+250);
      }

      //vertex(0, 0);
    }

    /*if (i < points.length) {
     ellipse(points[i].x, points[i].y, (avgAudio+bassFreq)/10, audioWave);
     //vertex(0, 0);
     }*/

    endShape();
    popMatrix();
  }

  if (modeSwitch == 1) {

    pushMatrix();

    scale(0.9);
    strokeWeight(0.5);

    beginShape(); 
    for (int i=0; i < points.length; i++) { 
      int audioWaveIndex = floor(map(i, 0, points.length, 0, in.bufferSize())); 
      float audioWave = (in.left.get(audioWaveIndex))*ampWave/20; 

      int bassFreqIndex = floor(map(i, 0, points.length, 0, fft.avgSize()*1/3)); 
      float bassFreq = fft.getAvg(bassFreqIndex)*amp*150;

      int midFreqIndex = floor(map(i, 0, points.length, 0, fft.avgSize()*2/3)); 
      float midFreq = fft.getAvg(midFreqIndex)*amp*150;

      int highFreqIndex = floor(map(i, 0, points.length, 0, fft.avgSize())); 
      float highFreq = fft.getAvg(highFreqIndex)*amp*150;



      //translate(0, 0, audioWave/100);
      //vertex(points[i].x, points[i].y, audioWave*avgAudio); // try other shapes with points[i].x/y!
      //vertex(0, 0, -avgAudio);
      if (i < points.length*.5 && i > points.length*.25) {
        line(points[i].x, points[i].y, bassFreq/20, 0, 0, audioWave);
        //vertex(0, 0);
      }

      if (i > points.length*.25 && i< points.length*.5) {
        line(points[i].x, points[i].y, midFreq/2, 0, 0, audioWave);
        //vertex(0, 0);
      }

      if (i < points.length) {
        line(points[i].x, points[i].y, highFreq/2, 0, 0, audioWave);
        //vertex(0, 0);
      }
    } 
    endShape();
    popMatrix();
  }


  //popMatrix();
}

