/*---- YOUR CUSTOM CODE BELOW ------------------------*/
/*---- PUT OWN VARIABLES JUST BEFORE customSetup()-----*/
// float myCustomVar = 0; 
// write 2 to begin with " A B S T R A C T   A L P H A B E T "
// write 3 to begin with " D I S T U R B E D   A L P H A B E T "

//float bass, mid, high;

void jSetup() { // custom setup = runs ones
}

void jDraw() { // custom draw = renders fooorever
  //SETTINGS [change, plz don't delete any]
  credits = "anaelle.harnist"; // put your name[s] here!
  modes = 3; // keys 1-__? max=10 then use if(modeSwitch == __){}
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

    beginShape(); // just demo below.. replace me!
    for (int i=0; i < points.length; i++) { 

      int audioIndex = floor(map(i, 0, points.length, 0, fft.avgSize())); // WE WROTE DURING THE LESSON
      float audioLevel = fft.getAvg(audioIndex)*amp; // WE WROTE THIS DURING THE LESSON

      ////////////////
      int audioFreqIndex = floor(map(i, 0, points.length, 0, fft.avgSize())); 
      float audioFreq = fft.getAvg(audioFreqIndex)*amp; 

      int audioWaveIndex = floor(map(i, 0, points.length, 0, in.bufferSize())); 
      float audioWave = in.left.get(audioWaveIndex)*ampWave; 
      /////////////

      // now we can add audioLevel, audioWave, audioFreq, avgAudio everywhere we want :)

      bass = fft.calcAvg(0, 1000)*amp; // fft.calcAvg(minFreq, maxFreq)
      mid = fft.calcAvg(1000, 5000)*amp; 
      high = fft.calcAvg(5000, 20000)*amp;  
      RG.setPolygonizerLength(avgAudio); // use average audio for shape segmenting 
      // now we can play with bass, high...







      // G U E S S   T H E   L E T T E R
      // M Y S W I T C H   1   B A S E D   O N   A V G A U D I O ,   A N D   H I G H

      if (modeSwitch == 1) {

        //vertex(points[i].x, points[i].y); // Hide the line

        //LIGNE GAUCHE // bleu
        if (i > points.length*0 && i < points.length*.25 && audioWave<0 ) {
          //stroke(0, 0, 255);

          line(-width/2*1.65, 
          random(audioLevel-800, audioLevel+650), //  CHANGE THIS IF FULLSCREAN
          points[i].x, 
          points[i].y);
        } 

        //LIGNE DROITE // VIOLET
        if (i > points.length*.5 && i < points.length*.75 && audioWave>20 && audioWave<40 ) {
          //stroke(255, 0, 255);
          line(width/2*1.65, 
          random(audioLevel-800, audioLevel+650), //  CHANGE THIS IF FULLSCREAN
          points[i].x, 
          points[i].y);
        }

        //LIGNE HAUT // vert
        if (i > points.length*.25 && i < points.length*.5 && audioWave>0 && audioWave<20 ) {
          //stroke(0, 255, 0);
          line(random(audioLevel-1300, audioLevel+1300), //  CHANGE THIS IF FULLSCREAN
          -height/2*1.65, 
          points[i].x, 
          points[i].y);
        }
        //LIGNE BAS // rouge
        if (i > points.length*.75 && i < points.length*1 && audioWave>40  ) {
          //stroke(255, 0, 0);
          line(random(audioLevel-1300, audioLevel+1300), //  CHANGE THIS IF FULLSCREAN
          height/2*1.65, 
          points[i].x, 
          points[i].y);
        }

        if (bass > 100) { // DON'T FORGET TO TEST THIS WITH THE SOUND IN CLASS
          strokeWeight(3);
        } else {
          strokeWeight(1.35);
        }





        // A B S T R A C T   A L P H A B E T
        // M Y S W I T C H   2   B A S E D   O N   A U D I O F R E Q U ,   A V G A U D I O ,   A N D   B A S S
      } else if (modeSwitch == 2) {

        strokeWeight(1);
        // vertex(points[i].x, points[i].y); // Hide the line

        //LIGNE GAUCHE //
        if (i < points.length*.25 && audioFreq<1 ) {
          line(-width/2*1.65, 
          random(width), 
          points[i].x, 
          points[i].y);
        } 

        //LIGNE DROITE //
        if (i > points.length*.5 && i < points.length*.75 && audioFreq>2 && audioFreq<3 ) {
          line(width/2*1.65, 
          random(width), 
          points[i].x, 
          points[i].y);
        }

        //LIGNE HAUT //
        if (i > points.length*.25 && i < points.length*.5 && audioFreq>1 && audioFreq<2 ) {
          line(random(width), 
          -height/2*1.65, 
          points[i].x, 
          points[i].y);
        }

        //LIGNE BAS //
        if (i > points.length*.75  && audioFreq>3  ) {
          line(random(width), 
          height/2*1.65, 
          points[i].x, 
          points[i].y);
        }

        bass = fft.calcAvg(0, 1000)*amp; // fft.calcAvg(minFreq, maxFreq)
        mid = fft.calcAvg(1000, 5000)*amp; 
        high = fft.calcAvg(5000, 20000)*amp;  
        strokeWeight(2);

        if (avgAudio > 6 && avgAudio < 10) { 
          rotate(-2);
        } else {
          rotate(2);
        }

        if (bass > 0 ) { 
          strokeWeight(5);
          // <- up to you if you want a background!
        } else {
          strokeWeight(1.35);
        }







        // D I S T U R B E D   A L P H A B E T
        // M Y S W I T C H   3   B A S E D   O N   B A S S   /   H I G H
      } else if (modeSwitch == 3) {


        strokeWeight(1);
        if (avgAudio>0 ) {
          line(
          random(points[i].x-60, points[i].x), 
          points[i].y, 
          random(points[i].x-60, points[i].x), 
          points[i].y);
        }

        if ( bass >100) {
          line(
          random(points[i].x-300), 
          points[i].y, 
          random(points[i].x-300), 
          points[i].y);
        }
        //println(high);
        if ( high >1.2) {
          line(
          random(points[i].x+300), 
          points[i].y, 
          random(points[i].x+300), 
          points[i].y);
        }
      }
    } 
    endShape();
  }
  popMatrix();
} // END CUSTOM CODE

