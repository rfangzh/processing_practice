class branch_neon
{
  public int Level;
  private float angle;
  private int circleW;

  public branch_neon(int level)
  {
    Level=level;
    circleW = 3;
  }

  public void grow()
  {
    background(0);
    stroke(255);
    angle=mouseY*PI/height;
    translate(width/2, height);
    line(0, 0, 0, -300);
    translate(0, -300);
    grow(300);
  }

  void grow(float h) {
    h *= 0.7;
    if (h >10) {
      pushMatrix();
      rotate(angle);
      line(0, 0, 0, -h);
      float c1=random(0, 255);
      float c2=random(0, 255);
      float c3=random(0, 255);
      fill(c1, c2, c3);
      stroke(c1, c2, c3);
      ellipse(0, -h, circleW, circleW);
      translate(0, -h);
      grow(h);
      popMatrix();

      pushMatrix();
      rotate(-angle);
      line(0, 0, 0, -h);
      float c11=random(0, 255);
      float c21=random(0, 255);
      float c31=random(0, 255);
      fill(c11, c21, c31);
      stroke(c11, c21, c31);
      ellipse(0, -h, circleW, circleW);
      translate(0, -h);
      grow(h);
      popMatrix();
    }
  }


}
