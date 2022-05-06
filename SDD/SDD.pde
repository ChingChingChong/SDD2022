PImage img;
int[][] Linear = new int[1000000][4];
int[][] Poly = new int[10000000][6];
int threshhold = 0;
int tolerence = 2;
int[][] Image = new int[pixelWidth][pixelHeight];
void setup(){
  size(1000,1000); //<>//
  img = loadImage("joe.jpg");
  image(img,0,0);  
  filter(GRAY);
  loadPixels();
     Linear=LinearEdge(pixels);
     clear();
  fill(0);
     LinearDraw();



 
  

}


void draw(){
  

  
}

void addrowtopixel(){
  
 for(int i = 0; i<pixelHeight; i++){
   
  append(pixels, 0); 
   
 }
 print(pixels.length);
  
}

int[][] LinearEdge(int[] pixels){
  
  int counter = 0;
  
  for(int i = 0; i<pixels.length-(pixelHeight*tolerence); i+=1){
  
  for(int j = 1; j < tolerence; j++){
   for( int h = 1; h < tolerence; h++){
     
    if(pixels[i]>color(200)&&pixels[i]<color(255)){
      if(pixels[i]==pixels[i+(j*pixelHeight)+h]){
      
      Linear[counter][0] = floor(i/pixelHeight);
      Linear[counter][1] =  i%pixelWidth;
      Linear[counter][2] = floor((i+j)/pixelHeight);
      Linear[counter][3] = (i%pixelWidth)+h;
      counter+=1;
      
    }  //<>//
    }
     
   }
   
    
  }
  
  }
  return  Linear;
}

void LinearDraw(){
  
 for( int i = 0; i<Linear.length; i++){
   
  line(Linear[i][1], Linear[i][0], Linear[i][3], Linear[i][2]); 
   stroke(255);
 }
  
}

int[][] Polyedge(int[] pixels[]){
  
  return pixels;
  
}

void Polydraw(){
  
  
  
}

void exportasPDF(){
  
  
  
}

void exportasSVG(){
  
  
  
}
