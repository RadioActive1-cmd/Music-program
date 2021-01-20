import processing.core.PFont;
import processing.core.PShapeSVG.Font;
import processing.core.PFont;
import processing.core.PFont;
//Minim Library: use Sketch / Import Library / Add Library
//Minim Library: use Sketch / Import Library / Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Global Variables
Minim minim_app; //creates object to access all functions
int numberOfSongs = 3;
AudioPlayer[] song = new AudioPlayer[numberOfSongs]; //create "play List" variable holding extentions WAV, AIFF, AU, SND, and MP3
AudioMetaData[]  songMetaData = new AudioMetaData[numberOfSongs];
int loopIntNum = 1; //Able to connect this variable to buttons, increasing the loop number //loopIntNum+1 //loopIntNum+=
int currentSong = numberOfSongs - numberOfSongs; //Formula based on previous variable

void setupsetup(){
  size(1000,500); //fullScreen(), displayWidth & displayHeight, leads to ScreenChecker()
  minim = new Minim(this); // load from data directory, loadFile should also load from project folder, like loadimage
  //Note: array varaibles based on operators to describe 0, 1, 2
  //Formula patter: repeating formula easier to program
  song[currentSong] = minim.loadFile("../Music/Just Dance.mp3"); //able to pass absoulute path, file name, and URL
  song[currentSong+=1] = minim.loadFile("../Music/Breatha.mp3");
  song[currentSong+=1] = minim.loadFile("../Music/19th Floor.mp3");
  //using Pattern in FOR Loop
  //
  currentSong =numberOfSongs - numberOfSongs;
  for (int i=currentSong; i<numberOfSongs; i++) {
    songMetaData[i] = song[i].getMetaData();
  }//End FOR Loop, loading Meta Data
  //
  println("Start of Console"); //Not seen, means output to console too long //Decrease println's or increase memory
  println("Click the Console to Finish Starting this program"); //"Windows expects you to 'click into the window'
  println("Press keyboard to test: P, etc.");
  //
  for ( int i=currentSong; i<numberOfSongs; i++) {
    println("File Name: ", songMetaData[i].fileName() );
    println("Song Length (in milliseconds); ", songMetaData[i].length() );
    println("Song Length (in seconds): ", songMetaData[i].length()/1000 );
    println("Song Length (in mintues and seconds): ", songMetaData[i].length()/1000/60, "minutes", (songMetaData[i].length()/1000)-(songMetaData[i].length()/1000/60 *60), "seconds" );
    println("Song Title: ", songMetaData[i].title() );
    println("Author: ", songMetaData[i].author() );
    println("Composer: ", songMetaData[i].composer() );
    println("Orchestra: ", songMetaData[i].orchestra() );
    println("Albums: ", songMetaData[i].album() );
    println("Disk: ", songMetaData[i].disc() );
    println("Publisher: ", songMetaData[i].publisher() );
    println("Date Release: ", songMetaData[i].date() );
    println("Copyright: ", songMetaData[i].copyright() );
    println("Comments: ", songMetaData[i].comment() );
    println("Lyrics: ", songMetaData[i].lyrics() );
    println("Track: ", songMetaData[i].track() );
    println("Genre: ", songMetaData[i].genre() );
    println("Encoded: ", songMetaData[i].encoded() );
  }//End Console Output
  //
}

void drawdraw() {
}//End draw()

void keyPressed() {
  //
  if ( key == 'p' || key == 'p' ) {//Play-Pause Button
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
    } else if ( song[currentSong].position() == song[currentSong].length() ) {//.legnth() = end
    song[currentSong].rewind();
    song[currentSong].play();
    } else {
      song[currentSong].play();
    }
  }//End of Play-Pause Button
   //
  if ( key == 's' || key == 'S' ) {//Stop Button
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
    } else if ( song[currentSong].position() == song[currentSong].length() ) {//.legnth() = end
    song[currentSong].rewind();
    } else { //Song is not playing
      song[currentSong].rewind();
    }
  }//End Stop Button
  //
  if ( key == 'f' || key == 'F') song[currentSong].skip(1000); // skip forward 1 second (1000 milliseconds)
  if ( key == 'r' || key == 'R') song[currentSong].skip(-1000); // skip backward 1 second (1000 milliseconds)
  //
  if ( key == 'l' || key =='L' ) song[currentSong].loop(loopIntNum); //Loop Button
  //
  //Next Button
  if ( key == 'n' || key == 'N' ) {
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
      if ( currentSong == numberOfSongs-1 ) {
        currentSong = numberOfSongs - numberOfSongs;
      } else {
        currentSong++;
      }
      song[currentSong].play();
    } else {
      song[currentSong].rewind();
      if ( currentSong == numberOfSongs-1 ) {
        currentSong = numberOfSongs - numberOfSongs;
      } else {
        currentSong++;
      }
    }
  }//End Next Button
  //
  //Prevoius Button ("Backwards on play List)
  if (key == 'b' || key == 'B') {
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
      if ( currentSong == numberOfSongs - numberOfSongs ) {
        currentSong = numberOfSongs-1;
      } else {
        currentSong--;
      }
      song[currentSong].play();
    } else {
      song[currentSong].rewind();
      if ( currentSong == numberOfSongs - numberOfSongs ) {
      } else {
        currentSong--;
      }
    }
  }//End Previous Button
  //
}// End keyPressed()
//
void mousePressed() {
}//End mousePressed()
