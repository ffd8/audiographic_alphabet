
/*---- YOUR CUSTOM CODE BELOW ------------------------*/
/*---- PUT OWN VARIABLES JUST BEFORE customSetup()-----*/
// float myCustomVar = 0; 
//float speed = 0;
//float bass; 
void cSetup() { // custom setup = runs ones
}

void cDraw() { // custom draw = renders fooorever
  //SETTINGS [change, plz don't delete any]
  credits = "rahel.sarasin + joanna.selinger + aline.petrò"; // put your name[s] here!
  modes = 4; // keys 1-__? max=10 then use if(modeSwitch == __){}
  myTextFont = "FreeSans.ttf"; // ie. "apple_ii.ttf";
  myTextSize = height*.75; // <- custom size
  myTextLength = 15; // <- custom length for cuts
  processType(); // <- function happens below
  //background(0); // <- up to you if you want a background!

  if (modeSwitch == 1  || modeSwitch == 3 || modeSwitch == 4) {
    fill(0, 30);
    noStroke();
    rect(0, 0, width*2, height*2);
    fill(255);
  }

  pushMatrix(); // only adjusts translate/scale within matrix


    translate(width/2, height/2); // suggestion to draw from center out 



  scale(.65); // <- custom scale of letters

  if (points != null) { 
    if (modeSwitch == 1 ) {  




      stroke(255); 

      rotateY(random(X));

      speed += 0.0009;

      for (int j = 10; j< 30; j++) {
        translate (1, 1, j*5);

        for (int i=0; i < points.length; i++) { 
          int audioIndex = floor(map(i, 0, points.length, 0, fft.avgSize()));
          float audioLevel = fft.getAvg(audioIndex)*amp;
          //point(points[i].x / j*10, points[i].y  + audioLevel);
          rect(points[i].x / j*20, points[i].y  + audioLevel, 1, 100);
        }
      }
    } else if (modeSwitch == 2) { 
      background(0);
      //stroke(255); 
      strokeWeight(0.5);




      rotateX(speed*Y);
      speed += 0.002;

      for (int j = 20; j< 25; j++) {
        translate(1, 2, j);




        beginShape();
        for (int i=1; i < points.length; i++) { 
          int audioIndex = floor(map(i, 0, points.length, 0, fft.avgSize()));
          float audioLevel = fft.getAvg(audioIndex)*amp;
          line(points[i].x*50 / j*10, points[i].y  + audioLevel, 10, 40);
        }
        endShape();
      }
    } else if (modeSwitch == 3) {   
      noFill();  
      stroke(255); 
      strokeWeight(1);



      speed += 0.0009; // toooo fast

      for (int j = 20; j< 40; j++) {
        translate(5, 2, j*20);
        rotateY(Z);

        for (int i=0; i < points.length; i++) { 
          int audioIndex = floor(map(i, 0, points.length, 0, fft.avgSize()));
          float audioLevel = fft.getAvg(audioIndex)*amp;
          //point(points[i].x / j*40, points[i].y  + audioLevel*50);
          ellipse(points[i].x / j*10, points[i].y  + j*audioLevel, 1, 5);
        }
      }
    } else if (modeSwitch == 4) {   

      strokeWeight(0.25);



      rotateY(radians(speed));
      speed += .01*avgAudio;


      for (int j = 20; j< 30; j++) {
        pushMatrix();
        translate(0, 0, j*10); // USE j somewhere
        //rotateY(j);
        for (int i=0; i < points.length; i++) { 
          int audioIndex = floor(map(i, 0, points.length, 0, fft.avgSize()));
          float audioLevel = fft.getAvg(audioIndex)*amp;
          ellipse(points[i].x / j*20, points[i].y  + audioLevel, 50, 5);
        }
        popMatrix();
      }
    }
  }
  popMatrix();
} // END CUSTOM CODE

