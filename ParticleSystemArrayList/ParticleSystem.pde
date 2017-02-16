import java.util.Iterator;

class ParticleSystem
{
 ArrayList <Particles> particles;
 PVector origin;
 float prob;

 
  ParticleSystem()
  {
    particles = new ArrayList<Particles>();
    origin = new PVector(width/2, 50);
    repeller = new Repeller();
  }
  
  ParticleSystem(float x, float y, float prob_)
  {
    particles = new ArrayList<Particles>();
    origin  = new PVector(x,y);
    prob = prob_;
    
  }
  void applyForce(PVector force)
  {
    for(Particles p: particles)
      {
        p.applyForce(repeller.repell(p));
        p.applyForce(force);
      }
  }
  
  void applyRepell(Repeller rep)
  {
       for(Particles p: particles)
      {
        p.applyForce(rep.repell(p));
      }
  }
  
  void addParticle()
  {
    //particles.add(new Particles(new PVector(width/2, 50), random(2,5)));
   if(prob < 3) particles.add(new Particles(origin, random(1,6)));
   else if (prob > 3 && prob < 6) particles.add(new SquareParticle(origin, random(1,6)));
   else if (prob >= 8) particles.add(new TriangularParticle(origin, random(3,9)));
  }
  
  
  void run()
  {
    addParticle();
      Iterator<Particles> it = particles.iterator();
      while(it.hasNext())
      {
        Particles p = (Particles) it.next();
        p.update();
        p.display();
        if(p.isDead()) it.remove();
      }
        
      
    
  }
      
  
}