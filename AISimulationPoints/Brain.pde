class Brain{
  PVector[] directions;
  int step = 0;

  Brain(int size){
    directions = new PVector[size];
    randomize();
  }

  void randomize(){
    for(int i = 0; i < directions.length; i++){
      float randomAngle = random(2*PI);
      directions[i] = PVector.fromAngle(randomAngle);
    }
  }
  
  Brain clone(){
    Brain clone = new Brain(directions.length);
    for(int i = 0; i < directions.length; i++){
      //Recorremos toda la lista del cerebro y guardamos los valores en un nuevo cerebro
      clone.directions[i] = directions[i].copy(); 
    }
    return clone;
  }
  
  
  void mutate(){
    float mutationRate = 0.01;
    for(int i = 0; i < directions.length; i++){
      float rand = random(1); //Rand guarda un valor de hasta el 1%
      if(rand < mutationRate){
        //Define esta direccion como una direccion random
        float randomAngle = random(2*PI);
        directions[i] = PVector.fromAngle(randomAngle);
      }
    }
  }
}
