/*---- YOUR CUSTOM CODE BELOW ------------------------*/
/*---- PUT OWN VARIABLES JUST BEFORE customSetup()-----*/
// float myCustomVar = 0; 
//BeatDetect beat;
int amountOfLines = 20 ; 
float s;                   //Separation between liens
float[][] ffts= new float[20][512];
int fftSel = 0;

float mAudio(float x, int y) {
  x*=0.01;
  float currentValue = -noise(x+width, frameCount*0.02, fft.getBand(y)); //Add width (or any number in order to make x postive) so I dont get a symetric function 
  if (x==0) return currentValue;
  return currentValue*pow(sin(x)/x, 4); //currentValue modulated by Sinc, idea from how light difracts
}

void eSetup() { // custom setup = runs ones
  smooth();
  background(-1);
  //beat = new BeatDetect();
  // fft.noAverages();

  s=(height-ampWave)/amountOfLines;
}

void eDraw() { // custom draw = renders fooorever
  //SETTINGS [change, plz don't delete any]
  credits = "mayar.elhayawan + céline.degrenus"; // put your name[s] here!
  modes = 1; // keys 1-__? max=10 then use if(modeSwitch == __){}
  myTextFont = "FreeSans.ttf"; // ie. "apple_ii.ttf";
  myTextSize = height*.75; // <- custom size
  myTextLength = 43; // <- custom length for cuts
  processType(); // <- function happens below
  //background(0); // <- up to you if you want a background!
  pushMatrix(); // only adjusts translate/scale within matrix

    fill(#000000, 10);
  rect(0, 0, width*2, height*2);


  //beat.detect(in.mix);
  translate(width/2, height/10);

  int start = -width/4;
  int end = width/4;

  for (int i=0; i < fft.specSize (); i++) {   
    ffts[fftSel][i] = fft.getBand(i);
  } 
  fftSel++;
  if (fftSel > amountOfLines-1) {
    fftSel = 0;
  }

  for (int j=0; j < amountOfLines; j++) {
    beginShape();  
    for (int i=0; i < fft.specSize (); i++) { 
      float x = map(i, 0, fft.specSize(), 0, width);  
      float y = height/amountOfLines * j;
      float a = ffts[j][i];
      vertex(x, y+a*amp/3);
    }
    endShape();
  }
  for (int j=0; j < amountOfLines; j++) {
    beginShape();  
    for (int i=0; i < fft.specSize (); i++) { 
      float x = -map(i, 0, fft.specSize(), 0, width);  
      float y = height/amountOfLines * j;
      float a = ffts[j][i];
      vertex(x, y+a*amp/3);
    }
    endShape();
  }
  noFill();
  stroke(255);
  /*
  pushMatrix();
   
   
   for (int j=0; j<amountOfLines; j++) { //Black shape under White Line / this is where the magic happens
   
   //White Line
   noFill();
   stroke(255);
   }
   
   popMatrix();
   */
  if (points != null) { // only draw if we have points 
    noFill(); 
    stroke(255); 
    translate(width/9, height/2.5); // where to draw points 

    // all points together! 
    beginShape();
    scale(0.45) ;
    for (int i=0; i < points.length; i++) {
      int audioIndex = floor(map(i, 0, points.length, 0, fft.avgSize())); // points.length = number of points being stored 
      float audioLevel = fft.getAvg(audioIndex)*amp;
      vertex(points[i].x, points[i].y+fft.getBand(i)*amp); // try other shapes with points[i].x/y!
    } 
    endShape();
    // }

    //if (points != null) { // only draw if we have points 
    noFill(); 
    stroke(255); 
    translate(-width/2, height/250);

    // all points together! 
    beginShape(); 
    scale(-1, 1);
    for (int i=0; i < points.length; i++) {
      int audioIndex = floor(map(i, 0, points.length, 0, fft.avgSize())); // points.length = number of points being stored 
      float audioLevel = fft.getAvg(audioIndex)*amp;
      vertex(points[i].x, points[i].y+ fft.getBand(i)*amp); // try other shapes with points[i].x/y!
    } 
    endShape();
  }
  popMatrix();
} // END CUSTOM CODE

/*---- YOUR CUSTOM CODE ABOVE ------------------------*/
