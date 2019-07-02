

branch_neon b;
branch_level bf;
branch_trinary bt;
branch_swing bs;
int level=10;
int idx=0;
boolean isGrow=true;



void setup() {
  size(1500, 1080);
  background(255);
  b=new branch_neon(4);
  bf=new branch_level();
  bt=new branch_trinary();
  bs=new branch_swing();
   //<>//
}



void draw()
{
  idx++;
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

   background(0);

    bs.grow(level);
   
  }
}
