// Sound Import
import ddf.minim.*;
import ddf.minim.analysis.*;
// PDF
import processing.pdf.*;
boolean record;

int gridRes = 75;
int gridSize = 1;
float [][] z;
float scaleFactor = 8;
float distance;
float radiusMultiplyer = 1.0f;
int cameraY = 0;
int cameraZ = 0;
int startBand = 0;
int endBand = 512;
 
Minim   minim;
AudioPlayer song;
FFT   fft;


void setup() {
  size(600, 600, P3D);
  smooth();
  
  // audio
  minim = new Minim(this);
  song = minim.loadFile("Pulsar Sounds.mp3", 1024);
  song.loop();
  fft = new FFT ( song.bufferSize(), song.sampleRate() );

  z = new float [gridRes][gridRes];
  for (int y = 0 ; y<gridRes; y++){
    for (int x = 0 ; x<gridRes; x++){
      z[x][y] = noise(x/10.0f,y/10.0f)*50.0f;
    }
  }
}

float mOffset = 0;

void draw() {
  if (record) {
    beginRaw(PDF, "XXXX.pdf");
  }
  // audio
  fft.forward(song.mix);

  background(255);
  handleCamera();

  mOffset += 0.05;

  // get the band divisions (within 512)
  int bandWidth = fft.specSize()/gridRes;
  //create aa empty row to store this draw loop sound data
  float data[] = new float[gridRes];
  //loop through the rows and continue till 74/gridRes
  for (int i = 0; i<gridRes-1; i++){
    // get music (magic!, takes one slice)
    data[i] = fft.getBand(int (map(i,0,gridRes, startBand, endBand)));
    data[i] = constrain(data[i], 0, 50);
    // data[i] = fft.getBand(i*bandWidth);
    // decay values
    z[i] = z[i+1];
  }
  //inset new data to end of aray
  z[z.length-1] = data;

  scale(scaleFactor);
  
  for (int y = 0 ; y<gridRes-1 ; y++){
    for (int x = 0 ; x<gridRes-1 ; x++){
      noFill();
      stroke(75);
      strokeWeight(0.8f);
      beginShape(LINES);
      vertex(x,y,-z[x][y]);
      vertex((x + 1 ),y,-z[x+1][y]);
      endShape();
    }
  } 

}

void keyPressed() {
//   
  if (keyCode == UP) {
    cameraZ += 5;
  }
  if (keyCode == DOWN) {
      cameraZ-= 5 ;
    }
  if (keyCode == LEFT) {
      cameraY-=5 ;
    }
  if (keyCode == RIGHT) {
      cameraY+=5 ;
  }
  if (key == 'w') {
      radiusMultiplyer -= .1;
  }
  if (key == 's') {
      radiusMultiplyer += .1;
  }
  // PDF
  if (record) {
    endRaw();
    record = false;
  }
  if (key == 'r') {
    record = true;
  }
  
}

void handleCamera() {
  //  Camera
  distance = map(mouseY,0,height,-5000,1000);
  float middleOfGrid = scaleFactor*gridRes/2;
  float radius = (scaleFactor*gridRes/2)*radiusMultiplyer;
  float controlsX = map(mouseX, 0, width, 15, -15);
  float n = cameraY;
  float xPcam = sin(radians(n))*radius+middleOfGrid;
  float yPcam = cos(radians(n))*radius+middleOfGrid;


  camera(xPcam, yPcam, -60+cameraZ, 
         middleOfGrid, middleOfGrid, 0,   
         0,0,1);
}
