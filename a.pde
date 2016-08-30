

void aSetup() { // custom setup = runs ones

  float x, y, z;
  x = width/2;
  y = height/2;
  z = 0;
}

void aDraw() { // custom draw = renders fooorever
  //SETTINGS [change, plz don't delete any]
  credits = "christian.löffel"; // put your name[s] here!
  modes = 3; // keys 1-__? max=10 then use if(modeSwitch == __){}
  myTextFont = "FreeSans.ttf"; // ie. "apple_ii.ttf";
  myTextSize = height*.75; // <- custom size
  myTextLength = 15; // <- custom length for cuts
  processType(); // <- function happens below
  //background(0); // <- up to you if you want a background!



  pushMatrix(); // only adjusts translate/scale within matrix
  fill(0, 15);
  noStroke ();
  if(modeSwitch != 2){
    rect(0, 0, width*2, height*2); 
  }else{
    background(0);
  }
  translate(width/2, height/2); // suggestion to draw from center out 
  scale(.65); // <- custom scale of letters

  if (points != null) { // only draw if points ready 
    // for (int f=0; f < bassFade.length; f++) { 
    // float bassColor = map(f, 0, bassFade.length-1, 255, 0);

    //noFill();


    if (modeSwitch == 3) {

      for (int j=1; j < 20; j++) {
        pushMatrix();
        strokeWeight(2);
        stroke(255, 255, 255, amp);
        fill(50, 50, 50, avgAudio/20);

        if (j%2==0) {
          rotateZ(-avgAudio*0.002*j/20);
        } else {
          rotateZ(avgAudio*0.002*j/20);
        }

        /*if(avgAudio > 70){  //LITTLE BIG QUESTION 
         z +=10;
         }  
         */
        beginShape(); 
        for (int i=0; i < points.length; i++) { 
          vertex(points[i].x, points[i].y);
        } 
        endShape();
        popMatrix();
      }
    } // END IF SwitchMode 1
    else if (modeSwitch == 2) {
      //fill(0, 15);
      //rect(-800, -500, width*2, height*2);
      strokeWeight(4+0.01*avgAudio);
      stroke(255, 255, 255);
      for (int j=1; j < 20; j++) {
        pushMatrix();
        if (j%2==0) {
          translate(0, 0, 20*m+avgAudio);
          //rotateZ(avgAudio*0.002);
          fill(255, 15);
          //z++; // The rectangle moves forward as z increments.
          m += (avgAudio/1000); // linear motion
          //translate(width/2, height/2);
          //rotateZ(-avgAudio*0.002*j);
          //rotateY(-avgAudio*0.002*j);
        }
        if (m > 35) {
          m = 0;
          translate(0, 0, 20*m+avgAudio);
        }
        /*else if(z > 50){
         z = 0;
         }*/
        endShape();
        /*if(avgAudio > 70){  //LITTLE BIG QUESTION 
         z +=10;
         }  
         */
        beginShape(); 
        for (int i=0; i < points.length; i++) { 
          point(points[i].x+random(0, 5), points[i].y+random(0, 5));
        }




        popMatrix();
      }
      for (int j=1; j < 20; j++) {
        pushMatrix();
        if (j%2==0) {
          translate(0, 0, 20*(m-10)+avgAudio);
          fill(255, 15);
          //z++; // The rectangle moves forward as z increments.
          m += (avgAudio/1000); // linear motion
          //translate(width/2, height/2);
          //rotateZ(-avgAudio*0.002*j);
          //rotateY(-avgAudio*0.002*j);
        }
        if (m > 35) {
          m = 0;
          translate(0, 0, 20*m+avgAudio);
        }
        /*else if(z > 50){
         z = 0;
         }*/
        endShape();
        /*if(avgAudio > 70){  //LITTLE BIG QUESTION 
         z +=10;
         }  
         */
        beginShape(); 
        for (int i=0; i < points.length; i++) { 
          point(points[i].x+random(0, 5), points[i].y+random(0, 5));
        }




        popMatrix();
      }
    } // END OF Switch Mode 2
    else if (modeSwitch == 1) {

      m += (avgAudio/4000); // linear motion


      for (int j=1; j < 20; j++) {
        pushMatrix();
        strokeWeight(1);
        stroke(255, 255, 255, amp);
        noFill();

        if (j%2==0) {
          fill(255, 5);
          rotateX(3*m);
          rotateY(3*m);
        } else {
          fill(255, 5);
          rotateZ(2.5*m);
          rotateY(3.5*m);
        }

        /*if(avgAudio > 70){  //LITTLE BIG QUESTION 
         z +=10;
         }  
         */
        beginShape(); 
        for (int i=0; i < points.length; i++) { 
          vertex(points[i].x, points[i].y);
        } 
        endShape();
        popMatrix();
      }
    }
    // END IF ModeSwitch 3
  } 

  popMatrix();
}

