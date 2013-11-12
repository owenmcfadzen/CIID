class Shape {
  float x;
  float y;
  float shapeWidth = 50;
  float shapeHeight = 50;
  
  //The Constructor
  Shape() {
   
  }
  
  //Draw the shape
  void display() {
    stroke(255);
    fill(255);
    rect(x, y, shapeWidth, shapeHeight);
  }
}

