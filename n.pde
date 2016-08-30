// float myCustomVar = 0; 

//float bass; 
float mid; 
float high; 

int frames = 3; 
float bassFade[] = new float[frames]; // don't forget, this means 0-5 
float midFade[] = new float[frames]; // don't forget, this means 0-23 
float highFade[] = new float[frames]; // don't forget, this means 0-23 

float customAmp = .1;
float shrinkMe = .5;

void nSetup() { // custom setup = runs ones
}

void nDraw() { // custom draw = renders fooorever
  //SETTINGS [change, plz don't delete any]
  credits = "adriano.diethelm + aline.wagner"; // put your name[s] here!
  modes = 3; // keys 1-__? max=10 then use if(modeSwitch == __){}
  myTextFont = "FreeSans.ttf"; // ie. "apple_ii.ttf";
  myTextSize = height*.50; // <- custom size
  myTextLength = 15; // <- custom length for cuts
  processType(); // <- function happens below
  background(0); // <- up to you if you want a background!

  pushMatrix(); // only adjusts translate/scale within matrix
  translate(width/2, height/2); // suggestion to draw from center out 
  scale(.65); // <- custom scale of letters

  bass = fft.calcAvg(0, 400)*amp*customAmp; // fft.calcAvg(minFreq, maxFreq) 
  bassFade[frameCount%frames] = bass;
  mid = fft.calcAvg(400, 3000)*amp*customAmp;
  midFade[frameCount%frames] = mid; 
  high = fft.calcAvg(3000, 20000)*amp*customAmp;
  highFade[frameCount%frames] = high;  

  if (points != null) { // only draw if points ready 
    noFill(); // optional.. 
    stroke(255); // optional...

    if (modeSwitch == 1) {

      for (int j=0; j < bassFade.length; j++) { 
        float bassColor = map(j, 0, bassFade.length, 255, 0);
        fill(bassColor); // optional.. 
        noStroke(); 

        for (int i=0; i < points.length; i++) { 
          rect(points[i].x*bassFade[j]*shrinkMe, points[i].y*bassFade[j]*shrinkMe, bassFade[j]*bass, bassFade[j]*bass);
        }
      }

      for (int j=0; j < midFade.length; j++) { 
        float midColor = map(j, 0, midFade.length, 255, 0);
        fill(midColor); // optional.. 
        noStroke(); 

        for (int i=0; i < points.length; i++) { 
          rect(points[i].x*1.4*midFade[j]*shrinkMe, points[i].y*1.4*midFade[j]*shrinkMe, midFade[j]*mid*1.5, midFade[j]*mid*1.5);
        }
      }

      for (int j=0; j < highFade.length; j++) { 
        float highColor = map(j, 0, highFade.length, 255, 0);
        fill(highColor); // optional.. 
        noStroke(); 

        for (int i=0; i < points.length; i++) { 
          rect(points[i].x*1.8*highFade[j]*shrinkMe, points[i].y*1.8*highFade[j]*shrinkMe, highFade[j]*high*1.5, highFade[j]*high*1.5);
        }
      }
    }

    if (modeSwitch == 2) {

      for (int j=0; j < bassFade.length; j++) { 
        float bassColor = map(j, 0, bassFade.length, 255, 0);
        fill(bassColor); // optional.. 
        noStroke(); 

        for (int i=0; i < points.length; i++) { 
          ellipse(points[i].x*bassFade[j]*shrinkMe, points[i].y*bassFade[j]*shrinkMe, bassFade[j]*bass, bassFade[j]*bass);
        }
      }

      for (int j=0; j < midFade.length; j++) { 
        float midColor = map(j, 0, midFade.length, 255, 0);
        fill(midColor); // optional.. 
        noStroke(); 

        for (int i=0; i < points.length; i++) { 
          ellipse(points[i].x*1.4*midFade[j]*shrinkMe, points[i].y*1.4*midFade[j]*shrinkMe, midFade[j]*mid*1.5, midFade[j]*mid*1.5);
        }
      }

      for (int j=0; j < highFade.length; j++) { 
        float highColor = map(j, 0, highFade.length, 255, 0);
        fill(highColor); // optional.. 
        noStroke(); 

        for (int i=0; i < points.length; i++) { 
          ellipse(points[i].x*1.8*highFade[j]*shrinkMe, points[i].y*1.8*highFade[j]*shrinkMe, highFade[j]*high*1.5, highFade[j]*high*1.5);
        }
      }
    }

    if (modeSwitch == 3) {

      for (int j=0; j < bassFade.length; j++) { 
        float bassColor = map(j, 0, bassFade.length, 255, 0);
        fill(bassColor); // optional.. 
        stroke(255);
        strokeWeight(1); 

        for (int i=0; i < points.length; i++) { 
          line(points[i].x*bassFade[j]/2, points[i].y*bassFade[j]/2, points[i].x*bassFade[j]*1.5/2, points[i].y*bassFade[j]*1.5/2);
        }
      }

      for (int j=0; j < midFade.length; j++) { 
        float midColor = map(j, 0, midFade.length, 255, 0);
        fill(midColor); // optional.. 
        stroke(255); 
        strokeWeight(1); 

        for (int i=0; i < points.length; i++) { 
          line(points[i].x*1.5*midFade[j]/2, points[i].y*1.5*midFade[j]/2, points[i].x*midFade[j]*mid*1.5/2, points[i].x*midFade[j]*mid*1.5/2);
        }
      }

      for (int j=0; j < highFade.length; j++) { 
        float highColor = map(j, 0, highFade.length, 255, 0);
        fill(highColor); // optional.. 
        stroke(255); 
        strokeWeight(1); 

        for (int i=0; i < points.length; i++) { 
          line(points[i].x*2*highFade[j]/2, points[i].y*2*highFade[j]/2, points[i].x*highFade[j]*high*1.5/2, points[i].x*highFade[j]*high*1.5/2);
        }
      }
    }
  }
  popMatrix();
} // END CUSTOM CODE

