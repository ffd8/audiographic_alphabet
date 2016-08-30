//float speed = 0;
//float bass; 

void xSetup() { // custom setup = runs ones
}

void xDraw() { // custom draw = renders fooorever
  //SETTINGS [change, plz don't delete any]
  credits = "rahel.sarasin + joanna.selinger + aline.petrò"; // put your name[s] here!
  modes = 4; // keys 1-__? max=10 then use if(modeSwitch == __){}
  myTextFont = "FreeSans.ttf"; // ie. "apple_ii.ttf";
  myTextSize = height*.75; // <- custom size
  myTextLength = 15; // <- custom length for cuts
  processType(); // <- function happens below
  background(0); // <- up to you if you want a background!

  pushMatrix(); // only adjusts translate/scale within matrix
  translate(width/2, height/2); // suggestion to draw from center out 
  scale(.65); // <- custom scale of letters

  if (points != null) { 
    if (modeSwitch == 2 ) {  
      noFill(); 
      stroke(255);
      rotateX(speed);
      speed += 0.01;

      for (int j = 20; j< 30; j++) {

        pushMatrix();
        translate(j, 0, j*10); // USE j somewhere
        //rotateY(j);


        for (int i=0; i < points.length; i++) { 
          int audioIndex = floor(map(i, 0, points.length, 0, fft.avgSize()));
          float audioLevel = fft.getAvg(audioIndex)*amp;
          //arc(points[i].x / j*20, points[i].y  + audioLevel, 20, 20, PI, TWO_PI);
          line(points[i].x, points[i].y  + audioLevel, 5 * audioLevel, points[i].y + audioLevel );
        }
        popMatrix();
      }
    } else if (modeSwitch == 1) { 
      noFill();  
      stroke(255); 
      strokeWeight(1);


      rotateY(radians(speed)); // added radians(), perhaps forgotten?
      speed += 0.09;

      for (int j = 20; j< 50; j++) {
        translate(-j*0.77, 2, 0); // USE j somewhere
        rotateY(j);

        beginShape();
        for (int i=0; i < points.length; i++) { 
          int audioIndex = floor(map(i, 0, points.length, 0, fft.avgSize()));
          float audioLevel = fft.getAvg(audioIndex)*amp;
          vertex(points[i].x / j*70, points[i].y  + audioLevel);
        }
        endShape();
      }
    } else if (modeSwitch == 3) {   
      noFill();  
      stroke(255); 
      strokeWeight(0.5);
      rotateY(speed);

      speed += 0.02; // toooo fast

      for (int j = 20; j< 30; j++) {

        pushMatrix();
        translate(0, 0, j); // USE j somewhere
        rotateX(radians(j));
        rotateY(0);


        for (int i=0; i < points.length; i++) { 
          int audioIndex = floor(map(i, 0, points.length, 0, fft.avgSize()));
          float audioLevel = fft.getAvg(audioIndex)*amp;
          line(0 * audioLevel, points[i].y  * audioLevel, points[i].x + j*4, points[i].y);
        }
        popMatrix();
      }
    } else if (modeSwitch == 4) {   
      //noFill();  
      stroke(255); 
      strokeWeight(0.2);
      rotateY(speed);
      speed += 0.09;


      for (int j = 20; j< 30; j++) {
        pushMatrix();
        translate(j/2, 0, j*4); // USE j somewhere
        rotateX(j);
        for (int i=0; i < points.length; i++) { 
          int audioIndex = floor(map(i, 0, points.length, 0, fft.avgSize()));
          float audioLevel = fft.getAvg(audioIndex)*amp;
          ellipse(points[i].x / j*5, points[i].y  / audioLevel, j*5/audioLevel, audioLevel/5);
        }
        popMatrix();
      }
    }
  }
  popMatrix();
} 

