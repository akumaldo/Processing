class Population
{
  
  ArrayList<DNA> matingPool;
  
  DNA[] population;
  
  String target;
  
  int generations;
  
  float mutationRate;
  
  boolean finished;
  
  int perfectScore;
  
  
 Population(String target_, int initialPop, float m)
 {
   target = target_;
   
   matingPool = new ArrayList<DNA>();
   
   population = new DNA[initialPop];
   
   for(int i = 0; i < population.length; i++)
   {
     population[i] = new DNA(target.length());
   }
   
   calcFitness();
   
   finished = false;
   
   perfectScore =  1;
   
   generations = 0;
   
   mutationRate = m;
   
 }
 
 void calcFitness() {
    for (int i = 0; i < population.length; i++) {
      population[i].fitness(target);
    }
  }
  
 void matingPool()
 {
   
   matingPool.clear();
   
   float maxFitness = 0;
   
   for(int i = 0; i < population.length; i++)
   {
     if(population[i].fitness > maxFitness)
     {
       maxFitness = population[i].fitness;
     }
   }
   
   for(int i = 0; i < population.length; i++)
   {
     float fitness = map(population[i].fitness, 0, maxFitness,0,1);
     int n = (int)(fitness * 100);
     for(int j = 0; j < n; j++)
     {
       matingPool.add(population[i]);
     }
   }
 }
 
 void generate()
 {
  for(int i = 0; i < population.length ; i++)
  {
     int a = (int)random(matingPool.size());
     int b = (int)random(matingPool.size());
     DNA partnerA = matingPool.get(a);
     DNA partnerB = matingPool.get(b);
     DNA child = partnerA.crossOver(partnerB);
     child.mutate(mutationRate);
     population[i] = child;
  }
   generations++;
 }
 
 String getBest()
 {
   float worldRecord = 0.0f;
   int index = 0;
   
   for(int i = 0; i < population.length; i++)
   {
     if(population[i].fitness > worldRecord){
       worldRecord = population[i].fitness;
       index = i;
     }
   }
   
   if (worldRecord == perfectScore) finished = true;
     
     return population[index].getPhrase();
   
 }
 
  boolean finished() {
    return finished;
  }

  int getGenerations() {
    return generations;
  }
  
 float getAverageFitness() {
   
    float total = 0;
    
    for (int i = 0; i < population.length; i++) {
      total += population[i].fitness;
      
    }
    return total / population.length;
  }
  
  
    String allPhrases() 
    {
      String everything = "";
    
      int displayLimit = min(population.length,50);
    
    
      for (int i = 0; i < displayLimit; i++) {
        everything += population[i].getPhrase() + "\n";
      }
    return everything;
    } 
}