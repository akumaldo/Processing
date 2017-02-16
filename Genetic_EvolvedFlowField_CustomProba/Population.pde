class Population
{
  
  Vehicles[] population;
  
  Vehicles[] newPopulation;
  
  int generations;
  
  float mutationRate;
 
  int order; 
  
  float avgFitness;
  
  float totalFitness;
  
  
 Population(int initialPop, float m)
 {
   
   population = new Vehicles[initialPop];

   
   
   for(int i = 0; i < population.length; i++)
   {
     PVector position = new PVector(start.r.x+start.r.width/2, start.r.y+start.r.height/2);
     population[i] = new Vehicles(position, new DNA(dnasize));
   }
   
   calcFitness();
      
   generations = 0;
   
   mutationRate = m;
   
 }
 
 
 void live(ArrayList<Obstacle> obs)
 {
   float record = 100000;
   int closest = 0; 
   
   for(int i = 0; i < population.length; i++)
   {
     if(population[i].finished())
     {
        population[i].setFinish(order);
        order++;
     }
     population[i].run(obs);
     
     if(population[i].recordDist < record)
     {
       record = population[i].recordDist;
       closest = i;
     }
   }      
 }
 
 boolean targetReached() {
    for (int i = 0; i < population.length; i++) {
      if (population[i].finished()) return true;
    }
    return false;
  }
  
 
 void calcFitness() {
    for (int i = 0; i < population.length; i++) {
      population[i].calcFitness();
    }
    order = 1;
  }
 
 Vehicles acceptReject()
 {
   Vehicles v;
   int index;
   float r;
   do
   {
     index = (int)random(population.length);
     r = random(totalFitness);
     v = population[index];
     if(r < v.fitness)
     {
       return v;
     }
   }while(true);
 }
 
 float getAvgFitness()
 {
   return avgFitness;
 }
 
 void generate()
 {
   newPopulation = new Vehicles[population.length];
   
  // Calculate total fitness of whole population
   
  totalFitness = getTotalFitness();
    
  avgFitness = totalFitness/population.length;
   
   
  for(int i = 0; i < population.length ; i++)
  {
     Vehicles partnerA = acceptReject();
     Vehicles partnerB = acceptReject();
     DNA child = partnerA.dna.crossOver(partnerB.dna);
     child.mutate(mutationRate);
     PVector position = new PVector(start.r.x+start.r.width/2, start.r.y+start.r.height/2);
     newPopulation[i] = new Vehicles(position,child);
  }
   population = newPopulation;
   generations++;

 }

 
  boolean finished() {
    return finished;
  }

  int getGenerations() {
    return generations;
  }
  
  float getTotalFitness() {
    float total = 0;
    for (int i = 0; i < population.length; i++) {
      total += population[i].getFitness();
    }
    return total;
  }
  
 float getAverageFitness() {
   
    float total = 0;
    
    for (int i = 0; i < population.length; i++) {
      total += population[i].getFitness();
      
    }
    return total / population.length;
  }
  
 float getMutationRate()
 {
   return mutationRate;
 }
  
}