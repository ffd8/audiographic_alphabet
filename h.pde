//float bass; 
//float mid; 
//float high;
//float m= 0;

/*---- YOUR CUSTOM CODE BELOW ------------------------*/
/*---- PUT OWN VARIABLES JUST BEFORE customSetup()-----*/
// float myCustomVar = 0; 

void hSetup() { // custom setup = runs ones
}

void hDraw() { // custom draw = renders fooorever
  //SETTINGS [change, plz don't delete any]
  credits = "viviane.joller"; // put your name[s] here!
  modes = 3; // keys 1-__? max=10 then use if(modeSwitch == __){}
  myTextFont = "FreeSans.ttf"; // ie. "apple_ii.ttf";
  myTextSize = height/2; // <- custom size
  myTextLength = 15; // <- custom length for cuts
  processType(); // <- function happens below
  // <- up to you if you want a background!
  float shrinkAmp = 1;




  if (modeSwitch == 2) {
    pushMatrix(); // only adjusts translate/scale within matrix
    translate(width/2, height/2); // suggestion to draw from center out 
    scale(.65); // <- custom scale of letters

    if (points != null) { // only draw if points ready 
      fill(avgAudio); // optional.. 
      stroke(255 + avgAudio); // optional...
      rotateZ(avgAudio*shrinkAmp);
      background(0);





      beginShape(); // just demo below.. replace me!
      for (int i=0; i < points.length; i++) { 
        triangle(points[i].x, points[i].y, avgAudio*i, amp, amp, amp);
        vertex(points[i].x, points[i].y, avgAudio*shrinkAmp);
      } 

      if (avgAudio > 60) { 
        beginShape(); 
        for (int i=0; i < points.length; i++) { 
          vertex(points[i].x, points[i].y, avgAudio*shrinkAmp);
          fill(255);
        } 
        endShape();
      }
    }
    popMatrix();
  } else if (modeSwitch == 1) { 

    pushMatrix(); // only adjusts translate/scale within matrix
    translate(width/2, height/2); // suggestion to draw from center out 
    scale(.65); // <- custom scale of letters

    if (points != null) { // only draw if points ready 
      fill(255+avgAudio); // optional.. 
      stroke(255+avgAudio); // optional...
      rotateZ(0);
      background(avgAudio);

      beginShape(); // just demo below.. replace me!
      for (int i=0; i < points.length; i++) { 
        // rect(points[i].x, points[i].y, avgAudio*50,10,10);
        line(points[i].x, points[i].y, -20*avgAudio, 10);
        line(points[i].x, points[i].y, avgAudio*20, 10);
      } 

      if (avgAudio > 30) { 
        beginShape(); 
        for (int i=0; i < points.length; i++) { 
          triangle(points[i].x, points[i].y, 5, 5, 5, 5);
          fill(255);
        } 
        endShape();
      }
    }
    popMatrix();
  }




  if (modeSwitch == 3) {
    pushMatrix(); // only adjusts translate/scale within matrix
    translate(width/2, height/2); // suggestion to draw from center out 
    scale(1); // <- custom scale of letters

    if (points != null) { // only draw if points ready 
      fill(avgAudio); // optional.. 
      stroke(255+avgAudio); // optional...

      rotateY(avgAudio);
      background(0);


      beginShape(); // just demo below.. replace me!
      for (int i=0; i < points.length; i++) { 
        rect(points[i].x, points[i].y, avgAudio, avgAudio);
        vertex(points[i].x, points[i].y, avgAudio*shrinkAmp);
      } 

      if (avgAudio > 10) { 
        beginShape(); 
        for (int i=0; i < points.length; i++) { 
          vertex(points[i].x, points[i].y, avgAudio*shrinkAmp);
          fill(255);
        } 
        endShape();
      }
    }
    popMatrix();
  }
}

// END CUSTOM CODE

/*---- YOUR CUSTOM CODE ABOVE ------------------------*/


