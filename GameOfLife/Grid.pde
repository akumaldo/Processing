public class Grid
{
  int size = 8;
  
  int generation = 0;
  
  Cells[][] cells;
  
  int cols;
  int rows;
  
  int numNeighbors = 0;

  Grid()
  {
   cols = int(width/ size);
   rows = int(height/ size);
   cells = new Cells[cols][rows];
   

   restart();
  
  }
  
  
  void restart()
  {
    for(int i = 0; i < cols; i++){
      for(int j = 0; j < rows ; j++){
        cells[i][j] = new Cells(size*i,j*size,size);
      }
    }
  }
  
  void generate()
  {
    for(int i = 0; i < cols; i++){
      for(int j = 0; j < rows ; j++){
       cells[i][j].savePrevious();
      }
    }
    
    for(int i = 0; i < cols; i++){
      for(int j = 0; j < rows ; j++){
        
        numNeighbors=0; //reset the value back to zero
        
        for(int x = -1; x<=1 ; x++){
          for(int y = -1; y<=1; y++){
            numNeighbors += cells[(i+x+cols)%cols][(j+y+rows)%rows].previous;
          }
        }
        numNeighbors -= cells[i][j].previous;
       
       if ((cells[i][j].state == 1) && (numNeighbors <  2)) cells[i][j].newState(0);           // Loneliness
       else if ((cells[i][j].state == 1) && (numNeighbors >  3)) cells[i][j].newState(0);           // Overpopulation
       else if ((cells[i][j].state == 0) && (numNeighbors ==  3)) cells[i][j].newState(1);        // Reproduction
      }
    }
  }
    
  void display()
  {
    for(int i = 1; i < cols-1; i++){
      for(int j = 1; j < rows-1 ; j++){
        cells[i][j].display();
      }
    }
    
  }
    
}