class Bridge
{
  ArrayList<Mover> mover;
  ArrayList<Joint> joint; 
  
  float r;
  
  Bridge()
  {
    mover = new ArrayList<Mover>();
    joint = new ArrayList<Joint>();
    
    
    //bodyA fix point
    r = 5;
    int numpoints = int(width/(r*2));
    float len = width / float(numpoints);
    
    mover.add(new Mover(r, new Vec2(len, height/2)));
    
    for(int i = 1; i < numpoints+1 ; i++)
    {  
      if (i == numpoints) mover.add(new Mover(r , new Vec2(width-len, height/2)));
      else
      {
        mover.add(new Mover(new Vec2(len * i, height/2),r));
      }    
    }
    
    for(int i = mover.size()-1; i > 0; i--)
    {
      joint.add(new Joint(mover.get(i), mover.get(i-1),len));
    }
    
  }
    
  void run()
  {
    for(Mover m: mover) m.display();
    for(Joint j: joint) j.display();
  }
}