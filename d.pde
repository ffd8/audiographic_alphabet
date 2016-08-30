// float myCustomVar = 0; 

void dSetup() { // custom setup = runs ones
}

void dDraw() { // custom draw = renders fooorever
  //SETTINGS [change, plz don't delete any]
  credits = "aline.wagner + adriano.diethelm"; // put your name[s] here!
  modes = 3; // keys 1-__? max=10 then use if(modeSwitch == __){}
  myTextFont = "FreeSans.ttf"; // ie. "apple_ii.ttf";
  myTextSize = height*.5; // <- custom size
  myTextLength = 15; // <- custom length for cuts
  processType(); // <- function happens below
  background(0); // <- up to you if you want a background!

  pushMatrix(); // only adjusts translate/scale within matrix
  translate(width/2, height/2); // suggestion to draw from center out 
  scale(.5); // <- custom scale of letters

  if (points != null) { // only draw if points ready 
    noFill(); // optional.. 
    stroke(255); // optional...

    // all points together! 
    for (int i=0; i < points.length; i++) { // points.length = number of points being stored 



      if (modeSwitch == 1) {
        // some code

        if (avgAudio > 75) {
          rotate(45);
          strokeWeight(avgAudio*.05); 

          //SKETCH 1
          if (points[i].x<0 && points[i].y<0) {

            line(points[i].x, points[i].y, (points[i].x)*avgAudio/2, (points[i].y)*avgAudio/2); // try other shapes with points[i].x/y!
          } else if (points[i].x>0 && points[i].y<0) {

            line(points[i].x, points[i].y, (points[i].x)*avgAudio/2, (points[i].y)*avgAudio/2); // try other shapes with points[i].x/y!
          } else if (points[i].x>0 && points[i].y>0) {

            line(points[i].x, points[i].y, (points[i].x)*avgAudio/2, (points[i].y)*avgAudio/2); // try other shapes with points[i].x/y!
          } else if (points[i].x<0 && points[i].y>0) {

            line(points[i].x, points[i].y, (points[i].x)*avgAudio/2, (points[i].y)*avgAudio/2); // try other shapes with points[i].x/y!
          }
        }

        if (avgAudio <75) {
          strokeWeight(avgAudio*.05); 

          if (points[i].x<0 && points[i].y<0) {

            line(points[i].x, points[i].y, (points[i].x)*avgAudio/2, (points[i].y)*avgAudio/2); // try other shapes with points[i].x/y!
          } else if (points[i].x>0 && points[i].y<0) {

            line(points[i].x, points[i].y, (points[i].x)*avgAudio/2, (points[i].y)*avgAudio/2); // try other shapes with points[i].x/y!
          } else if (points[i].x>0 && points[i].y>0) {

            line(points[i].x, points[i].y, (points[i].x)*avgAudio/2, (points[i].y)*avgAudio/2); // try other shapes with points[i].x/y!
          } else if (points[i].x<0 && points[i].y>0) {

            line(points[i].x, points[i].y, (points[i].x)*avgAudio/2, (points[i].y)*avgAudio/2); // try other shapes with points[i].x/y!
          }
        }
      } else if (modeSwitch == 2) {
        // some code

        //SKETCH2
        if (avgAudio > 75) {


          if (points[i].x<0 && points[i].y<0) {
            strokeWeight(1.5); 
            rotate(45);


            ellipse(points[i].x, points[i].y, (points[i].x)*avgAudio/10, (points[i].y)*avgAudio/10); // try other shapes with points[i].x/y!
          }
        }

        if (avgAudio < 75) {

          strokeWeight(avgAudio*.05); 

          if (points[i].x<0 && points[i].y<0) {

            line(points[i].x, points[i].y, (points[i].x)*avgAudio/2, (points[i].y)*avgAudio/2); // try other shapes with points[i].x/y!
          } else if (points[i].x>0 && points[i].y<0) {

            line(points[i].x, points[i].y, (points[i].x)*avgAudio/2, (points[i].y)*avgAudio/2); // try other shapes with points[i].x/y!
          } else if (points[i].x>0 && points[i].y>0) {

            line(points[i].x, points[i].y, (points[i].x)*avgAudio/2, (points[i].y)*avgAudio/2); // try other shapes with points[i].x/y!
          } else if (points[i].x<0 && points[i].y>0) {

            line(points[i].x, points[i].y, (points[i].x)*avgAudio/2, (points[i].y)*avgAudio/2); // try other shapes with points[i].x/y!
          }
        }
      } else if (modeSwitch == 3) {
        // some code

        //SKETCH3
        if (avgAudio > 75) {
          strokeWeight(1.5); 
          rotate(45);


          if (points[i].x<0 && points[i].y<0) {

            rect(points[i].x, points[i].y, (points[i].x)*avgAudio/20, (points[i].y)*avgAudio/20); // try other shapes with points[i].x/y!
          } else if (points[i].x>0 && points[i].y<0) {

            rect(points[i].x, points[i].y, (points[i].x)*avgAudio/20, (points[i].y)*avgAudio/20); // try other shapes with points[i].x/y!
          } else if (points[i].x>0 && points[i].y>0) {

            rect(points[i].x, points[i].y, (points[i].x)*avgAudio/20, (points[i].y)*avgAudio/20); // try other shapes with points[i].x/y!
          } else if (points[i].x<0 && points[i].y>0) {

            rect(points[i].x, points[i].y, (points[i].x)*avgAudio/20, (points[i].y)*avgAudio/20); // try other shapes with points[i].x/y!
          }
        }

        if (avgAudio < 75) {
          strokeWeight(avgAudio*.05); 

          if (points[i].x<0 && points[i].y<0) {

            line(points[i].x, points[i].y, (points[i].x)*avgAudio/2, (points[i].y)*avgAudio/2); // try other shapes with points[i].x/y!
          } else if (points[i].x>0 && points[i].y<0) {

            line(points[i].x, points[i].y, (points[i].x)*avgAudio/2, (points[i].y)*avgAudio/2); // try other shapes with points[i].x/y!
          } else if (points[i].x>0 && points[i].y>0) {

            line(points[i].x, points[i].y, (points[i].x)*avgAudio/2, (points[i].y)*avgAudio/2); // try other shapes with points[i].x/y!
          } else if (points[i].x<0 && points[i].y>0) {

            line(points[i].x, points[i].y, (points[i].x)*avgAudio/2, (points[i].y)*avgAudio/2); // try other shapes with points[i].x/y!
          }
        }
      }
    }
  }

  popMatrix();
} // END CUSTOM CODE

