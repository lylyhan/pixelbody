/*
what does it mean to you, my body
if i were to listen to your heartbeat, will i cry
will i still cry
am i listening to the wrong side of your chest
does that make it a gesture for the sake of a gesture
am i really listening, are you?
*/
PFont f;
PImage img,img2;
int halfImage;
float a;
int gridw,gridh,gridx,gridy;
PImage[] grids,grids2;

void setup(){
  //set up images, fonts and background
  //img=loadImage("img3.jpg");
  img2=loadImage("img2.JPG");
  f=loadFont("BernardMT-Condensed-48.vlw");
  size(700,700);
  background(255);
}

void draw(){
  background(0);
   gridx=3;
   gridy=5;
  //parameter that affects how pixels are morphed through time and space
  a=100*sin(frameCount/10);
  //write all the text
  textFont(f,48);
  fill(255);
  text("am i listening to",mouseX,mouseY);
  textFont(f,20);
  text("the wrong side of",width-mouseX,height-mouseY);
  text("your chest",width-mouseX/2,height-mouseY/2);
  textFont(f,20);
  text("what does it mean to you",mouseX/3,mouseY/3);
  textFont(f,60);
  text("my body",width-mouseX/3,height-mouseY/3);
  //assign parts of the image to a collection of grids
  cutouts();
  //draw the grids on canvas
  int i = 0;
    for (int y = 0; y < gridy; y++){
      for (int x = 0; x < gridx; x++){
        image(grids[i], x*gridw, y*gridh);
        //image(grids2[i], 500-x*gridw, 600-y*gridh);
        i++;
      }
    }
    //change pixels
   pixelchange(a);
}

void cutouts(){
  //function that assign different parts of the image to a collection of grids.
  //referenced from generative design 
  gridw=width/gridx;
  gridh=height/gridy;
//gridw=width/gridx+int(5*sin(frameCount/10));
//gridh=height/gridy+int(5*sin(frameCount/10));
int gridcount=gridx*gridy;
grids=new PImage[gridcount];
//grids2=new PImage[gridcount];
int i=0;
for(int y=0;y<gridy;y++){
for(int x=0;x<gridx;x++){
  int cropx=(int) (mouseX-gridw/2)/2;
  int cropy=(int) (mouseY-gridh/2);
  grids[i]=img2.get(cropx,cropy,gridw,gridh);
  //grids2[i]=img.get(cropx,cropy,gridw,gridh);
  i++;
}
}

}

void pixelchange(float a){
//divide the canvas into two regions(left and right) and devise
//pixel changes corresponding to each of these regions.
loadPixels();
for (int x = 0; x<width; x+=1) {
  for(int y = 0; y<height; y+=1){
    int loc=(x+(y*width));
    if(x>1 && x<width/2){
      //if(x%100<70 && abs(x-y)<30){
    pixels[loc]=int((pixels[loc-1]+pixels[loc+1])/a);
    }
    else{
    pixels[loc]=int(pixels[loc]+a);
    
    }
    
}
}
updatePixels();

}
