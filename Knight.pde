
public class Knight extends Piece {
  public Knight (String side) {
    super(side);
    name = "knight";
    if (side.equals("black")) {
      image = loadImage("pieces_image/black_knight.png");
    } else {
      image = loadImage("pieces_image/white_knight.png");
    }
    image.resize(75,75);
}
  
  @Override
  public PVector[] move(Board b, int x, int y) {
    return new PVector[] {
      new PVector(2,1),
      new PVector(2,-1),
      new PVector(-2,1),
      new PVector(-2,-1),
      new PVector(1,2),
      new PVector(1,-1),
      new PVector(-1,2),
      new PVector(-1,-2),
    };
  }
}
