class Curtains
{
  float r = 5;
  
  Curtains()
  {
    
    
    int h = 40;
    int w = 40;
    
    
    
    float strenght = 0.1;
    float len = 5;
    
    for(int y=0; y < h; y++){
     for(int x=0; x < w; x++)
       {
         VerletParticle2D p = new VerletParticle2D(width/2+x*len-w*len/2,y*len);
         physics.particles.add(p);
         
         if (x>0)
         {
          
           VerletParticle2D vec = physics.particles.get(physics.particles.size()-2);
           physics.springs.add(new VerletSpring2D(p, vec, len, strenght));
         }
         if (y>0)
         {
           VerletParticle2D vec = physics.particles.get(physics.particles.size()-w-1);
           physics.springs.add(new VerletSpring2D(p, vec, len, strenght));
         }
         
       }
    }
    VerletParticle2D begin = physics.particles.get(1);
    VerletParticle2D end = physics.particles.get(w- 1);
    
    begin.lock();
    end.lock();
    
  }
  
  void run()
  {
    for (VerletParticle2D p : physics.particles)
    {
        stroke(0);
        strokeWeight(1);
        noFill();
        //ellipse(p.x,p.y, r*2, r*2);
    }
    
    for (VerletSpring2D sp: physics.springs)
      {  
        stroke(0);
        line(sp.a.x,sp.a.y,sp.b.x,sp.b.y);
      }
  }
}
        
         
         