import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioInput mic;
FFT fft;  
//Audiotracks
AudioPlayer streetNoise;
AudioPlayer rickshawNoise;
AudioPlayer storm;
AudioPlayer prayer;

PImage img;

float vol;

void setup() {
  size(1200, 400);
  //Load Background Streetscape
  img = loadImage("indiaStreet.png");//taken from http://www.wonobo.com/explore/bangalore/9.603713311921303E7$6.2271406685253955E7$44.28899999999993$6.900000000000002
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

  //Analysing
  //in = minim.getLineIn(Minim.STEREO, 512);
  //fft = new FFT(mic.bufferSize(), mic.sampleRate());
}


void draw () {
  background(0);

  //Soundscaping
  vol = map(mouseX, 0, width, -10, 14);
  rickshawNoise.setGain(vol);
  vol = map(mouseX, 0, width, 14, -1);
  streetNoise.setGain(vol);

  if (mouseX < width/2) {
    vol = map(mouseX, 0, width/2, -10, 10);
    prayer.setGain(vol);
  } else if (mouseX > width/2) {
    vol = map(mouseX, width/2, width, 10, -10);
    prayer.setGain(vol);
  }

  //Graphics Treatment
  noStroke();

  //Rectangle 1
  color c = img.get(255, 200);
  fill(c);
  rect(0, 0, 200, height);

  c = img.get(300, 200);
  fill(c);
  rect(200, 0, 200, height);

  c = img.get(500, 200);
  fill(c);
  rect(400, 0, 200, height);

  c = img.get(650, 200);
  fill(c);
  rect(600, 0, 200, height);

  c = img.get(800, 200);
  fill(c);
  rect(800, 0, 200, height);

  c = img.get(1000, 200);
  fill(c);
  rect(1000, 0, 200, height);
}

void mousePressed() {
  //Start all audio
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

