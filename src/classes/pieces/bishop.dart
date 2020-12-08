import '../../shared/types/piece_color.dart';
import '../board.dart';
import '../coordinate.dart';
import '../move.dart';
import 'piece.dart';
import 'queen.dart';

class Bishop extends Piece implements Queen {
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
  List<Move> getPossibleMoves() {
    List<Move> moves = [];
    moves.addAll(burstNorthWestMoves(piece: this));
    moves.addAll(burstNorthEastMoves(piece: this));
    moves.addAll(burstSouthWestMoves(piece: this));
    moves.addAll(burstSouthEastMoves(piece: this));
    if (moves.isNotEmpty) {
      return moves;
    }
    moves.addAll(northWestMoves(piece: this));
    if (moves.isNotEmpty) {
      return moves;
    }
    moves.addAll(northEastMoves(piece: this));
    if (moves.isNotEmpty) {
      return moves;
    }
    moves.addAll(southWestMoves(piece: this));
    if (moves.isNotEmpty) {
      return moves;
    }
    moves.addAll(southEastMoves(piece: this));
    return moves;
  }

  burstNorthWestMoves({Piece piece}) {
    List<Move> burstNorthWestMoves = [];

    for (int i = 1; i <= 15; i++) {
      var northWestMovement =
          position.sum(coordinate: Coordinate(col: -i, row: -i));
      if (board.isValidPosition(position: northWestMovement)) {
        if (board.pieceAtPosition(position: northWestMovement) != null &&
            board.pieceAtPosition(position: northWestMovement)?.side == side) {
          break;
        }
        if (board.pieceAtPosition(position: northWestMovement) != null &&
            board.pieceAtPosition(position: northWestMovement)?.side !=
                this.side) {
          burstNorthWestMoves.add(Move(
              newPosition: northWestMovement,
              piece: piece,
              pieceToCapture:
                  board.pieceAtPosition(position: northWestMovement),
              previousPosition: position));
          break;
        }
      }
    }
    return burstNorthWestMoves;
  }

  burstNorthEastMoves({Piece piece}) {
    List<Move> burstNorthEastMoves = [];

    for (int i = 1; i <= 15; i++) {
      var northEastMovement =
          position.sum(coordinate: Coordinate(col: i, row: -i));
      if (board.isValidPosition(position: northEastMovement)) {
        if (board.pieceAtPosition(position: northEastMovement) != null &&
            board.pieceAtPosition(position: northEastMovement)?.side == side) {
          break;
        }
        if (board.pieceAtPosition(position: northEastMovement) != null &&
            board.pieceAtPosition(position: northEastMovement)?.side !=
                this.side) {
          burstNorthEastMoves.add(Move(
              newPosition: northEastMovement,
              piece: piece,
              pieceToCapture:
                  board.pieceAtPosition(position: northEastMovement),
              previousPosition: position));
          break;
        }
      }
    }
    return burstNorthEastMoves;
  }

  burstSouthWestMoves({Piece piece}) {
    List<Move> burstSouthWestMoves = [];

    for (int i = 1; i <= 15; i++) {
      var southWestMovement =
          position.sum(coordinate: Coordinate(col: -i, row: i));
      if (board.isValidPosition(position: southWestMovement)) {
        if (board.pieceAtPosition(position: southWestMovement) != null &&
            board.pieceAtPosition(position: southWestMovement)?.side == side) {
          break;
        }
        if (board.pieceAtPosition(position: southWestMovement) != null &&
            board.pieceAtPosition(position: southWestMovement)?.side !=
                this.side) {
          burstSouthWestMoves.add(Move(
              newPosition: southWestMovement,
              piece: piece,
              pieceToCapture:
                  board.pieceAtPosition(position: southWestMovement),
              previousPosition: position));
          break;
        }
      }
    }
    return burstSouthWestMoves;
  }

  burstSouthEastMoves({Piece piece}) {
    List<Move> burstSouthEastMoves = [];

    for (int i = 1; i <= 15; i++) {
      var southEastMovement =
          position.sum(coordinate: Coordinate(col: i, row: i));
      if (board.isValidPosition(position: southEastMovement)) {
        if (board.pieceAtPosition(position: southEastMovement) != null &&
            board.pieceAtPosition(position: southEastMovement)?.side == side) {
          break;
        }
        if (board.pieceAtPosition(position: southEastMovement) != null &&
            board.pieceAtPosition(position: southEastMovement)?.side !=
                this.side) {
          burstSouthEastMoves.add(Move(
              newPosition: southEastMovement,
              piece: piece,
              pieceToCapture:
                  board.pieceAtPosition(position: southEastMovement),
              previousPosition: position));
          break;
        }
      }
    }
    return burstSouthEastMoves;
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
}
