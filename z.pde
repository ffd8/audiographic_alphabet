
String myTextOld = "";
int modeP = 1;
float[] pointsFreq;
float shrink = 0;
int dir = 1;
float rotY;

void zSetup() { // custom setup = runs ones
  myTextOld = myText;
}

void zDraw() { // custom draw = renders fooorever
  //SETTINGS [change, plz don't delete any]
  credits = "ted.davis"; // put your name[s] here!
  modes = 5; // keys 1-__? max=10 then use if(modeSwitch == __){}
  myTextFont = "FreeSans.ttf"; // ie. "apple_ii.ttf";
  myTextSize = height*.75; // <- custom size
  myTextLength = 15; // <- custom length for cuts
  rotY = frameCount+avgAudio/10%360;
  if ((modeSwitch != 3 && modeSwitch != 4) || !myTextOld.equals(myText) || modeP != modeSwitch) {
    processType(); // <- function happens below
    myTextOld = myText;
    pointsFreq = new float[points.length];
    modeP = modeSwitch;
    rotY = 0;
  }
  background(0); // <- up to you if you want a background!
  float avgAudioMini = avgAudio*.005;
  float shrinkmax = -50;

  pushMatrix(); // only adjusts translate/scale within matrix
  translate(width/2, height/2); // suggestion to draw from center out 
  scale(.65); // <- custom scale of letters

  if (points != null) { // only draw if we have points 
    RPoint[] pointsDup = points;

    if (modeSwitch == 1) {
      noFill(); 
      stroke(255); 
      rotateY(-radians(frameCount+avgAudio/10%360));
      for ( float j = 0; j < avgAudio; j+=avgAudio/50) {
        pushMatrix();
        rotateY(radians(j));
        strokeWeight(map(j, 0, avgAudio, 2, 0));
        beginShape(); 
        for (int i=0; i < points.length; i++) { 
          vertex(points[i].x, points[i].y);
        } 
        endShape();
        popMatrix();
      }
    } else if (modeSwitch == 2) {
      noFill(); 
      stroke(255); 
      rotateY(-radians(frameCount+avgAudio/10%360));
      scale(map(avgAudio, 0, maxAudio, 1, 1.05));
      for ( float j = 0; j < avgAudio; j+=avgAudio/50) {
        pushMatrix();
        rotateY(radians(j));
        strokeWeight(map(j, 0, avgAudio, 2, 0));
        beginShape(LINES); 
        for (int i=0; i < points.length; i++) { 
          vertex(points[i].x, points[i].y);
        } 
        endShape();
        popMatrix();
      }
    } else if (modeSwitch == 3) {
      noFill(); 
      stroke(255); 
      rotateY(-radians(rotY));
      scale(map(avgAudio, 0, maxAudio, 1, 1.05));
      int wrap = 90;

      for (int i=0; i < points.length; i++) { 
        int audioWaveIndex = floor(map(i, 0, points.length, 0, in.bufferSize())); 
        float audioWave = in.left.get(audioWaveIndex)*ampWave*.05;  
        pointsFreq[i] += abs(audioWave);
      }

      for (int i=0; i < points.length; i++) { 
        for ( float j = 0; j < wrap; j+=1) {
          pushMatrix();
          rotateY(radians(j+pointsFreq[i]));
          strokeWeight(map(j, 0, wrap, 3, 0));

          beginShape(POINTS); 
          pointsDup[i].x += random(-avgAudioMini, avgAudioMini);
          vertex(points[i].x, points[i].y);
          endShape();
          popMatrix();
        }
      }
    } else if (modeSwitch == 4) {
      noFill(); 
      stroke(255); 
      ortho();
      int wrap = 90;

      for (int i=0; i < points.length; i++) { 
        int audioFreqIndex = floor(map(i, 0, points.length, 0, fft.avgSize())); 
        float audioFreq = fft.getAvg(audioFreqIndex)*amp*.0125; 
        int audioWaveIndex = floor(map(i, 0, points.length, 0, in.bufferSize())); 
        float audioWave = in.left.get(audioWaveIndex)*ampWave*.1;  
        pointsFreq[i] += abs(audioFreq)*dir;

        if (pointsFreq[i] > 2500) {
          dir = -1;
        } else if (pointsFreq[i] < -2500) {
          dir = 1;
        }
      }

      shrink -= 1;
      if (shrink < shrinkmax) {
        shrink = shrinkmax;
      }

      for (int i=0; i < points.length; i++) { 
        translate(0, 0, shrink+pointsFreq[i]*.1);
        for ( float j = 0; j < wrap; j+=2) {
          pushMatrix();
          rotateZ(radians(j+pointsFreq[i]));
          strokeWeight(map(j, 0, wrap, 3, 0));

          beginShape(POINTS); 
          vertex(points[i].x, points[i].y);
          endShape();
          popMatrix();
        }
      }
    } else if (modeSwitch == 5) {
      noStroke();
      //ortho();
      rotateY(-radians(frameCount%1800)/5);
      translate(width*.25, 0, 200);
      float avgAudioMin = avgAudio/5;
      for ( float j = 0; j < avgAudioMin; j+=1) {
        pushMatrix();
        rotateY(radians(j));
        noStroke();
        fill(map(j, 0, avgAudioMin, 255, 0));

        beginShape();
        for (int i=0; i < points.length; i++) { 
          translate(j/avgAudio/10, 0, -j/40); 
          vertex(points[i].x, points[i].y);
        } 
        endShape();
        popMatrix();
      }
    }
  }
  perspective();
  popMatrix();
} // END CUSTOM CODE

