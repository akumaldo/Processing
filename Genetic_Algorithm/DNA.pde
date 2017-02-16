class DNA
{
 
  char[] genes;
  
  float fitness;
  
  DNA(int size)
  {
    genes = new char[size];
    
    for (int i = 0; i < genes.length; i++)
    {
       genes[i] = (char) random(32,128);
      
    }
  }
  
  String getPhrase() {
    return new String(genes);
  }
  
  void fitness(String target)
  {
    int score = 0;
    for(int i = 0; i < genes.length; i++)
    {
      if (genes[i] == target.charAt(i))
        score++;
    }
    fitness = (float)score/target.length();
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
        genes[i] = (char)random(32,128);
      }
    }
  }
  

  
}