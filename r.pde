
float bass_r;
void rSetup() { // custom setup = runs ones
}

void rDraw() { // custom draw = renders fooorever
  //SETTINGS [change, plz don't delete any]
  credits = "raphael.vollenweider"; // put your name[s] here!
  modes = 5; // keys 1-__? max=10 then use if(modeSwitch == __){}
  myTextFont = "FreeSans.ttf"; // ie. "apple_ii.ttf";
  myTextSize = height*.75; // <- custom size
  myTextLength = avgAudio; // <- custom length for cuts
  processType(); // <- function happens below
  background(0); // <- up to you if you want a background!

  pushMatrix(); // only adjusts translate/scale within matrix
  translate(width/2, height/2); // suggestion to draw from center out 
  scale(.65); // <- custom scale of letters

  if (points != null) { // only draw if points ready 
    fill(0); 
    stroke(255);
    float shrinkAmp = .5; // make amp smaller
    bass_r = fft.calcAvg(0, 1500)*amp*shrinkAmp;
    //mid = fft.calcAvg(1000, 5000)*amp*shrinkAmp; 
    // high = fft.calcAvg(5000, 20000)*amp*shrinkAmp; 

    beginShape(); 
    int drawR = floor(constrain(map(bass_r, 3, 10, 80, points.length), 20, points.length));


    if (drawR<points.length) { 
      // bei 30 verstellen für buchstabeaufbau
      for (int i=0; i < drawR; i++) { // points.length = number of points being stored 
        //int grabRandom = floor(random(points.length));
        int audioIndex = floor(map(i, 0, drawR, 1, fft.avgSize()));
        float audioLevel = fft.getAvg(audioIndex)*amp;

        audioLevel = 8;
        if (modeSwitch == 1) {

          // ellipse(points[i].x*avgAudio/5, points[i].y*avgAudio/5, 30, 1); // try other shapes with points[i].x/y!
          fill(points[i].x+audioLevel);
          rect(points[i].x*audioLevel/4, points[i].y*audioLevel/4, 600, 1); // try other shapes with points[i].x/y!
          noFill();
          // ellipse(points[i].x*avgAudio/10, points[i].y*avgAudio/10, points[i].x*avgAudio/10, 1); // try other shapes with points[i].x/y!
          //noFill();
          //strokeWeight(5);
          fill(255, 40);
          noStroke();





          rect(points[i].x*audioLevel/9, points[i].y*audioLevel/9, 30, points[i].y*audioLevel/100 ); // try other shapes with points[i].x/y!
        } else if (modeSwitch == 2) {


          strokeWeight(random(1, 10));

          point(points[i].x+audioLevel/25, points[i].y+audioLevel/25); // try other shapes with points[i].x/y!
        } else if (modeSwitch == 3) {
          strokeWeight(2);
          ellipse(points[i].x*audioLevel/8, points[i].y*audioLevel/8, 50, 1); // try other shapes with points[i].x/y!
          noFill();
          strokeWeight(2);
        } else if (modeSwitch == 4) {
          //println("audioLevel: "+audioLevel);
          strokeWeight(2);
          fill(audioLevel, 255, 40);
          if (audioLevel>10 &&audioLevel<20) {
            stroke(255, 0, 0);
          } else {
            stroke(255);
          }

          line(points[i].x*audioLevel, points[i].y*audioLevel, points[i].x/audioLevel*5, points[i].y/audioLevel*5); // try other shapes with points[i].x/y!


          line(points[i].x, points[i].y+random(1)/audioLevel, points[i].x+random(1)/audioLevel, points[i].y+random(0)/audioLevel); // try other shapes with points[i].x/y!
        } else if (modeSwitch == 5) {

          strokeWeight(.5);
          ellipse(points[i].x*audioLevel/5, points[i].y*audioLevel/5, 500, 1); // try other shapes with points[i].x/y!
          noFill();
        }
      }
    }
    endShape();
  }
  popMatrix();
} // END CUSTOM CODE

