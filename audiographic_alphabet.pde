// CC teddavis.org + students 2015
// built for Processing 2.2.1

//SETTINGS
float amp = 15; // from testing, 15 seems to be good...
boolean showEQ = false; // use to test audio, then turn off
boolean fullScreen = true; // test fullscreen to make sure your sketch scales properly
int showInfo = 0;

//SHARED VARS
float bass; 
float m = 0;

/*---- YOUR CUSTOM CODE BELOW ------------------------*/
/*---- PUT OWN VARIABLES JUST BEFORE customSetup()-----*/
// float myCustomVar = 0; 

void customSetup() { // custom setup = runs ones
}

void customDraw() { // custom draw = renders fooorever
  //SETTINGS [change, plz don't delete any]
  credits = "your.name + your.name"; // put your name[s] here!
  modes = 1; // keys 1-__? max=10 then use if(modeSwitch == __){}
  myTextFont = "FreeSans.ttf"; // ie. "apple_ii.ttf";
  myTextSize = height*.75; // <- custom size
  myTextLength = 15; // <- custom length for cuts
  processType(); // <- function happens below
  background(0); // <- up to you if you want a background!

  pushMatrix(); // only adjusts translate/scale within matrix
  translate(width/2, height/2); // suggestion to draw from center out 
  scale(.65); // <- custom scale of letters

  if (points != null) { // only draw if points ready 
    noFill(); // optional.. 
    stroke(255); // optional...
  
    beginShape(); // just demo below.. replace me!
    for (int i=0; i < points.length; i++) { 
      vertex(points[i].x, points[i].y);
    } 
    endShape();
  }
  popMatrix();
} // END CUSTOM CODE

/*---- YOUR CUSTOM CODE ABOVE ------------------------*/


/*---- BASIC SKETCH WE ALL SHARE BELOW = LEAVE ALONE -*/
/*---- LEARN HOW/WHY BELOW, IT STAYS SAME FOR ALL ----*/


/*---- ALL THE MAGIC HAPPENS BELOW ---------------*/

//STRUCTURE
boolean doSetup = true;

//TYPE
import geomerative.*;  
RShape grp; 
RPoint[] points; // 1D array of points 
PFont myFont;
String myTextFont = "FreeSans.ttf";
float myTextSize = 250;
float myTextLength = 25;
char myKey = 'a';
String myText = myKey+""; 
boolean shiftDown = false;

//AUDIO
import ddf.minim.*;   
import ddf.minim.analysis.*;  
Minim minim;   
FFT fft;  
AudioInput in;   
float ampWave; // used to strengthen signal   
float avgAudio; // store avg volume  
float maxAudio = 0; // store loudest volume

//ANIMATION
String credits = "";
float creditsTimer = 0;

//MODES
int modeSwitch = 1;
int modes;

void setup() {

  if (fullScreen) {
    size(displayWidth, displayHeight, P3D); // turn
  } else {
    size(800, 600, P3D);
  }
  background(0);

  //TYPE
  RG.init(this);
  myFont = createFont("FreeSans.ttf", height*.020);

  //AUDIO
  minim = new Minim(this); // initalize in setup   
  in = minim.getLineIn(Minim.STEREO, 512); // audio in + bufferSize 512 or 1024 
  fft = new FFT(in.bufferSize(), in.sampleRate());  
  fft.logAverages(22, 3); // 3 = 30, 4 = 40, etc..
  ampWave = amp*10;
  noCursor();
}


void draw() {

  //AUDIO
  updateAvgAudio();

  pushMatrix();
  //SETUP
  if (doSetup) {
    modeSwitch = 1;
    //method("customSetup"); // 
    method(Character.toLowerCase(myKey)+"Setup");
    strokeWeight(1.35); 
    doSetup = false;
  }

  // DRAW DYNA-LOAD sketches as functions!    
  //method("customDraw"); // 
  method(Character.toLowerCase(myKey)+"Draw");
  popMatrix();

  //CREDITS
    showCredits(); // <- put your name[s] there!
  if (showEQ) {
    drawEQ();
  }
}

boolean cmd = false;

void keyPressed() { 
  println(keyCode);
  if(keyCode == 27){
     key=0;
  }
  if(keyCode == 45){
   // showInfo++; // always show info
    if(showInfo >2){
      showInfo = 0;
    }
  }

  //AUDIO AMP
  if (keyCode == 38) { // up arrow 
    amp += 5; 
    ampWave = amp*10;
    return;
  } else if (keyCode == 40) { // down arrow 
    amp -= 5; 
    if (amp < 5) { 
      amp = 5;
    } 
    ampWave = amp*10;
    return;
  }
  //println(keyCode);
  if (keyCode >= 48 && keyCode <= 57) {
    int modeKey = keyCode - 48;

    if (modeKey <= modes) {
      if (modeKey == 0) {
        if (modes == 10) {
          modeKey += 10;
          modeSwitch = modeKey;
        }
      } else {
        modeSwitch = modeKey;
      }
      println("modeSwitch: "+modeSwitch);
    }
  }

  if (keyCode >=65 && keyCode <= 95 && keyCode != 91 && keyCode != 92 && keyCode !=93) { // only A - Z  
    if (!shiftDown) {
      myKey = key;
      creditsTimer = 0;
      doSetup = true;
    }
    myText = key + ""; // replaces letter
  } else if (keyCode == 16) {
    shiftDown = true;
  }else if (keyCode == 8){
    noLoop();
  }else if(keyCode == 32){
    //saveShot();
  }
} 

void keyReleased() {
  if (keyCode == 16) {
    shiftDown = false;
  }else if(keyCode == 8){
    loop();
  }
}


void updateAvgAudio() {
  fft.forward(in.mix); // update FFT anaylsis 
  for (int i = 0; i < fft.avgSize (); i++) { 
    avgAudio+= abs(fft.getAvg(i)*amp); // duplicate everything for stereo w/ right too!
  }     
  avgAudio /= fft.avgSize(); 

  // update maxAudio
  if (frameCount%120 == 0) {
    maxAudio = 0;
  } else if (avgAudio > maxAudio) {
    maxAudio = avgAudio;
  }
  //println(avgAudio +" / "+ maxAudio);
}

void drawEQ() {
  for (int i=0; i < fft.avgSize (); i++) {  
    float x = map(i, 0, fft.avgSize(), 0, width); 
    float w = width/fft.avgSize(); 
    float a = fft.getAvg(i)*amp; 

    noFill();
    stroke(a);
    rect(x, height, w, -a); // -a to make rectangle grow upwards!
  }
  
  fill(255);
  text("avgAudio", width-100, 40);
  rect(width,50,-avgAudio, 50);
  text("maxAudio", width-100, 140);
  rect(width,150,-maxAudio, 50);
  noFill();
}


void processType() {
  grp = RG.getText(myText.toUpperCase(), myTextFont, floor(myTextSize), CENTER); 
  grp = RG.centerIn(grp, g);
  RG.setPolygonizer(RG.UNIFORMLENGTH); // type of division 
  RG.setPolygonizerLength(myTextLength); // size of divisions 
  points = grp.getPoints(); // get coordinates for every point
}

void showCredits() {
  fill(255, 255-creditsTimer);  
  textFont(myFont);
  textLeading(height*.03);

  String modeText = "";
  if (modes > 1) {
    modeText ="\n1–"+modes +" FOR MULTI-MODES";
  }else{
    modeText = "\n";
  }

  String info = "\n\n---------------------\na – z » visualization \nSHIFT + a – z » letter \n1 – # » modes \n↑ – ↓ » sensitivity";
 if(showInfo == 0){ 
  text("THE BASEL SCHOOL OF DESIGN \nBA2014 INTRODUCTION INTERACTION II \nPROCESSING – AUDIOGRAPHIC ALPHABET \n\n---------------------\n"+credits.toUpperCase() +modeText + info.toUpperCase(), 20, 40);
 }else if(showInfo == 1){
    text(credits.toUpperCase() +modeText, 20, 40);
 }
  creditsTimer+=1;
  if (creditsTimer > 255) {
    creditsTimer = 255;
  }
}

void saveShot(){  
  String date = new java.text.SimpleDateFormat("yy_MM_dd_kkmmss_S").format(new java.util.Date ()); 
  saveFrame("aa_snapshots/aa_"+date+".png");
}
