import 'coordinate.dart';
import 'pieces/piece.dart';

class Move {
  Move(
      {this.piece,
      this.newPosition,
      this.pieceToCapture = null,
      this.promotion = false,
      this.previousPosition});
  Piece piece;
  Coordinate newPosition;
  Coordinate previousPosition;
  Piece pieceToCapture;
  bool promotion;
}
