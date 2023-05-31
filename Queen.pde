
public class Queen extends Piece {
  public Queen(String side) {
    super(side);
    if (side.equals("black")) {
      image = loadImage("pieces_image/black_queen.png");
    } else {
      image = loadImage("pieces_image/white_queen.png");
    }
    image.resize(75,75);
  }
  
  @Override
  public PVector[] move() {
    return new PVector[0];//stub
  }
}
