class Bridge
{
  
  float NumJoints;
  
  float radius;
  
  ArrayList<Particles> p;
  
  VerletParticle2D mouse;
  
  VerletParticle2D selectedParticle;
  
  ArrayList<VerletSpring2D> springs;
  
  Particles pTemp;
 
 Bridge()
 {
   selectedParticle = null;
   
   p = new ArrayList<Particles>();
   
   springs = new ArrayList<VerletSpring2D>();
   
   radius = 5;
   
   float space = 12;
   
   NumJoints = width / (radius*2);
    for(int i = 0; i < NumJoints; i++)
    {
      
      if (i == 0)p.add(new Particles(0, height/2));
      else p.add(new Particles(0 + space, height/2));
      physics.addParticle(p.get(i));
      space += 10;
      physics.addBehavior(new AttractionBehavior2D(p.get(i), 10,-100));
      
    }
    for(int i = 0; i < p.size()-1 ; i++)
    {
      springs.add(new VerletSpring2D(p.get(i), p.get(i+1),4, 0.1));
    }
    
   for(int i = 0; i < p.size()-1 ; i++) physics.addSpring(springs.get(i));
    
  VerletParticle2D begin = physics.particles.get(0);
  VerletParticle2D end = physics.particles.get(p.size()-1);
  begin.lock();
  end.lock();
 }
 
 
 
  void run()
 {
   for(int i = 0; i < p.size()-1 ; i++) 
   {
   //p.get(i).display();
   }
 }
}
 