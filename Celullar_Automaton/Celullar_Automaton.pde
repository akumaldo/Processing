CA ca;
ArrayList<int[]> ruleset;

void setup()
{
  size(800,800, P2D);
  background(255);
  ruleset = new ArrayList<int[]>();
  ruleset.add( new int[]{0, 1, 0, 1, 1, 0, 1, 0});
  ruleset.add( new int[]{0,1,1,1,1,1,0,1});
  ruleset.add( new int[]{0,1,1,1,1,0,0,0});
  ruleset.add( new int[]{0,1,1,1,0,1,1,0});
  ca = new CA(ruleset.get((int)random (4)));
  
  frameRate(30);
}


void draw()
{
  background(255);
  ca.display();
  ca.generate();
  
}


void mousePressed()
{
   background(255);
   ca = new CA(ruleset.get((int)random(4)));
}