public class Piece {
  String side; 
  PImage image;
  boolean moved = false; 
  int numMove = 0;
  String name;

  public Piece(String side) {
    this.side = side;
  }
  
  public PVector[] move(Board b, int x, int y) {
    return new PVector[0];
  }
}
