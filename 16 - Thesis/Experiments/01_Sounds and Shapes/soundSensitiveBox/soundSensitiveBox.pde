import ddf.minim.*;
import ddf.minim.analysis*;


Minim minim;
AudioInput in;
FFT fft;  

Shape s;
Music m;

void setup() {
  int w = displayWidth/2;
  int h = displayHeight/2;

  background(0);
  size(w, h);
  s = new Shape();

  //Music
  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.STEREO, 512);
  fft = new FFT(in.buffersize(), in.sampleRate());
}

void draw() {
  background(0);
  s.x = width/2;
  s.y = height/2;
  for (int i = 0; i < in.bufferSize() - 1; i++)
  {
    s.shapeWidth = (i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50);
    s.shapeHeight = (i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50);
  }

  s.display();
}

void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();
  super.stop();
}

