float f(float x){
  //y=mx
  return -(brain.weights[0]/brain.weights[1])*x;
}
class Point {
  float x, y;
  int label;
  Point() {
    x = random(-1,1);
    y = random(-1,1);
    if (x>y)
      label = 1;
    else
      label = -1;
  }
  
  Point(float x, float y){
    this.x = x;
    this.y = y;
    if (x>y)
      label = 1;
    else
      label = -1;
  }

  void show() {
    stroke(0);
    if (label == 1)
      fill(255);
    else
      fill(0);
      
     ellipse(getPixelX(),getPixelY(),20,20);
  }
  
  float getPixelX(){
    return map(x,-1,1,0,width);
  }
  
  float getPixelY(){
    return map(y,-1,1,height,0);
  }
}