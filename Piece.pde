public class Piece {
  String side; 
  PImage image;
  boolean moved = false; 
  boolean blocked = false;

  public Piece(String side) {
    this.side = side;
  }
  
  public PVector[] move() {
    return new PVector[0];//stub
  }
}
