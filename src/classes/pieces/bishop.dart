import '../../shared/types/piece_color.dart';
import '../board.dart';
import '../coordinate.dart';
import '../move.dart';
import 'piece.dart';

class Bishop extends Piece {
  int value = 40;
  int movesMade;

  Bishop(
      {Board board, PIECE_COLOR side, Coordinate position, this.movesMade = 0})
      : super(board: board, side: side, position: position);

  @override
  get stringRep {
    if (side == PIECE_COLOR.WHITE) {
      return '♗';
    }
    return '♝';
  }

  @override
  bool canMove() {
    var positions = [
      Coordinate(col: position.col + 1, row: position.row + 1),
      Coordinate(col: position.col - 1, row: position.row - 1),
      Coordinate(col: position.col + 1, row: position.row - 1),
      Coordinate(col: position.col - 1, row: position.row + 1)
    ];

    var emptySpace = 0;
    for (var sumPosition in positions) {
      if (board.isValidPosition(position: sumPosition) &&
          (board.pieceAtPosition(position: sumPosition) == null ||
              board.pieceAtPosition(position: sumPosition)?.side != side)) {
        emptySpace = emptySpace + 1;
      }
    }

    if (emptySpace > 0) {
      return true;
    }

    return false;
  }

  @override
  List<Move> getPossibleMoves() {
    List<Move> moves = [];
    moves.addAll(northWestMoves());
    moves.addAll(northEastMoves());
    moves.addAll(southWestMoves());
    moves.addAll(southEastMoves());
    return moves;
  }

  northWestMoves() {
    List<Move> northWestMoves = [];

    for (int i = 1; i <= 15; i++) {
      var northWestMovement =
          position.sum(coordinate: Coordinate(col: -i, row: -i));

      if (board.isValidPosition(position: northWestMovement)) {
        //camino 0 nuestra pieza adelante
        if (board.pieceAtPosition(position: northWestMovement) != null &&
            board.pieceAtPosition(position: northWestMovement)?.side ==
                this.side) {
          break;
        }
        //camino 1 tiene pieza contrincante
        if (board.pieceAtPosition(position: northWestMovement) != null &&
            board.pieceAtPosition(position: northWestMovement)?.side !=
                this.side) {
          northWestMoves.add(Move(
              newPosition: northWestMovement,
              piece: this,
              pieceToCapture:
                  board.pieceAtPosition(position: northWestMovement),
              previousPosition: position));
          break;
        }
        //camino 2 es nulo
        if (board.pieceAtPosition(position: northWestMovement) == null) {
          northWestMoves.add(Move(
              newPosition: northWestMovement,
              piece: this,
              previousPosition: position));
        }
      }
    }
    return northWestMoves;
  }

  northEastMoves() {
    List<Move> northEastMoves = [];

    for (int i = 1; i <= 15; i++) {
      var northEastMovement =
          position.sum(coordinate: Coordinate(col: i, row: -i));
      if (board.isValidPosition(position: northEastMovement)) {
        //camino 0 nuestra pieza adelante
        if (board.pieceAtPosition(position: northEastMovement) != null &&
            board.pieceAtPosition(position: northEastMovement)?.side ==
                this.side) {
          break;
        }
        //camino 1 tiene pieza contrincante
        if (board.pieceAtPosition(position: northEastMovement) != null &&
            board.pieceAtPosition(position: northEastMovement)?.side !=
                this.side) {
          northEastMoves.add(Move(
              newPosition: northEastMovement,
              piece: this,
              pieceToCapture:
                  board.pieceAtPosition(position: northEastMovement),
              previousPosition: position));
          break;
        }
        //camino 2 es nulo
        if (board.pieceAtPosition(position: northEastMovement) == null) {
          northEastMoves.add(Move(
              newPosition: northEastMovement,
              piece: this,
              previousPosition: position));
        }
      }
    }
    return northEastMoves;
  }

  southWestMoves() {
    List<Move> southWestMoves = [];

    for (int i = 1; i <= 15; i++) {
      var southWestMovement =
          position.sum(coordinate: Coordinate(col: -i, row: i));
      if (board.isValidPosition(position: southWestMovement)) {
        //camino 0 nuestra pieza adelante
        if (board.pieceAtPosition(position: southWestMovement) != null &&
            board.pieceAtPosition(position: southWestMovement)?.side ==
                this.side) {
          break;
        }
        if (board.pieceAtPosition(position: southWestMovement) != null &&
            board.pieceAtPosition(position: southWestMovement)?.side !=
                this.side) {
          southWestMoves.add(Move(
              newPosition: southWestMovement,
              piece: this,
              pieceToCapture:
                  board.pieceAtPosition(position: southWestMovement),
              previousPosition: position));
          break;
        }
        //camino 1 es nulo
        if (board.pieceAtPosition(position: southWestMovement) == null) {
          southWestMoves.add(Move(
              newPosition: southWestMovement,
              piece: this,
              previousPosition: position));
        }
        //camino 2 tiene pieza contrincante
      }
    }
    return southWestMoves;
  }

  southEastMoves() {
    List<Move> southEastMoves = [];

    for (int i = 1; i <= 15; i++) {
      var southEastMovement =
          position.sum(coordinate: Coordinate(col: i, row: i));
      if (board.isValidPosition(position: southEastMovement)) {
        //camino 0 nuestra pieza adelante
        if (board.pieceAtPosition(position: southEastMovement) != null &&
            board.pieceAtPosition(position: southEastMovement)?.side ==
                this.side) {
          break;
        }
        //camino 1 tiene pieza contrincante
        if (board.pieceAtPosition(position: southEastMovement) != null &&
            board.pieceAtPosition(position: southEastMovement)?.side !=
                this.side) {
          southEastMoves.add(Move(
              newPosition: southEastMovement,
              piece: this,
              pieceToCapture:
                  board.pieceAtPosition(position: southEastMovement),
              previousPosition: position));
          break;
        }
        //camino 2 es nulo
        if (board.pieceAtPosition(position: southEastMovement) == null) {
          southEastMoves.add(Move(
              newPosition: southEastMovement,
              piece: this,
              previousPosition: position));
        }
      }
    }
    return southEastMoves;
  }
}
