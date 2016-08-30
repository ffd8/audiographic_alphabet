//float m = .1;

/*---- YOUR CUSTOM CODE BELOW ------------------------*/
/*---- PUT OWN VARIABLES JUST BEFORE customSetup()-----*/
// float myCustomVar = 0; 

void qSetup() { 
  m = .1;
  // custom setup = runs ones
}

void qDraw() { // custom draw = renders fooorever
  //SETTINGS [change, plz don't delete any]
  credits = "lukas.blum"; // put your name[s] here!
  modes = 3; // keys 1-__? max=10 then use if(modeSwitch == __){}
  myTextFont = "FreeSans.ttf"; // ie. "apple_ii.ttf";
  myTextSize = height*.75; // <- custom size
  myTextLength = 15; // <- custom length for cuts
  processType(); // <- function happens below
  background(0); // <- up to you if you want a background!

  //pushMatrix(); // only adjusts translate/scale within matrix
  translate(width/2, height/2); // suggestion to draw from center out 
  scale(m); // <- custom scale of letters

  if (points != null) { // only draw if points ready 
    noFill(); // optional.. 
    stroke(255); // optional...

    //println(avgAudio +" / "+amp*30);


    m += 0.01;

    if (avgAudio >= amp*30 || m > 3) {

      m = .5;
    } 

    if (modeSwitch == 3) {
      beginShape(); 
      for (int i=0; i < points.length; i++) { 
        vertex(points[i].x, points[i].y);
        int audioindex = floor(map(i, 0, points.length, 0, fft.avgSize()));  
        float audiolLevel = fft.getAvg(audioindex)*amp*.25;
        //noFill();
        stroke(255);
        //ellipse(points[i].x, points[i].y,audiolLevel+1, audiolLevel+1);
        line(points[i].x, points[i].y, audiolLevel+1, audiolLevel+1);
        //rotateZ(speed);
      } 
      endShape();
    }

    if (modeSwitch == 1) {


      beginShape(); 
      for (int i=0; i < points.length; i++) { 
        vertex(points[i].x, points[i].y);
        int audioindex = floor(map(i, 0, points.length, 0, fft.avgSize()));  
        float audiolLevel = fft.getAvg(audioindex)*amp;
        //noFill();
        stroke(255);
        //ellipse(points[i].x, points[i].y,audiolLevel+1, audiolLevel+1);
        ellipse(points[i].x, points[i].y, points[i].x, audiolLevel+1);
        //rotateY(10);
      } 
      endShape();
    }

    if (modeSwitch == 2) {


      beginShape(); 
      for (int i=0; i < points.length; i++) { 
        vertex(points[i].x, points[i].y);
        int audioindex = floor(map(i, 0, points.length, 0, fft.avgSize()));  
        float audiolLevel = fft.getAvg(audioindex)*amp;

        stroke(255);
        //ellipse(points[i].x, points[i].y,audiolLevel+1, audiolLevel+1);
        ellipse(points[i].x, points[i].y, audiolLevel+1, audiolLevel+1);
        rotateY(10);
      } 
      endShape();
    }
  }
} 

