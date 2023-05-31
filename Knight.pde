
public class Knight extends Piece {
  public Knight (String side) {
    super(side);
    if (side.equals("black")) {
      image = loadImage("pieces_image/black_knight.png");
    } else {
      image = loadImage("pieces_image/white_knight.png");
    }
    image.resize(75,75);
}
  
  @Override
  public PVector[] move() {
    return new PVector[0];//stub
  }
}
