class branch_level
{
  float angle=0;
  float pHeight=200;
  public void grow(int level)
  {
    background(0);
    stroke(255);
    angle=mouseY*PI/height;

    translate(width/2, height);
    
    line(0, 0, 0, -pHeight);
    translate(0, -pHeight);
    grow(level,pHeight);
  }
  private void grow(int level, float primaryHeight)
  {
    if (level==0)
    {
      return;
    } else
    {
      float halfHeight=primaryHeight*0.6;
      
      pushMatrix();
      rotate(angle);
      line(0,0,0,-halfHeight);
      translate(0,-halfHeight);
      grow(level-1, halfHeight);
      popMatrix();
      
     pushMatrix();
      rotate(-angle);
      line(0,0,0,-halfHeight);
      translate(0,-halfHeight);
      grow(level-1, halfHeight);
      popMatrix();
    }
  }
}
