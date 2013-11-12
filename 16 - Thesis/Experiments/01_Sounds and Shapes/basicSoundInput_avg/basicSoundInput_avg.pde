import ddf.minim.*;
import ddf.minim.analysis.*;


Minim minim;
AudioInput in;
FFT fft;  

//width
int w;

void setup() {
  size(640, 480);

  //Sounds
  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.STEREO, 512);
  fft = new FFT(in.bufferSize(), in.sampleRate());
  fft.logAverages(60, 7);

  stroke(255);
  
  w = width/fft.avgSize();
  strokeWeight(w);
}


void draw () {
  background(0);
  //analysis sound
  fft.forward(in.mix);

  for (int i = 0; i < fft.avgSize(); i++) {
    line((i * w) + (w/2), height, (i * w) + (w/2), height - fft.getAvg(i) * 5);
  }
}

