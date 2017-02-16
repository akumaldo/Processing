Population pop;
PFont f;

String answer;

int popmax;
float mutationRate;


void setup()
{
  size(1000, 600);
  smooth();
  answer = "Sicutuvetru olha o peso do refrao";
  
  popmax = 200;
  
  mutationRate = 0.001;
  
  pop = new Population(answer, popmax, mutationRate);
  
  f = createFont("courrier", 10, true);
  
}


void draw()
{ 
  pop.matingPool();
  
  pop.generate();
  
  pop.calcFitness();
  
  displayInfo();
  
  if(pop.finished()) noLoop();
  
}

void displayInfo() 
{
  
  background(255);
  // Display current status of populationation
  String answer = pop.getBest();
  textFont(f);
  textAlign(LEFT);
  fill(0);
  
  
  textSize(24);
  text("Best phrase:",20,30);
  textSize(40);
  text(answer, 20, 100);

  textSize(18);
  text("total generations:     " + pop.getGenerations(), 20, 160);
  text("average fitness:       " + nf(pop.getAverageFitness(),0,2), 20, 180);
  text("total population: " + popmax, 20, 200);
  text("mutation rate:         " + (mutationRate * 100) + "%", 20, 220);
 
  textSize(10);
  text("All phrases:\n" + pop.allPhrases(), 800, 10);
}