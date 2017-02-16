class Circle
{
  
  float radius;
  int BALL_RES;
 
  ArrayList<Particles> p;
  
  VerletParticle2D mouse;
  
  VerletParticle2D selectedParticle;
  
  ArrayList<VerletSpring2D> springs;
  
  Particles pTemp;
  
  
 Circle(Vec2D origin, int size)
 {
   p = new ArrayList<Particles>();
   
   springs = new ArrayList<VerletSpring2D>();
   
   radius = 100;
  
   BALL_RES = size;
   
   VerletParticle2D c = new Particles(origin.x,origin.y);
   p.add((Particles)c);
   physics.addParticle(c);
   
   for(int i=0; i<=BALL_RES; i++) {
    // create a rotation vector, scale it to the radius and move relative to ball center
    Vec2D pos = Vec2D.fromTheta(i*TWO_PI/BALL_RES).scaleSelf(radius).addSelf(c);
    // create particle and add to lists
    VerletParticle2D p_ = new Particles(pos.x,pos.y);
    
    p.add((Particles)p_);
    
    physics.addParticle(p_);
    
    // connect to ball center for extra stability
    
    springs.add(new VerletSpring2D(c,p_,radius,0.01));
    
    // also connect all perimeter particles sequentially
    if (i>0) {
      VerletParticle2D q = p.get(i-1);
      springs.add(new VerletSpring2D(p_,q,p_.distanceTo(q),1));  
    }
  }
  
  VerletParticle2D p_ = (VerletParticle2D)p.get(0);
  VerletParticle2D q_ = (VerletParticle2D)p.get(p.size()-1);
  springs.add(new VerletSpring2D(p_,q_,p_.distanceTo(q_),1));
  
  
  for (int i = springs.size() -1; i >= 0; i--)
      physics.addSpring(springs.get(i));
  }
  
  
 
 void drag(int x, int y)
 {
  if(selectedParticle != null) selectedParticle.set(x,y);
 }
       
     
 
 void contains(int x, int y)
 {
  for(int i=1; i<physics.particles.size()-1; i++)
  {
    
   mouse = new VerletParticle2D(x,y);
  
   float r = p.get(0).r;
   if (mouse.distanceTo(physics.particles.get(i)) < (r*r))
   {
     
     selectedParticle = physics.particles.get(i);
     pTemp = (Particles)selectedParticle;
     pTemp.dragging = true;
     selectedParticle.lock();
     break;
   }
   
  }
 }
  
  void release()
  {
  if(selectedParticle != null)
   {
       pTemp.dragging = false;
       selectedParticle.unlock();   
       selectedParticle=null;
       pTemp = null;
   }
  }
       
 
   
     
 void run()
 {
   for(int i = 0; i < p.size()-1 ; i++) 
   {
   //p.get(i).display();
   drag(mouseX, mouseY);
   }
  }
}