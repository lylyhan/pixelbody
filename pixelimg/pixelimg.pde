/*
what does it mean to you, my body
if i were to listen to your heartbeat, will i cry
will i still cry
am i listening to the wrong side of your chest
does that make it a gesture for the sake of a gesture
am i really listening, are you?
*/
PImage img,maskImage;
int halfImage;
float a=3;
void setup(){
  img=loadImage("img1.JPG");
  //maskImage = loadImage("mask.jpg");
  //println(maskImage.getsize());
  halfImage=width*height/2;
  img.resize(500,0);
  img.loadPixels();
  for (int i = 0; i < halfImage; i++) {
    img.pixels[i+halfImage] = img.pixels[i];
  }
  img.updatePixels();
  //img.mask(maskImage);
  
  size(500,375);
  background(255);
}

void draw(){
  background(255);
  a=a+1.5*sin(frameCount/100);
  image(img,0,0);
  //rotate(PI/2);
  pixelchange(a);
  
}

void pixelchange(float a){
  
//static pixel changes, in this case lines on top of sketch
loadPixels();
//println("ss",pixels.length);
for (int x = 0; x<width; x+=1) {
  for(int y = 0; y<height; y+=1){
    int loc=(x+(y*width));
    if(x>1){
      
       //pixels[loc]=img.pixels[loc];
    pixels[loc]=int((pixels[loc-1]+pixels[loc])/a);
      
    }
    
}
}
updatePixels();

}
