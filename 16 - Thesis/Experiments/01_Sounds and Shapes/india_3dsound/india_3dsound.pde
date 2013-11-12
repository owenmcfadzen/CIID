import ddf.minim.*;
import ddf.minim.analysis.*;


Minim minim;
AudioInput mic;
FFT fft;  
//Sounds
AudioPlayer streetNoise;
AudioPlayer rickshawNoise;
AudioPlayer storm;
AudioPlayer prayer;


PImage img;

float vol;

void setup() {
  size(1200, 400);
  img = loadImage("indiaStreet.png");
  background(img);


  //Sounds
  minim = new Minim(this);
  minim.debugOn();
  streetNoise = minim.loadFile("streetNoise.mp3");
  rickshawNoise = minim.loadFile("rickshawNoise.mp3");
  storm = minim.loadFile("storm.mp3");
  prayer = minim.loadFile("prayer.mp3");

  //normalize rickshawNoise
  rickshawNoise.setGain(-10);

  
}


void draw () {
  background(0);
  noStroke();

  

  vol = map(mouseX, 0, width, -10, 14);
  rickshawNoise.setGain(vol);
  vol = map(mouseX, 0, width, 14, -1);
  streetNoise.setGain(vol);

  if (mouseX < width/2) {
    vol = map(mouseX, 0, width/2, -10, 10);
    prayer.setGain(vol);
  }
  else if (mouseX > width/2) {
    vol = map(mouseX, width/2, width, 10, -10);
    prayer.setGain(vol);
  }
}

void mousePressed() {
  streetNoise.play();
  rickshawNoise.play();
  storm.play();
  prayer.play();
}

void stop()
{
  streetNoise.close();
  rickshawNoise.close();
  storm.close();
  prayer.close();
  minim.stop();

  super.stop();
}

