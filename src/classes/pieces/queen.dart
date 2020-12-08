import '../../shared/types/piece_color.dart';
import '../board.dart';
import '../coordinate.dart';
import '../move.dart';
import 'bishop.dart';
import 'piece.dart';
import 'rook.dart';

class Queen extends Piece {
  int value = 5;
  int movesMade;

  Queen(
      {Board board, PIECE_COLOR side, Coordinate position, this.movesMade = 0})
      : super(board: board, side: side, position: position);

  @override
  get stringRep {
    if (side == PIECE_COLOR.WHITE) {
      return '♕';
    }
    return '♛';
  }

  @override
  List<Move> getPossibleMoves() {
    List<Move> moves = [];
    Queen bishop =
        Bishop(board: this.board, position: position, side: this.side);
    Queen rook = Rook(board: this.board, position: position, side: this.side);
    moves.addAll(bishop.getPossibleMoves());
    moves.addAll(rook.getPossibleMoves());
    return moves;
  }
}
