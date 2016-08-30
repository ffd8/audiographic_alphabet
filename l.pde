float groesse = .65;
float ct = cos(PI/9.0);
float st = sin(PI/9.0); 
float roamp = .07;

/*---- YOUR CUSTOM CODE BELOW ------------------------*/
/*---- PUT OWN VARIABLES JUST BEFORE customSetup()-----*/
// float myCustomVar = 0; 

void lSetup() { // custom setup = runs ones
}

void lDraw() { // custom draw = renders fooorever
  //SETTINGS [change, plz don't delete any]
  credits = "roman.häfliger"; // put your name[s] here!
  modes = 4; // keys 1-__? max=10 then use if(modeSwitch == __){}
  myTextFont = "FreeSans.ttf"; // ie. "apple_ii.ttf";
  myTextSize = height*.75; // <- custom size
  myTextLength = 15; // <- custom length for cuts
  processType(); // <- function happens below
  background(0); // <- up to you if you want a background!


  if (modeSwitch == 1) {
    pushMatrix(); // only adjusts translate/scale within matrix
    translate(width/2+avgAudio*roamp, height/2-avgAudio*roamp); // suggestion to draw from center out 
    scale(.65); // <- custom scale of letters

    for (int i = 0; i < points.length; i++) {

      int audioFreqIndex = floor(map(i, 0, points.length, 0, fft.avgSize())); 
      float audioFreq = fft.getAvg(audioFreqIndex)*amp; 

      int audioWaveIndex = floor(map(i, 0, points.length, 0, in.bufferSize())); 
      float audioWave = in.left.get(audioWaveIndex)*ampWave; 

      if (points != null) { // only draw if points ready 
        fill(255, 250); // optional.. 
        stroke(0); // optional...
        scale(groesse+audioWave*roamp); // <- custom scale of letters
        strokeWeight(avgAudio*roamp);

        if (audioWave < 30) {
          scale(.5);
        }
        beginShape(); // just demo below.. replace me!
        for (int j=0; j < points.length; j++) { 
          vertex(points[j].x, points[j].y, 3);
        } 
        endShape();

        applyMatrix(  ct, 0.0, st, 0.0, 
        0.0, 1.0, 0.0, 0.0, 
        -st, 0.0, ct, 0.0, 
        0.0, 0.0, 0.0, 1.0);
      }
    }
    popMatrix();
  }



  if (modeSwitch == 3) {
    pushMatrix(); // only adjusts translate/scale within matrix
    translate(width/2+avgAudio*roamp, height/2-avgAudio*roamp); // suggestion to draw from center out 
    scale(.65); // <- custom scale of letters

    for (int i = 0; i < points.length; i++) {

      int audioFreqIndex = floor(map(i, 0, points.length, 0, fft.avgSize())); 
      float audioFreq = fft.getAvg(audioFreqIndex)*amp; 

      int audioWaveIndex = floor(map(i, 0, points.length, 0, in.bufferSize())); 
      float audioWave = in.left.get(audioWaveIndex)*ampWave; 

      if (points != null) { // only draw if points ready 
        fill(0); // optional.. 
        stroke(255); // optional...
        scale(groesse+audioWave*0.1); // <- custom scale of letters
        strokeWeight(3);
        rotate(audioWave*roamp);


        if (audioWave < 30) {
          scale(.5);
        }
        beginShape(); // just demo below.. replace me!
        for (int j=0; j < points.length; j++) { 
          vertex(points[j].x, points[j].y, 3);
        } 
        endShape();

        applyMatrix(  ct, 0.0, st, 0.0, 
        0.0, 1.0, 0.0, 0.0, 
        -st, 0.0, ct, 0.0, 
        0.0, 0.0, 0.0, 1.0);
      }
    }
    popMatrix();
  }

  if (modeSwitch == 2) {
    pushMatrix(); // only adjusts translate/scale within matrix
    translate(width/2+avgAudio*roamp, height/2-avgAudio*roamp); // suggestion to draw from center out 
    scale(.65); // <- custom scale of letters

    for (int i = 0; i < points.length; i++) {

      int audioFreqIndex = floor(map(i, 0, points.length, 0, fft.avgSize())); 
      float audioFreq = fft.getAvg(audioFreqIndex)*amp; 

      int audioWaveIndex = floor(map(i, 0, points.length, 0, in.bufferSize())); 
      float audioWave = in.left.get(audioWaveIndex)*ampWave; 

      if (points != null) { // only draw if points ready 
        fill(255, 250); // optional.. 
        stroke(0); // optional...
        scale(groesse+audioWave*roamp); // <- custom scale of letters
        strokeWeight(7);
        rotate(audioWave/10*roamp);

        if (audioWave < 30) {
          scale(.5);
        }
        beginShape(); // just demo below.. replace me!
        for (int j=0; j < points.length; j++) { 
          vertex(points[j].x, points[j].y, 3);
        } 
        endShape();

        applyMatrix(  ct, 0.0, st, 0.0, 
        0.0, 1.0, 0.0, 0.0, 
        -st, 0.0, ct, 0.0, 
        0.0, 0.0, 0.0, 1.0);
      }
    }
    popMatrix();
  }


  if (modeSwitch == 4) {
    pushMatrix(); // only adjusts translate/scale within matrix
    translate(width/2+avgAudio*roamp, height/2-avgAudio*roamp); // suggestion to draw from center out 
    scale(.65); // <- custom scale of letters

    for (int i = 0; i < points.length; i++) {

      int audioFreqIndex = floor(map(i, 0, points.length, 0, fft.avgSize())); 
      float audioFreq = fft.getAvg(audioFreqIndex)*amp; 

      int audioWaveIndex = floor(map(i, 0, points.length, 0, in.bufferSize())); 
      float audioWave = in.left.get(audioWaveIndex)*ampWave; 

      if (points != null) { // only draw if points ready 


        lights();
        noStroke();
        fill(random(255), random(255), random(255));
        sphere(avgAudio*.0000000000001);
        noFill();
        stroke(255); // optional...
        scale(groesse+audioWave*roamp); // <- custom scale of letters
        strokeWeight(7);

        if (audioWave < 30) {
          scale(.5);
        }
        beginShape(); // just demo below.. replace me!
        for (int j=0; j < points.length; j++) { 
          vertex(points[j].x, points[j].y, 3);
        } 
        endShape();

        applyMatrix(  ct, 0.0, st, 0.0, 
        0.0, 1.0, 0.0, 0.0, 
        -st, 0.0, ct, 0.0, 
        0.0, 0.0, 0.0, 1.0);
      }
    }
    popMatrix();
  }
}

