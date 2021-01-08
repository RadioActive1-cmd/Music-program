//Minim Library: use Sketch / Import Library / Add Library
//Minim Library: use Sketch / Import Library / Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ungens.*;

// Global Variables
Minim minim; //creates object to access all functions
AudioPlayer song1; //create "play List" variable holding extentions WAV, AIFF, AU, SND, and MP3

void setup() {
  size(500, 400); //fullScreen(), displayWidth & displayHeight, leads to ScreenChecker()
  Minim = new Minim(this); // load from data directory, loadFile should also load from project folder, like loadimage
  
}

void draw() {
}//End draw()

void keyPressed() {
  //
  if ( key == 'p' || key == 'p' ) {//Play-Pause Button
    if ( song1.isPlaying() ) {
      song1.pause();
    } else if ( song1.position() == song1.length() ) {//.legnth() = end
    song1.rewind();
    song1.play();
    } else {
      song1.play();
    }
  }//End of Play-Pause Button
   //
  if ( key == 'p' || key == 's' ) {////Stop Button
    if ( song1.isPlaying() ) {
      song1.pause();
      song1.rewind();
    } else if ( song1.position() == song1.length() ) {//.legnth() = end
    song1.rewind();
    } else { //Song is not playing
      song1.rewind();
    }
  }//End Stop Button
  //
  if ( key == 'f' || key == 'F') song1.skip(1000); // skip forward 1 second (1000 milliseconds)
  if ( key == 'r' || key == 'R') song1.skip(-1000); // skip backward 1 second (1000 milliseconds)
  //
}// End keyPressed()
//
void mousePressed() {}//End mousePressed()
