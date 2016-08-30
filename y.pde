
/*---- YOUR CUSTOM CODE BELOW ------------------------*/
/*---- PUT OWN VARIABLES JUST BEFORE customSetup()-----*/
// float myCustomVar = 0; 
float speed = 0;

void ySetup() { // custom setup = runs ones
}

void yDraw() { // custom draw = renders fooorever
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
    if (modeSwitch == 1 ) {  



      noFill(); 
      stroke(255); 
      strokeWeight(0.1);

      rotateY(speed);

      speed += 0.1;

      for (int j = 20; j< 40; j++) {


        for (int i=0; i < points.length; i++) { 
          int audioIndex = floor(map(i, 0, points.length, 0, fft.avgSize()));
          float audioLevel = fft.getAvg(audioIndex)*amp;
          //arc(points[i].x / j*20, points[i].y  + audioLevel, 20, 20, PI, TWO_PI);
          ellipse(points[i].x / j*50, points[i].y  + audioLevel, 200, 20);
        }
      }
    } else if (modeSwitch == 2) { 
      fill(233);  
      stroke(0); 
      strokeWeight(0.5);


      rotateY(speed);
      speed += 0.09;

      for (int j = 20; j< 100; j++) {

        beginShape();
        for (int i=0; i < points.length; i++) { 
          int audioIndex = floor(map(i, 2, points.length, 5, fft.avgSize()));
          float audioLevel = fft.getAvg(audioIndex)*amp;
          vertex(points[i].x / 10, points[i].y  + audioLevel);
        }
        endShape();
      }
    } else if (modeSwitch == 3) {   
      noFill();  
      stroke(255); 
      strokeWeight(5);


      rotateY(speed);

      speed += 0.2; // toooo fast

      for (int j = 20; j< 100; j++) {


        for (int i=0; i < points.length; i++) { 
          int audioIndex = floor(map(i, 0, points.length, 0, fft.avgSize()));
          float audioLevel = fft.getAvg(audioIndex)*amp;
          point(points[i].x / 2, points[i].y  + audioLevel);
        }
      }
    } else if (modeSwitch == 4) {   
      //noFill();  
      stroke(255); 
      strokeWeight(5);



      rotateY(speed);
      speed += 0.01;


      for (int j = 2; j< 15; j++) {
        pushMatrix();
        translate(0, 0, -j*1); // USE j somewhere
        //rotateY(j);
        for (int i=0; i < points.length; i++) { 
          int audioIndex = floor(map(i, 0, points.length, 0, fft.avgSize()));
          float audioLevel = fft.getAvg(audioIndex)*amp;
          ellipse(points[i].x / j*10, points[i].y  + audioLevel, 1, 1);
        }
        popMatrix();
      }
    }
  }
  popMatrix();
} // END CUSTOM CODE

/*---- YOUR CUSTOM CODE ABOVE ------------------------*/
