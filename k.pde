float rows = 200;

void kSetup() { // custom setup = runs ones
}

void kDraw() { // custom draw = renders fooorever
  //SETTINGS [change, plz don't delete any]
  credits = "alessandro.thueler + megan.adé"; // put your name[s] here!
  modes = 4; // keys 1-__? max=10 then use if(modeSwitch == __){}
  myTextFont = "FreeSans.ttf"; // ie. "apple_ii.ttf";
  myTextSize = height*.75; // <- custom size
  myTextLength = 15; // <- custom length for cuts
  processType(); // <- function happens below
  background(0); // <- up to you if you want a background!

  //pushMatrix(); // only adjusts translate/scale within matrix
  translate(width/8, height/5.5); // suggestion to draw from center out 
  scale(.5); // <- custom scale of letters

  if (points != null) { // only draw if points ready 
    noFill(); // optional.. 
    stroke(255); // optional...

    if (modeSwitch == 1) {

      for (int z=0; z < rows; z+=1) {

        int audioFreqIndex = floor(map(z, 0, rows, 0, in.bufferSize()));
        float audioFreq = fft.getAvg(audioFreqIndex);

        int audioWaveIndex = floor(map(z, 0, rows, 0, in.bufferSize()));
        float audioWave = fft.getAvg(audioWaveIndex)+2*ampWave/350;


        translate(0, height*0.1);

        rotateY(radians(180));
        //println(mouseX);

        for (int d=0; d < 15; d++) {
          //fill(255);
          translate(-width/2/5, 0);



          for (int f=0; f < points.length; f+=2) {
            fill(0);
            stroke(255);
            strokeWeight(1);
            point(points[f].x*audioWave/20, points[f].y*audioWave/20);
          }
        }
      }
    }
  }

  if (modeSwitch == 2) {

    for (int z=0; z < points.length; z+=1) {

      int audioFreqIndex = floor(map(z, 0, rows, 0, in.bufferSize()));
      float audioFreq = fft.getAvg(audioFreqIndex);

      int audioWaveIndex = floor(map(z, 0, rows, 0, in.bufferSize()));
      float audioWave = fft.getAvg(audioWaveIndex)+2*ampWave/350;


      translate(0, height*0.1);

      rotateY(radians(180));
      //println(mouseX);

      for (int d=0; d < 15; d++) {
        //fill(255);
        translate(-width/2/5, 0);



        for (int f=0; f < points.length; f+=2) {
          fill(0);
          stroke(255);
          strokeWeight(1);
          point(points[f].x*avgAudio/500, points[f].y*avgAudio/500);
        }
      }
    }
  }

  if (modeSwitch == 3) {

    for (int z=0; z < points.length; z+=1) {

      int audioFreqIndex = floor(map(z, 0, rows, 0, in.bufferSize()));
      float audioFreq = fft.getAvg(audioFreqIndex);

      int audioWaveIndex = floor(map(z, 0, rows, 0, in.bufferSize()));
      float audioWave = fft.getAvg(audioWaveIndex)+2*ampWave/350;


      translate(0, height*0.1);

      rotateY(radians(180));
      //println(mouseX);

      for (int d=0; d < 15; d++) {
        //fill(255);
        translate(-width/2/5, 0);



        for (int f=0; f < points.length; f+=2) {
          fill(0);
          stroke(255);
          strokeWeight(1);
          line(0, 0, points[f].x*audioWave/100, points[f].y*audioWave/100);
        }
      }
    }
  }



  if (modeSwitch == 4) {

    for (int z=0; z < points.length; z+=1) {

      int audioFreqIndex = floor(map(z, 0, rows, 0, in.bufferSize()));
      float audioFreq = fft.getAvg(audioFreqIndex);

      int audioWaveIndex = floor(map(z, 0, rows, 0, in.bufferSize()));
      float audioWave = fft.getAvg(audioWaveIndex)+2*ampWave/350;


      translate(0, height*0.1);

      rotateY(radians(180));
      //println(mouseX);

      for (int d=0; d < 15; d++) {
        //fill(255);
        translate(-width/2/5, 0);



        for (int f=0; f < points.length; f+=2) {
          fill(0);
          stroke(255);
          strokeWeight(1);
          line(0, 0, points[f].x*avgAudio/450, points[f].y*avgAudio/450);
        }
      }
    }
  }
}

