float t = 0.0; // time elapsed
float currentSpeed = 0.0; // current horizontal rotational speed
float spinningSpeed = 0.05; // horizontal rotational speed
float effectAmplitude = 0.010; // amplitude of the vibrations in the letter
float lightningLimit = 500; // threshold triggering a lightning
float lightningFadingFactor = 0.95; // factor bringing the background back to normal after lightning
float fadingFactor = 0.95; // factor bringing the background back to normal after clicking
int[] letterColorBW = {255, 255, 255}; // RGB coefficients for letter color
int[] letterColor = {25, 255, 255}; // RGB coefficients for letter color
int[] baseBackgroundColor = {0, 0, 0}; // RGB coefficients for base background color
int[] backgroundColor = {0, 0, 0}; // RGB coefficients for background color
int[] currentBackgroundColor = {0, 0, 0}; // RGB coefficients for current background color
int[] clickedBackgroundColor = {25, 200, 210}; // RGB coefficients for background color when clicking
int[] clickedBackgroundColorBW = {25,25,25}; // RGB coefficients for background color when clicking

int[] flashColor = {255, 255, 255}; // RGB coefficients for flash color
int[] lineColor = {255, 255, 255}; // RGB coefficients for line color
int numberOfLines = 50;


void oSetup() { // custom setup = runs ones
}

void oDraw() { // custom draw = renders fooorever
  //SETTINGS [change, plz don't delete any]
  credits = "zoé.scrima"; // put your name[s] here!
  modes = 4; // keys 1-__? max=10 then use if(modeSwitch == __){}
  myTextFont = "FreeSans.ttf"; // ie. "apple_ii.ttf";
  myTextSize = height*.75; // <- custom size
  myTextLength = 15; // <- custom length for cuts
  processType(); // <- function happens below

  pushMatrix(); // only adjusts translate/scale within matrix
  translate(width/2, height/2); // suggestion to draw from center out 
  scale(.80); // <- custom scale of letters
      t += 1; // time step

    background(  // draw background
    currentBackgroundColor[0],
    currentBackgroundColor[1],
    currentBackgroundColor[2]
  );

  if (points != null) { // only draw if points ready
    
    if (modeSwitch == 1) {
    currentSpeed = spinningSpeed;
    for (int i=0; i < 3; i++) { // go back to normal background color
      currentBackgroundColor[i] = int(currentBackgroundColor[i]*fadingFactor+baseBackgroundColor[i]*(1-fadingFactor));
    }
  }
  else if (modeSwitch == 2) {
    currentSpeed = spinningSpeed*10;
    for (int i=0; i < 3; i++) { // change background color
       currentBackgroundColor[i] = clickedBackgroundColorBW[i];
    }
    stroke(lineColor[0], lineColor[1], lineColor[2]);  
    for (int i=0; i < numberOfLines; i++) { // draw lines
      line(random(width)-(width/2), random(height)-(height/2), 0, 0); 
    }
  } else if(modeSwitch == 3){
    currentSpeed = spinningSpeed;
    for (int i=0; i < 3; i++) { // go back to normal background color
      currentBackgroundColor[i] = int(currentBackgroundColor[i]*fadingFactor+baseBackgroundColor[i]*(1-fadingFactor));
    }
  } else if(modeSwitch == 4){
    currentSpeed = spinningSpeed*10;
    for (int i=0; i < 3; i++) { // change background color
       currentBackgroundColor[i] = clickedBackgroundColor[i];
    }
    stroke(lineColor[0], lineColor[1], lineColor[2]);  
    for (int i=0; i < numberOfLines; i++) { // draw lines
      line(random(width)-(width/2), random(height)-(height/2), 0, 0); 
    }
  }
  
   if(modeSwitch == 1 || modeSwitch == 2){
     fill(letterColorBW[0], letterColorBW[1], letterColorBW[2]); // coloring inside the letter
    stroke(letterColorBW[0], letterColorBW[1], letterColorBW[2]); // coloring border of the letter
   }else{
     fill(letterColor[0], letterColor[1], letterColor[2]); // coloring inside the letter
    stroke(letterColor[0], letterColor[1], letterColor[2]); // coloring border of the letter
   }
  
    beginShape();
    for (int i=0; i < points.length; i++) {  // render
      vertex(points[i].x*cos(t*currentSpeed), points[i].y*random(1.0, 1.0+effectAmplitude*avgAudio));
    }
    endShape();  
  }
  popMatrix();
} // END CUSTOM CODE
