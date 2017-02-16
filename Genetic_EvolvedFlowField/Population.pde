class Population
{
  
  ArrayList<Vehicles> matingPool;
  
  Vehicles[] population;
  
  int generations;
  
  float mutationRate;
 
  int order; 
  
  
 Population(int initialPop, float m)
 {
   
   matingPool = new ArrayList<Vehicles>();
   
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
  
  
 void matingPool()
 {
   
   matingPool.clear();
   
    // Calculate total fitness of whole population
    float totalFitness = getTotalFitness();
    
    float avgFitness = totalFitness/population.length;

    // Calculate normalized fitness for each member of the population
    // Based on normalized fitness, each member will get added to the mating pool a certain number of times a la roulette wheel
    // A higher fitness = more entries to mating pool = more likely to be picked as a parent
    // A lower fitness = fewer entries to mating pool = less likely to be picked as a parent
    int count = 0;
    for (int i = 0; i < population.length; i++) {
      float fitness = population[i].getFitness();
       //if (fitness > avgFitness) {
         count++;
         float fitnessNormal = fitness / totalFitness;
         int n = (int)(fitnessNormal * 50000);
           for(int j = 0; j < n; j++)
           {
             matingPool.add(population[i]);
           }
        //}
     //println("Total: " + count + " " + population.length);
   }
 }
 
 void generate()
 {
  for(int i = 0; i < population.length ; i++)
  {
     int a = int(random(matingPool.size()));
     int b = int(random(matingPool.size()));
     Vehicles partnerA = matingPool.get(a);
     Vehicles partnerB = matingPool.get(b);
     DNA child = partnerA.dna.crossOver(partnerB.dna);
     child.mutate(mutationRate);
     PVector position = new PVector(start.r.x+start.r.width/2, start.r.y+start.r.height/2);
     population[i] = new Vehicles(position,child);
  }
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
  
}