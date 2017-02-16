class Joint
{
float len;

Vec2 pos1;
Vec2 pos2;


  Joint(Mover a, Mover b,float len_)
  {
    len = len_;
    DistanceJointDef djd = new DistanceJointDef();
    // Connection between previous particle and this one
    djd.bodyA = a.body;
    djd.bodyB = b.body;
    // Equilibrium length
    djd.length = box2d.scalarPixelsToWorld(len);
    
    djd.frequencyHz = 0;  // Try a value less than 5 (0 for no elasticity)
    djd.dampingRatio = 0; // Ranges between 0 and 1
    
    DistanceJoint dj = (DistanceJoint) box2d.world.createJoint(djd);
    
    
    pos1 = box2d.getBodyPixelCoord(a.body);
    pos2 = box2d.getBodyPixelCoord(b.body);
    
    
    
    
    
  }
    
  void display()
  {
    stroke(0);
    //line(pos1.x,pos1.y,pos2.x,pos2.y); 
  }
  
  
}