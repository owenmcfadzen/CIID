import ddf.minim.*;
import ddf.minim.analysis.*;


Minim minim;
AudioInput in;
FFT fft;  

//width
int w;
PImage fade;
int hVal;

float rWidth, rHeight;

void setup() {
  //add P3D to make it faster, but it fades
  size(640, 480, P3D);
  
  //Sounds
  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.STEREO, 512);
  fft = new FFT(in.bufferSize(), in.sampleRate());
  fft.logAverages(60, 7);

  stroke(255);
  
  w = width/fft.avgSize();
  strokeWeight(w);
  strokeCap(SQUARE);
  
  background(0);
  fade = get(0,0, width, height);
  
  rWidth = width * 0.99;
  rHeight = height * 0.99;
  hVal = 0;
}


void draw () {
  background(0);
  tint(255, 255, 255, 220);
  image(fade, (width - rWidth)/2, (height - rHeight)/2, rWidth, rHeight);
  noTint();
  
  
  //analysis sound
  fft.forward(in.mix);
  
  colorMode(HSB);
  stroke(hVal, 255, 255);
  colorMode(RGB);
  
  for (int i = 0; i < fft.avgSize(); i++) {
    line((i * w) + (w/2), height, (i * w) + (w/2), height - fft.getAvg(i) * 5);
  }
  
  fade = get(0, 0, width, height);
  
  stroke(255);
  for (int i = 0; i < fft.avgSize(); i++) {
    line((i * w) + (w/2), height, (i * w) + (w/2), height - fft.getAvg(i) * 5);
  }
  
  hVal += 2;
  if( hVal > 255){
    hVal = 0;
  }
}

