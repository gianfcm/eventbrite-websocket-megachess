import '../../shared/types/piece_color.dart';
import '../board.dart';
import '../coordinate.dart';
import '../move.dart';
import 'piece.dart';

class Horse extends Piece {
  int value = 30;
  int movesMade;

  Horse(
      {Board board, PIECE_COLOR side, Coordinate position, this.movesMade = 0})
      : super(board: board, side: side, position: position);

  @override
  get stringRep {
    if (side == PIECE_COLOR.WHITE) {
      return '♘';
    }
    return '♞';
  }

  @override
  List<Move> getPossibleMoves() {
    return horseMoves();
  }

  horseMoves() {
    List<Move> horseMoves = [];
    var possibleHorseMoves = [
      position.sum(coordinate: Coordinate(row: -2, col: 1)),
      position.sum(coordinate: Coordinate(row: -2, col: -1)),
      position.sum(coordinate: Coordinate(row: -1, col: 2)),
      position.sum(coordinate: Coordinate(row: -1, col: -2)),
      position.sum(coordinate: Coordinate(row: 1, col: -2)),
      position.sum(coordinate: Coordinate(row: 2, col: -1)),
      position.sum(coordinate: Coordinate(row: 2, col: 1)),
      position.sum(coordinate: Coordinate(row: 1, col: 2)),
    ];

    for (var possibleHorseMove in possibleHorseMoves) {
      if (board.isValidPosition(position: possibleHorseMove)) {
        if (board.pieceAtPosition(position: possibleHorseMove) != null &&
            board.pieceAtPosition(position: possibleHorseMove)?.side != side) {
          horseMoves.add(Move(
              newPosition: possibleHorseMove,
              piece: this,
              pieceToCapture:
                  board.pieceAtPosition(position: possibleHorseMove),
              previousPosition: position));
        }
        if (board.pieceAtPosition(position: possibleHorseMove) == null) {
          horseMoves.add(Move(
              newPosition: possibleHorseMove,
              piece: this,
              previousPosition: position));
        }
      }
    }
    return horseMoves;
  }
}
