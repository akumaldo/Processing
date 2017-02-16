class Cluster
{
  
  ArrayList<Nodes> nodes;
  
  float strenght;
  
  float r;
  
  int len;
  

  
  
  Cluster(int size, int len_, Vec2D origin)
  {
    
    len = len_;
    
    float r = 5;
    
    strenght = 0.01;
    
    nodes = new ArrayList<Nodes>();
    
    for(int i = 0; i < size ; i++)
    {
      nodes.add(new Nodes(origin.add(Vec2D.randomVector())));
      
    }
    
    for(int i  = 1; i < nodes.size(); i++) 
    {
      Nodes pi = nodes.get(i);
      for( int j = 0; j < i; j++)
      {
        Nodes pj = nodes.get(j);
        physics.springs.add(new VerletSpring2D(pi, pj, len, strenght));
      }
    }  
  }
  
  void displayNodes()
  {
    for (Nodes p : nodes)
    { 
      p.display(6);
    }
  }
  
  void clusterConnection()
  {
   stroke(0,200);
    for (int i = 0; i < nodes.size(); i++) {
      VerletParticle2D pi = (VerletParticle2D) nodes.get(i);
      for (int j = i+1; j < nodes.size(); j++) {
        VerletParticle2D pj = (VerletParticle2D) nodes.get(j);
        line(pi.x,pi.y,pj.x,pj.y);
      }
    }
  }
  
  ArrayList getNodes() {
    return nodes;
  }
  
  void displayConnection(Cluster c)
  {
    stroke(0, 10);
    ArrayList<Nodes> other = c.getNodes();
    
    for(int i = 0; i < nodes.size();i++)
    {
      Nodes p = nodes.get(i);
      for(int j = 0; j < other.size(); j++)
      {
        Nodes q = other.get(j);
        line(p.x,p.y,q.x,q.y);
      }
    }
  }
        
 
 void connect(Cluster c)
 {
   ArrayList<Nodes> other = c.getNodes();
     for (int i = 0; i < nodes.size(); i++)
     { 
       VerletParticle2D pi = (VerletParticle2D) nodes.get(i);
       for(int j = 0; j < other.size(); j++)
         {
           VerletParticle2D pj = (VerletParticle2D) other.get(j);
           
           physics.springs.add(new VerletMinDistanceSpring2D(pi, pj, (len+ c.len) * 0.5, 0.05));
         }
     }
  }
  
}