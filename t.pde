/*---- YOUR CUSTOM CODE BELOW ------------------------*/
/*---- PUT OWN VARIABLES JUST BEFORE customCode()-----*/
// float myCustomVar = 0; 

PImage fade;

//wave
float vitesse=10;
float rayon=5;
float positionY=0;
float positionX=0;
float noiseX = 50;

//Audio ranges
float bass1=0.0;
float mid1=0.0;
float high1=0.0;

void tSetup() { // custom setup = runs ones 
  background(0);
  fade = get(0, 0, width, height);

  smooth();
}

void tDraw() { // custom draw = renders fooorever
  RG.setPolygonizerLength(600-avgAudio*amp);
  credits = "minyoung.kim"; // put your name[s] here!
  modes = 2; // keys 1-__? max=10 then use if(modeSwitch == __){}
  myTextFont = "FreeSans.ttf"; // ie. "apple_ii.ttf";
  myTextSize = height*.75; // <- custom size
  myTextLength = 15; // <- custom length for cuts
  processType(); // <- function happens below
  background(0); // <- up to you if you want a background!
  //println(avgAudio*amp);

  //tint(255,255,255,252);
  tint(255, 255, 255, 240);
  image(fade, 0, 0);
  noTint();


  pushMatrix();
  translate(width/2, height/2); // suggestion to draw from center out 
  scale(.5); // <- custom scale of letters

  // CUSTOMIZE WITHIN CODE BELOW 

  bass1 = fft.calcAvg(0, 1000)*amp;
  mid1 = fft.calcAvg(1000, 5000)*amp;
  high1 = fft.calcAvg(5000, 20000)*amp;

  if (points != null) { // only draw if we have points 
    fill(255); 
    noStroke(); 

    if (modeSwitch == 1) {
      beginShape();
      for (int i=0; i < points.length; i++) { // points.length = number of points being stored 
        int audioIndex = floor(map(i, 0, points.length, 0, fft.avgSize()));
        float audioLevel = fft.getAvg(audioIndex)*amp;

        int audioFreqIndex = floor(map(i, 0, points.length, 0, fft.avgSize())); 
        float audioFreq = fft.getAvg(audioFreqIndex)*amp; 

        int audioWaveIndex = floor(map(i, 0, points.length, 0, in.bufferSize())); 
        float audioWave = in.left.get(audioWaveIndex)*ampWave; 

        float audioBass = fft.getAvg(audioIndex)*bass1;
        float audioMid = fft.getAvg(audioIndex)*mid1;
        float audioHigh = fft.getAvg(audioIndex)*high1;

        int evenUneven = i%2;
        if (evenUneven ==1) {
          noFill();
        } else {
          fill(255);
        }
        if (audioLevel<5*amp) {
          ellipse(points[i].x, points[i].y, map(audioWave, 0, 5, 0, 10), map(audioWave, 0, 5, 0, 10));
        } else if (audioLevel>=5*amp && audioLevel<10*amp) {
          ellipse(points[i].x, points[i].y, audioWave-20, audioWave-20);
        } else {
          //vertex(points[i].x, points[i].y);
          //ellipse(points[i].x, points[i].y, audioLevel/10, audioLevel/10);
        }

        noFill();
        stroke(255);

        float curvePointX = map(random(25, 150), 0, audioBass, 0, audioMid);
        float curvePointY = map(random(0, 125), 0, audioMid, 0, audioHigh);
        //println(curvePointX+", "+curvePointY);
        pushMatrix(); // keeps one shape from effecting the next one 
        translate(points[i].x, points[i].y, 0); // puts next rectangle further into Z/depth axis 
        rotate(radians(i*amp));
        line(points[i].x, points[i].y, curvePointX, curvePointY);
        popMatrix(); // place back onto sketch canvas
      }

      endShape();
    }
    if (modeSwitch == 2) {
      beginShape();
      for (int i=0; i < points.length; i++) { // points.length = number of points being stored 
        int audioIndex = floor(map(i, 0, points.length, 0, fft.avgSize()));
        float audioLevel = fft.getAvg(audioIndex)*amp;

        int audioFreqIndex = floor(map(i, 0, points.length, 0, fft.avgSize())); 
        float audioFreq = fft.getAvg(audioFreqIndex)*amp; 

        int audioWaveIndex = floor(map(i, 0, points.length, 0, in.bufferSize())); 
        float audioWave = in.left.get(audioWaveIndex)*ampWave; 

        float audioBass = fft.getAvg(audioIndex)*bass1;
        float audioMid = fft.getAvg(audioIndex)*mid1;
        float audioHigh = fft.getAvg(audioIndex)*high1;
        //println(audioWave);
        ellipse(points[i].x, points[i].y, map(audioWave, 0, 5, 0, 10), map(audioWave, 0, 5, 0, 10));
        for (int j=0; j<5; j++) {
          pushMatrix();
          translate(0, 0, amp);
          ellipse(points[i].x+(audioWave*j*10), points[i].y, map(audioWave, 0, 5, 0, 5), map(audioWave, 0, 5, 0, 5));
          popMatrix();
        }
      }
    }
  } 
  popMatrix();
  fade = get(0, 0, width, height);
} // END CUSTOM CODE

/*---- YOUR CUSTOM CODE ABOVE ------------------------*/
