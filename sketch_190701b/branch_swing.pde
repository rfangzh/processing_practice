class branch_swing
{
  float angle=45;
  float angleSwing=0;
  float pHeight=250;
  private int circleW=2;
  int idx=0;
  int level;
  int lVar = 0;
  boolean isGrow = true;
  public branch_swing(int level)
  {
    this.level=level;

  }
  public void grow()
  {
    if (idx%3==0)
    {
      if (isGrow)
      {
        level++;
        if (level>13)
        {
          isGrow=false;
        }
      } else
      {
        level--;
        if (level<9)
        {
          isGrow=true;
        }
      }

      angle=mouseY*PI/height;

      float c1=random(0, 255);
      float c2=random(0, 255);
      float c3=random(0, 255);
      fill(c1, c2, c3);
      stroke(c1, c2, c3);

      strokeWeight(3);
      translate(width/2, height);
      line(0, 0, 0, -pHeight);
      ellipse(0, -pHeight, circleW, circleW);
      translate(0, -pHeight);

      //The tree is swinging towards the mouse;
      float tan= ((mouseX-width/2)/((height-pHeight)-mouseY));
      float  targetAngleSwing= atan(tan);
      angleSwing +=(targetAngleSwing-angleSwing)*0.3;
      rotate(angleSwing);

      grow(level, pHeight);
    }
  }
  private void grow(int level, float primaryHeight)
  {
    if (level>random(0, 6))
    {
      strokeWeight(1);
      pushMatrix();
      float halfHeight=primaryHeight*0.7;
      float c1=random(0, 255);
      float c2=random(0, 255);
      float c3=random(0, 255);
      fill(c1, c2, c3);
      stroke(c1, c2, c3);
      rotate(angle);
      line(0, 0, 0, -halfHeight);
      ellipse(0, -halfHeight, circleW, circleW);
      translate(0, -halfHeight);
      grow(level-1, halfHeight);
      popMatrix();

      pushMatrix();
      float c11=random(0, 255);
      float c21=random(0, 255);
      float c31=random(0, 255);
      fill(c11, c21, c31);
      stroke(c11, c21, c31);
      rotate(-angle);
      line(0, 0, 0, -halfHeight);
      ellipse(0, -halfHeight, circleW, circleW);
      translate(0, -halfHeight);
      grow(level-1, halfHeight);
      popMatrix();
    }
  }
}
