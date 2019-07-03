//float angle, a;
//int circleW;

//void setup() {
//  size(700, 400);
//  circleW = 3; //控制圆形节点的大小
//}

//void draw() {
//  background(0); //重绘背景，将上一帧的内容覆盖
//  stroke(255); 
//  a = mouseX; //用X坐标控制树形的分叉角度
//  angle = radians(a);
//  translate(width/2, height);
//  line(0, 0, 0, -120);
//  translate(0, -120);
//  branch(130);
//}

//void branch(float h) {
//  h *= 0.6;
//  if (h > 2) {
//    pushMatrix();
//    rotate(angle);
//    line(0, 0, 0, -h);
//    ellipse(0, -h, circleW, circleW);
//    translate(0, -h);
//    branch(h);
//    popMatrix();
//    pushMatrix();
//    rotate(-angle);
//    line(0, 0, 0, -h);
//    ellipse(0, -h, circleW, circleW);
//    translate(0, -h);
//    branch(h);
//    popMatrix();
//  }
//}
