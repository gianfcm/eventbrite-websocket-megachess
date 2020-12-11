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
  bool canMove() {
    Rook rook = Rook(board: this.board, position: position, side: this.side);
    Bishop bishop =
        Bishop(board: this.board, position: position, side: this.side);
    if (bishop.canMove() || rook.canMove()) {
      return true;
    }
    return false;
  }

  @override
  List<Move> getPossibleMoves() {
    List<Move> moves = [];
    moves.addAll(northWestMoves(piece: this));
    moves.addAll(northEastMoves(piece: this));
    moves.addAll(southWestMoves(piece: this));
    moves.addAll(southEastMoves(piece: this));
    moves.addAll(movesUp(piece: this));
    moves.addAll(movesDown(piece: this));
    moves.addAll(movesRight(piece: this));
    moves.addAll(movesLeft(piece: this));
    return moves;
  }

  northWestMoves({Piece piece}) {
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
              piece: piece,
              pieceToCapture:
                  board.pieceAtPosition(position: northWestMovement),
              previousPosition: position));
          break;
        }
        //camino 2 es nulo
        if (board.pieceAtPosition(position: northWestMovement) == null) {
          northWestMoves.add(Move(
              newPosition: northWestMovement,
              piece: piece,
              previousPosition: position));
        }
      }
    }
    return northWestMoves;
  }

  northEastMoves({Piece piece}) {
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
              piece: piece,
              pieceToCapture:
                  board.pieceAtPosition(position: northEastMovement),
              previousPosition: position));
          break;
        }
        //camino 2 es nulo
        if (board.pieceAtPosition(position: northEastMovement) == null) {
          northEastMoves.add(Move(
              newPosition: northEastMovement,
              piece: piece,
              previousPosition: position));
        }
      }
    }
    return northEastMoves;
  }

  southWestMoves({Piece piece}) {
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
              piece: piece,
              pieceToCapture:
                  board.pieceAtPosition(position: southWestMovement),
              previousPosition: position));
          break;
        }
        //camino 1 es nulo
        if (board.pieceAtPosition(position: southWestMovement) == null) {
          southWestMoves.add(Move(
              newPosition: southWestMovement,
              piece: piece,
              previousPosition: position));
        }
        //camino 2 tiene pieza contrincante
      }
    }
    return southWestMoves;
  }

  southEastMoves({Piece piece}) {
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
              piece: piece,
              pieceToCapture:
                  board.pieceAtPosition(position: southEastMovement),
              previousPosition: position));
          break;
        }
        //camino 2 es nulo
        if (board.pieceAtPosition(position: southEastMovement) == null) {
          southEastMoves.add(Move(
              newPosition: southEastMovement,
              piece: piece,
              previousPosition: position));
        }
      }
    }
    return southEastMoves;
  }

  movesUp({Piece piece}) {
    List<Move> movesUpMoves = [];

    for (int i = 1; i < 15; i++) {
      var movesUpMovement =
          position.sum(coordinate: Coordinate(col: 0, row: -i));
      if (board.isValidPosition(position: movesUpMovement)) {
        //camino 0 nuestra pieza adelante
        if (board.pieceAtPosition(position: movesUpMovement) != null &&
            board.pieceAtPosition(position: movesUpMovement)?.side ==
                this.side) {
          break;
        }
        //camino 1 tiene pieza contrincante
        if (board.pieceAtPosition(position: movesUpMovement) != null &&
            board.pieceAtPosition(position: movesUpMovement)?.side !=
                this.side) {
          movesUpMoves.add(Move(
              newPosition: movesUpMovement,
              piece: piece,
              pieceToCapture: board.pieceAtPosition(position: movesUpMovement),
              previousPosition: position));
          break;
        }
        //camino 2 es nulo
        if (board.pieceAtPosition(position: movesUpMovement) == null) {
          movesUpMoves.add(Move(
              newPosition: movesUpMovement,
              piece: piece,
              previousPosition: position));
        }
      }
    }
    return movesUpMoves;
  }

  movesDown({Piece piece}) {
    List<Move> movesDownMoves = [];
    for (int i = 1; i < 15; i++) {
      var movesDownMovement =
          position.sum(coordinate: Coordinate(col: 0, row: i));
      if (board.isValidPosition(position: movesDownMovement)) {
        //camino 0 nuestra pieza adelante
        if (board.pieceAtPosition(position: movesDownMovement) != null &&
            board.pieceAtPosition(position: movesDownMovement)?.side ==
                this.side) {
          break;
        }
        //camino 1 tiene pieza contrincante
        if (board.pieceAtPosition(position: movesDownMovement) != null &&
            board.pieceAtPosition(position: movesDownMovement)?.side !=
                this.side) {
          movesDownMoves.add(Move(
              newPosition: movesDownMovement,
              piece: piece,
              pieceToCapture:
                  board.pieceAtPosition(position: movesDownMovement),
              previousPosition: position));
          break;
        }
        //camino 2 es nulo
        if (board.pieceAtPosition(position: movesDownMovement) == null) {
          movesDownMoves.add(Move(
              newPosition: movesDownMovement,
              piece: piece,
              previousPosition: position));
        }
      }
    }
    return movesDownMoves;
  }

  movesRight({Piece piece}) {
    List<Move> movesRightMoves = [];
    for (int i = 1; i < 15; i++) {
      var movesRightMovement =
          position.sum(coordinate: Coordinate(col: i, row: 0));
      if (board.isValidPosition(position: movesRightMovement)) {
        //camino 0 nuestra pieza adelante
        if (board.pieceAtPosition(position: movesRightMovement) != null &&
            board.pieceAtPosition(position: movesRightMovement)?.side ==
                this.side) {
          break;
        }
        //camino 1 tiene pieza contrincante
        if (board.pieceAtPosition(position: movesRightMovement) != null &&
            board.pieceAtPosition(position: movesRightMovement)?.side !=
                this.side) {
          movesRightMoves.add(Move(
              newPosition: movesRightMovement,
              piece: piece,
              pieceToCapture:
                  board.pieceAtPosition(position: movesRightMovement),
              previousPosition: position));
          break;
        }
        //camino 2 es nulo
        if (board.pieceAtPosition(position: movesRightMovement) == null) {
          movesRightMoves.add(Move(
              newPosition: movesRightMovement,
              piece: piece,
              previousPosition: position));
        }
      }
    }
    return movesRightMoves;
  }

  movesLeft({Piece piece}) {
    List<Move> movesLeftMoves = [];
    for (int i = 1; i < 15; i++) {
      var movesLeftMovement =
          position.sum(coordinate: Coordinate(col: -i, row: 0));
      if (board.isValidPosition(position: movesLeftMovement)) {
        //camino 0 nuestra pieza adelante
        if (board.pieceAtPosition(position: movesLeftMovement) != null &&
            board.pieceAtPosition(position: movesLeftMovement)?.side ==
                this.side) {
          break;
        }
        //camino 1 tiene pieza contrincante
        if (board.pieceAtPosition(position: movesLeftMovement) != null &&
            board.pieceAtPosition(position: movesLeftMovement)?.side !=
                this.side) {
          movesLeftMoves.add(Move(
              newPosition: movesLeftMovement,
              piece: piece,
              pieceToCapture:
                  board.pieceAtPosition(position: movesLeftMovement),
              previousPosition: position));
          break;
        }
        //camino 2 es nulo
        if (board.pieceAtPosition(position: movesLeftMovement) == null) {
          movesLeftMoves.add(Move(
              newPosition: movesLeftMovement,
              piece: piece,
              previousPosition: position));
        }
      }
    }
    return movesLeftMoves;
  }
}
