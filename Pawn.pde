
public class Pawn extends Piece {
  
 
  public Pawn (String side) {
    super(side);
    if (side.equals("black")) {
      image = loadImage("pieces_image/black_pawn.png");
    } else {
      image = loadImage("pieces_image/white_pawn.png");
    }
    image.resize(75,75);
  }
  
  @Override
  public PVector[] move() {
    PVector[] result = new PVector[]{ new PVector(-1, 0)};
    if (!moved) {
      result = new PVector[]{ new PVector(-1, 0), new PVector(-2,0)};
    }
    return result;
  }
}
