import '../shared/types/piece_color.dart';
import 'coordinate.dart';
import 'move.dart';
import 'dart:io';
import 'pieces/empty_piece.dart';
import 'pieces/piece.dart';

class Board {
  List<List<Piece>> board = [];
  String stringBoard;
  String board_id;

  Board({this.stringBoard, String side}) {
    print(side == 'white' ? 'SOS BLANCAS' : 'SOS NEGRAS');
    fillBoard(stringBoard: stringBoard);
    showBoard(board: board);
  }

  Board.copy({List<List<Piece>> board}) {
    this.board = board;
  }

  int evaluateBoard({PIECE_COLOR side}) {
    int whiteScore = 0;
    int blackScore = 0;

    for (int y = 0; y <= 15; y++) {
      for (int x = 0; x <= 15; x++) {
        if (this.board[y][x].side == PIECE_COLOR.WHITE) {
          whiteScore += this.board[y][x].value;
        } else if (this.board[y][x].side == PIECE_COLOR.BLACK) {
          blackScore += this.board[y][x].value;
        }
      }
    }

    return side == PIECE_COLOR.BLACK
        ? blackScore - whiteScore
        : whiteScore - blackScore;
  }

  List<Move> getBestMoves({PIECE_COLOR side}) {
    List<Move> moves = [];
    for (int y = 0; y <= 15; y++) {
      for (int x = 0; x <= 15; x++) {
        if (this.board[y][x].stringRep != ' ') {
          if (this.board[y][x].side == side) {
            if (this.board[y][x].canMove()) {
              var possibleMoves = this.board[y][x].getPossibleMoves();
              if (possibleMoves != null &&
                  possibleMoves.isNotEmpty &&
                  possibleMoves != 0 &&
                  possibleMoves.length != 0) {
                moves.addAll(possibleMoves);
              }
            }
          }
        }
      }
    }
    return moves;
  }

  makeMove({Move move}) {
    this.board[move.previousPosition.row][move.previousPosition.col] =
        EmptyPiece(board: this, position: move.previousPosition, side: null);
    this.board[move.newPosition.row][move.newPosition.col] = move.piece;
    move.piece.position = move.newPosition;
  }

  unMakeMove({Move move}) {
    if (move.pieceToCapture != null) {
      this.board[move.newPosition.row][move.newPosition.col] =
          move.pieceToCapture;
    }
    this.board[move.previousPosition.row][move.previousPosition.col] =
        move.piece;
    move.piece.position = move.previousPosition;
  }


  bool isValidPosition({Coordinate position}) {
    if (position.row >= 0 &&
        position.row <= 15 &&
        position.col >= 0 &&
        position.col <= 15) {
      return true;
    }
    return false;
  }

  Piece pieceAtPosition({Coordinate position}) {
    if (board[position.row][position.col].stringRep != ' ') {
      return board[position.row][position.col];
    }
    return null;
  }

  fillBoard({String stringBoard}) {
    List<Piece> piecesToAdd = [];
    int indexBoard = 0;
    var piece = Piece();

    for (int y = 0; y <= 15; y++) {
      for (int x = 0; x <= 15; x++) {
        piecesToAdd.add(piece.returnPieceByString(
            stringPiece: stringBoard[indexBoard], board: this, y: y, x: x));
        indexBoard = indexBoard + 1;
      }
      board.add(piecesToAdd);
      piecesToAdd = [];
    }
  }

  showBoard({List<List<Piece>> board}) {
    print('');
    for (int y = 0; y <= 15; y++) {
      // x columnas ,  y filas
      for (int x = 0; x <= 15; x++) {
        stdout.write(board[y][x].stringRep);
      }
      print('');
    }
    print('');
  }
}
