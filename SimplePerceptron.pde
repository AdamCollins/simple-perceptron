Perceptron brain;
Point[] points = new Point[100];
int pointIndex = 0;
void setup() {
  size(600, 600);
  brain = new Perceptron();

  //create test points
  for (int i = 0; i<points.length; i++) {
    points[i] = new Point();
  }
}

void train() {
  for (int i = 0; i<points.length; i++) {
    //points[i] = new Point();
    brain.train(new float[]{points[i].x, points[i].y}, points[i].label);
  }
}




void draw() {
  background(255);
  stroke(1);

  stroke(255, 0, 0);
  Point start = new Point(-1,f(-1));
  Point end = new Point(1,f(1));
  stroke(255,0,0);
  line(start.getPixelX(), start.getPixelY(), end.getPixelX(), end.getPixelY());
  
  stroke(0);
  line(0,width,height,0);
  




  for (Point p : points) {
    p.show();
  }

  for (Point p : points) {
    int guess = brain.guess(new float[]{p.x, p.y});
    int target = p.label;
    if (guess==target)
      fill(0, 255, 0);
    else
      fill(255, 0, 0);
    noStroke();
    ellipse(p.getPixelX(), p.getPixelY(), 12, 12);
  }

  brain.train(new float[]{points[ pointIndex].x, points[pointIndex].y}, points[pointIndex].label);
  pointIndex = (pointIndex+1)%points.length;



  println(brain.weights[0], brain.weights[1]);
  //println(brain.weights[1]/brain.weights[0]);
}

void mousePressed() {
  // train();
  brain = new Perceptron();
}