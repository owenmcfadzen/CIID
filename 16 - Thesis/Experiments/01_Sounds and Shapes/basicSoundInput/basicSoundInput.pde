import ddf.minim.*;
import ddf.minim.analysis.*;


Minim minim;
AudioInput in;
FFT fft;  

void setup() {
  background(0);
  size(600, 400);

  //Sounds
  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.STEREO, 512);
  fft = new FFT(in.bufferSize(), in.sampleRate());

  stroke(255);
}


void draw () {
  background(0);
  //analysis sound
  fft.forward(in.mix);

  for (int i = 0; i < fft.specSize(); i++) {
    line(i, height, i, height - fft.getBand(i) * 5);
    
  }
}

