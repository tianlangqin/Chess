
public class King extends Piece {
  public King (String side) {
    super(side);
    
    if (side.equals("black")) {
      image = loadImage("pieces_image/black_king.png");
    } else {
      image = loadImage("pieces_image/white_king.png");
    }
    image.resize(75,75);
  }
  
  public PVector[] move() {
    PVector[] result = new PVector[]{
      new PVector(0, 1),
      new PVector(0, -1),
      new PVector(1, 0),
      new PVector(-1, 0),
      new PVector(1, 1),
      new PVector(1, -1),
      new PVector(-1, 1),
      new PVector(-1, -1),
    };
    
    return result;
  }
}
