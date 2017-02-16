class DNA
{
 
  PVector[] genes;
  
  float fitness;
  
  DNA(int size)
  {
    genes = new PVector[size];
    
    for (int i = 0; i < genes.length; i++)
    {
       genes[i] = PVector.random2D();
      
    }
  }
  
  DNA(PVector[] genes)
  {
    this.genes = genes;
  }

  
  
  DNA crossOver(DNA mate)
  {
    DNA children = new DNA(genes.length);
    
    int midpoint = (int)random(genes.length);
    
    for(int i = 0; i < genes.length; i++)
    {
      if(i > midpoint)
        children.genes[i] = genes[i];
      else
        children.genes[i] = mate.genes[i];
    }
    
    return children;
  }
  
  void mutate(float mutateRate)
  {
    for(int i = 0; i < genes.length; i++)
    {
      if( mutateRate > random(1))
      {
        genes[i] = PVector.random2D();
      }
    }
  }
  

  
}