import '../../shared/types/piece_color.dart';
import '../board.dart';
import '../coordinate.dart';
import '../move.dart';
import 'piece.dart';

class Pawn extends Piece {
  int value = 10;
  int movesMade = 0;
  Board board;

  Pawn({this.board, PIECE_COLOR side, Coordinate position})
      : super(board: board, side: side, position: position);

  @override
  get stringRep {
    if (side == PIECE_COLOR.WHITE) {
      return '♙';
    }
    return '♟︎';
  }

  @override
  bool canMove() {
    var sumPosition;
    if (side == PIECE_COLOR.BLACK) {
      sumPosition = Coordinate(col: position.col, row: position.row + 1);
    } else if (side == PIECE_COLOR.WHITE) {
      sumPosition = Coordinate(col: position.col, row: position.row - 1);
    }
    var piece = board.pieceAtPosition(position: sumPosition);
    if (piece == null) {
      return true;
    }
    return false;
  }

  @override
  List<Move> getPossibleMoves() {
    List<Move> moves = [];
    moves.addAll(moveTwoUpMoves());
    moves.addAll(diagonallyRightMoves());
    moves.addAll(diagonallyLeftMoves());
    moves.addAll(moveUpMoves());
    return moves;
  }

  moveUpMoves() {
    List<Move> moveUpMoves = [];
    var moveUpMovement = this.side == PIECE_COLOR.BLACK
        ? position.sum(coordinate: Coordinate(row: 1, col: 0))
        : position.sum(coordinate: Coordinate(row: -1, col: 0));
    if (board.isValidPosition(position: moveUpMovement) &&
        board.pieceAtPosition(position: moveUpMovement) == null) {
      moveUpMoves.add(Move(
          newPosition: moveUpMovement,
          piece: this,
          previousPosition: position));
    }
    return moveUpMoves;
  }

  moveTwoUpMoves() {
    List<Move> moveTwoUpMoves = [];

    var moveUpMovement = this.side == PIECE_COLOR.BLACK
        ? position.sum(coordinate: Coordinate(row: 1, col: 0))
        : position.sum(coordinate: Coordinate(row: -1, col: 0));

    var moveTwoUpMovement = this.side == PIECE_COLOR.BLACK
        ? position.sum(coordinate: Coordinate(row: 2, col: 0))
        : position.sum(coordinate: Coordinate(row: -2, col: 0));

    if (board.isValidPosition(position: moveTwoUpMovement) &&
        board.pieceAtPosition(position: moveTwoUpMovement) == null &&
        board.pieceAtPosition(position: moveUpMovement) == null &&
        (position.row == 2 ||
            position.row == 3 ||
            position.row == 12 ||
            position.row == 13)) {
      moveTwoUpMoves.add(Move(
          newPosition: moveTwoUpMovement,
          piece: this,
          previousPosition: position));
    }
    return moveTwoUpMoves;
  }

  diagonallyRightMoves() {
    List<Move> diagonallyRightMoves = [];
    var moveDiagonallyRight = this.side == PIECE_COLOR.BLACK
        ? position.sum(coordinate: Coordinate(row: 1, col: 1))
        : position.sum(coordinate: Coordinate(row: -1, col: 1));

    if (board.isValidPosition(position: moveDiagonallyRight) &&
        board.pieceAtPosition(position: moveDiagonallyRight)?.position?.row !=
            null &&
        board.pieceAtPosition(position: moveDiagonallyRight)?.side !=
            this.side) {
      diagonallyRightMoves.add(Move(
          newPosition: moveDiagonallyRight,
          piece: this,
          pieceToCapture: board.pieceAtPosition(position: moveDiagonallyRight),
          previousPosition: position));
    }
    return diagonallyRightMoves;
  }

  diagonallyLeftMoves() {
    List<Move> diagonallyLeftMoves = [];
    var moveDiagonallyLeft = this.side == PIECE_COLOR.BLACK
        ? position.sum(coordinate: Coordinate(row: 1, col: -1))
        : position.sum(coordinate: Coordinate(row: -1, col: -1));

    if (board.isValidPosition(position: moveDiagonallyLeft) &&
        board.pieceAtPosition(position: moveDiagonallyLeft)?.position?.row !=
            null &&
        board.pieceAtPosition(position: moveDiagonallyLeft)?.side !=
            this.side) {
      diagonallyLeftMoves.add(Move(
          newPosition: moveDiagonallyLeft,
          piece: this,
          pieceToCapture: board.pieceAtPosition(position: moveDiagonallyLeft),
          previousPosition: position));
    }
    return diagonallyLeftMoves;
  }
}
