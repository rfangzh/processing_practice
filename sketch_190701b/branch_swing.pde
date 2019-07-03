class branch_swing //<>// //<>// //<>//
{
  float angle=45;
  float angleSwing=0;
  float primaryHeight=200;
  private int circleW=3;
  int idx=0;
  int level; //分支的级数
  int lVar = 0; //动态的分支级数，营造动态消长的视觉效果
  boolean isGrow = false; //控制树的消和长的开关
  float branchHeight[][];

  public branch_swing()
  {
    this.level=12;
    lVar=level;
    randColor();

    branchHeight=new float[level][2]; //分支的长度是一组随机数，这样树冠看起来错落有致
    float bh0=primaryHeight;
    float bh1=primaryHeight;
    float minDecay = 0.6; //分支长度的衰减系数
    float maxDecay=0.8;
    for (int i=0; i<level; i++)
    {
      bh0*=random(minDecay, maxDecay);
      branchHeight[i][0]=bh0;
      bh1*=random(minDecay, maxDecay);
      branchHeight[i][1]=bh1;
    }
  }
  public void grow()
  {
    
    idx++;
    if (idx%15==0)//每隔5帧刷新一次,避免闪烁过频
    {
      background(0);
      angle=mouseY*PI/height; //分支的角度随鼠标Y坐标，在0-PI之间变化

      if (isGrow)
      {
        lVar++;
        if (lVar>=level)//达到最高级次时，开始消
        {
          isGrow=false;
        }
      } else
      {
        lVar--;
        if (lVar<level-3||lVar<2) //消到最低级次时，开始长
        {
          isGrow=true;
          randColor();
        }
      }

      strokeWeight(3); //指定主干的粗细
      translate(width/2, height);//先将坐标移动到横向居中，纵向靠下，因为树是从下方开始往上长。
      line(0, 0, 0, -primaryHeight); //绘制树的主干
      ellipse(0, -primaryHeight, circleW, circleW); //主干的结点
      translate(0, -primaryHeight); //将坐标移动到主干的末端，新的分支将从这里出发

      //树冠随鼠标X坐标摇摆
      float tan= ((mouseX-width/2)/((height-primaryHeight)-mouseY));
      float  targetAngleSwing= atan(tan);
      angleSwing +=(targetAngleSwing-angleSwing)*0.3; //在变化过程中，添加一个缓释函数，这样看起来不会太生硬
      rotate(angleSwing);

      strokeWeight(2); //指定分支的粗细
      grow(0); //调用递归函数，绘制分支
    }
  }


  //递归函数
  private void grow(int l)
  {
    if (l<lVar)
    {
      float lbh=branchHeight[l][0];
      float rbh=branchHeight[l][1];
      if (l<random(lVar-3, lVar-1))
      {
        if (rbh>2)
        {
          pushMatrix();
          //randColor();
          rotate(angle);
          line(0, 0, 0, -rbh);
          ellipse(0, -rbh, circleW, circleW);
          translate(0, -rbh);
          grow(l+1);
          popMatrix();
        }
        //if (rbh>2)
        //{
        //  pushMatrix();
        //  //randColor();
        //  line(0, 0, 0, -rbh);
        //  ellipse(0, -rbh, circleW, circleW);
        //  translate(0, -rbh);
        //  grow(l+1);
        //  popMatrix();
        //}
        if (lbh>2)
        {
          pushMatrix();
          //randColor();
          rotate(-angle);
          line(0, 0, 0, -lbh);
          ellipse(0, -lbh, circleW, circleW);
          translate(0, -lbh);
          grow(l+1);
          popMatrix();
        }
      }
    }
  }

  void randColor()
  {
    float c1=random(100, 200);
    float c2=random(150, 255);
    float c3=random(100, 200);

    fill(c1, c2, c3);
    stroke(c1, c2, c3);
  }
}
