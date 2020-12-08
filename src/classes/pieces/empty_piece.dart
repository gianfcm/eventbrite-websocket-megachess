import '../../shared/types/piece_color.dart';
import '../board.dart';
import '../coordinate.dart';
import 'piece.dart';

class EmptyPiece extends Piece {
  int value = 0;
  int movesMade;

  EmptyPiece(
      {Board board, PIECE_COLOR side, Coordinate position, this.movesMade = 0})
      : super(board: board, side: side, position: position);

  @override
  get stringRep {
    return ' ';
  }
}
