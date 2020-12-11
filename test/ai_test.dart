
import '../src/classes/pieces/pawn.dart';
import '../src/classes/board.dart';
import '../src/classes/move.dart';
import '../src/classes/coordinate.dart';
import 'package:test/test.dart';
import '../src/classes/ai.dart';
import '../src/shared/types/piece_color.dart';
import '../src/classes/pieces/queen.dart';
import '../src/classes/pieces/king.dart';
import '../src/classes/pieces/bishop.dart';
import '../src/classes/pieces/rook.dart';

testAI(){
  //testBestMoveCaptureQueen();
  //testBestMoveCapturePawn();
  //testMultipleCapturesBestMove();
  //testFilterCaptureMovesWhite();
  //testFilterCaptureMovesBlack();
  testFilterCaptureMoves();
  testFilterPawnMoves();
  testFilterBishopMoves();
  testFilterRookMoves();
}

testFilterRookMoves(){
  test('filter filterRookMoves', () {
    List<List<String>> matrixStringBoard =
      [[' ''r''h'' ''b''b''q''q''k''k''b''b''h''h''r''r'
        ' '' '' '' ''Q'' ''q''q''k''k''b''b''h''h''r''r'
        ' '' '' '' '' '' ''p''p'' '' ''p''p''p''p''p''p'
        ' '' '' '' '' '' '' '' '' '' ''p'' ''p''p''p''p'
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' ''Q'' '' '' '' ''p'' '' ''q'' '' '' '' '' '' '
        ' '' '' '' '' ''p'' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' ''q'' '' '' '' '' '
        ' '' '' '' '' ''P'' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' ''P'' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        'P''P''P''P''P''P''P''P'' '' ''P''P''P''P''P''P'
        'P''P''P''P''P''P''P''P'' '' ''P''P''P''P''P''P'
        'R''R''H''H''B''B''Q''Q''Q''K''B''B''H''H''R''R'
        'R''R''H''H''B''B'' ''Q''K''K''B''B''H''H''R''R'
    ]];

    Board board = Board(
                  stringBoard:
                  matrixStringBoard.toString().replaceAll(RegExp(r'[^\w\s]+'), ''));

    AI ai = AI(
            board: board,
            side: PIECE_COLOR.BLACK);

    var filteredRookMoves = ai.filterRookMoves(
                          moves: board.getBestMoves(side: PIECE_COLOR.BLACK));
    

    for(var move in filteredRookMoves){
      expect((move.piece is Rook), true);
    }
    
  }); 
}

testFilterBishopMoves(){
  test('filter filterBishopMoves', () {
    List<List<String>> matrixStringBoard =
      [[' ''r''h'' ''b''b''q''q''k''k''b''b''h''h''r''r'
        ' '' '' '' ''Q'' ''q''q''k''k''b''b''h''h''r''r'
        ' '' '' '' '' '' ''p''p'' '' ''p''p''p''p''p''p'
        ' '' '' '' '' '' '' '' '' '' ''p'' ''p''p''p''p'
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' ''Q'' '' '' '' ''p'' '' ''q'' '' '' '' '' '' '
        ' '' '' '' '' ''p'' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' ''q'' '' '' '' '' '
        ' '' '' '' '' ''P'' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' ''P'' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        'P''P''P''P''P''P''P''P'' '' ''P''P''P''P''P''P'
        'P''P''P''P''P''P''P''P'' '' ''P''P''P''P''P''P'
        'R''R''H''H''B''B''Q''Q''Q''K''B''B''H''H''R''R'
        'R''R''H''H''B''B'' ''Q''K''K''B''B''H''H''R''R'
    ]];

    Board board = Board(
                  stringBoard:
                  matrixStringBoard.toString().replaceAll(RegExp(r'[^\w\s]+'), ''));

    AI ai = AI(
            board: board,
            side: PIECE_COLOR.BLACK);

    var filteredBishopMoves = ai.filterBishopMoves(
                          moves: board.getBestMoves(side: PIECE_COLOR.BLACK));
    

    for(var move in filteredBishopMoves){
      expect((move.piece is Bishop), true);
    }
  }); 
}

testFilterPawnMoves(){
  test('filter filterPawnMoves', () {
    List<List<String>> matrixStringBoard =
      [[' ''r''h'' ''b''b''q''q''k''k''b''b''h''h''r''r'
        ' '' '' '' ''Q'' ''q''q''k''k''b''b''h''h''r''r'
        ' '' '' '' '' '' ''p''p'' '' ''p''p''p''p''p''p'
        ' '' '' '' '' '' '' '' '' '' ''p'' ''p''p''p''p'
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' ''Q'' '' '' '' ''p'' '' ''q'' '' '' '' '' '' '
        ' '' '' '' '' ''p'' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' ''q'' '' '' '' '' '
        ' '' '' '' '' ''P'' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' ''P'' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        'P''P''P''P''P''P''P''P'' '' ''P''P''P''P''P''P'
        'P''P''P''P''P''P''P''P'' '' ''P''P''P''P''P''P'
        'R''R''H''H''B''B''Q''Q''Q''K''B''B''H''H''R''R'
        'R''R''H''H''B''B'' ''Q''K''K''B''B''H''H''R''R'
    ]];

    Board board = Board(
                  stringBoard:
                  matrixStringBoard.toString().replaceAll(RegExp(r'[^\w\s]+'), ''));

    AI ai = AI(
            board: board,
            side: PIECE_COLOR.BLACK);

    var filteredPawnMoves = ai.filterPawnMoves(
                          moves: board.getBestMoves(side: PIECE_COLOR.BLACK));
    
    var nearPieceToValueMove = ai.nearPieceToValueMove(
                          moves: filteredPawnMoves , value: 7);

    for(var move in filteredPawnMoves){
      expect((move.piece is Pawn), true);
    }

    expect((nearPieceToValueMove.piece.position.row == 6), true);
    expect((nearPieceToValueMove.piece.position.row == 5), false);
  }); 
}

testFilterCaptureMoves(){
  test('filter capture queen', () {
    List<List<String>> matrixStringBoard =
      [[' ''r''h'' ''b''b''q''q''k''k''b''b''h''h''r''r'
        ' '' '' '' ''Q'' ''q''q''k''k''b''b''h''h''r''r'
        ' '' '' '' '' '' ''p''p'' '' ''p''p''p''p''p''p'
        ' '' '' '' '' '' '' '' '' '' ''p'' ''p''p''p''p'
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' ''Q'' '' '' '' '' '' '' ''q'' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' ''p'' '' '' '' '' ''q'' '' '' '' '' '
        ' '' '' '' '' ''P'' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' ''P'' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        'P''P''P''P''P''P''P''P'' '' ''P''P''P''P''P''P'
        'P''P''P''P''P''P''P''P'' '' ''P''P''P''P''P''P'
        'R''R''H''H''B''B''Q''Q''Q''K''B''B''H''H''R''R'
        'R''R''H''H''B''B'' ''Q''K''K''B''B''H''H''R''R'
    ]];

    Board board = Board(
                  stringBoard:
                  matrixStringBoard.toString().replaceAll(RegExp(r'[^\w\s]+'), ''));

    AI ai = AI(
            board: board,
            side: PIECE_COLOR.BLACK);
    
    var captureKingMoves = ai.captureKing(
                            moves: board.getBestMoves(side: PIECE_COLOR.BLACK));

    var captureQueenMoves = ai.captureQueen(
                            moves: board.getBestMoves(side: PIECE_COLOR.BLACK));

    var defendBaseMoves = ai.defendBase(
                            moves: board.getBestMoves(side: PIECE_COLOR.BLACK));

    var capturePawnOnRowMoves = ai.capturePawnsOnRow(
                            moves: board.getBestMoves(side: PIECE_COLOR.BLACK));
    
    var filterPawnCaptureMoves = ai.filterPawnCaptureMoves(
                            moves: board.getBestMoves(side: PIECE_COLOR.BLACK));

 
    
    for(var move in filterPawnCaptureMoves){
      expect((move.pieceToCapture.position.row != null && move.piece is Pawn), true);
    }
    
    for(var move in capturePawnOnRowMoves){
      expect(move.pieceToCapture is Pawn, true);
    }

    for(var move in defendBaseMoves){
      expect(move.pieceToCapture is Queen, true);
    }
    
    for(var move in captureKingMoves){
      expect(move.pieceToCapture is King,true);
    }

    for(var move in captureQueenMoves){
      expect(move.pieceToCapture is Queen,true);
    }
    }
  );
}

testFilterCaptureMovesWhite(){
    test('filter capture moves', () {
    List<List<String>> matrixStringBoard =
      [[' ''r''h'' ''b''b''q''q''k''k''b''b''h''h''r''r'
        ' '' '' '' '' '' ''q''q''k''k''b''b''h''h''r''r'
        ' '' '' '' '' '' ''p''p'' '' ''p''p''p''p''p''p'
        ' '' '' '' '' '' '' '' '' '' ''p'' ''p''p''p''p'
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' ''Q'' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' ''q'' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        'P''P''P''P''P''P''P''P'' ''P''P''P''P''P''P''P'
        'P''P''P''P''P''P''P''P'' ''P''P''P''P''P''P''P'
        'R''R''H''H''B''B''Q''Q''Q''K''B''B''H''H''R''R'
        'R''R''H''H''B''B'' ''Q''K''K''B''B''H''H''R''R'
    ]];

    var bestPosition = [
      Coordinate(row: 1, col: 8),
      Coordinate(row: 1, col: 9),
    ];

    Board board = Board(
                  stringBoard:
                  matrixStringBoard.toString().replaceAll(RegExp(r'[^\w\s]+'), ''));

    AI ai = AI(
            board: board,
            side: PIECE_COLOR.WHITE);

    var filteredMoves = ai.filterCaptureMoves(
                            board: board,
                            depth: 4,
                            moves: board.getBestMoves(
                                    side: PIECE_COLOR.WHITE));

      for(var move in filteredMoves){
          expect(
          bestPosition.any((e) =>
              e.row == move.newPosition.row && e.col == move.newPosition.col),
          true);
      }
    }
  );
}

testFilterCaptureMovesBlack(){
    test('filter capture moves', () {
    List<List<String>> matrixStringBoard =
      [[' ''r''h'' ''b''b''q''q''k''k''b''b''h''h''r''r'
        ' '' '' '' ''Q'' ''q''q''k''k''b''b''h''h''r''r'
        ' '' '' '' '' '' ''p''p''q'' ''p''p''p''p''p''p'
        ' '' '' '' '' '' '' '' '' '' ''p'' ''p''p''p''p'
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' ''Q'' '' '' '' '' '' '' ''q'' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' ''q'' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' ''P'' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        'P''P''P''P''P''P''P''P'' '' ''P''P''P''P''P''P'
        'P''P''P''P''P''P''P''P'' '' ''P''P''P''P''P''P'
        'R''R''H''H''B''B''Q''Q'' ''K''B''B''H''H''R''R'
        'R''R''H''H''B''B'' ''Q''K''K''B''B''H''H''R''R'
    ]];

    var bestPosition = [
      Coordinate(row: 15, col: 8),
      Coordinate(row: 14, col: 9),
      Coordinate(row: 1, col: 4),
      Coordinate(row: 9, col: 10),
      Coordinate(row: 5, col: 1),
      Coordinate(row: 5, col: 8), // porque permite esa si esta filtrando capturas
    ];

    Board board = Board(
                  stringBoard:
                  matrixStringBoard.toString().replaceAll(RegExp(r'[^\w\s]+'), ''));

    AI ai = AI(
            board: board,
            side: PIECE_COLOR.BLACK);

    var filteredMoves = ai.filterCaptureMoves(
                            board: board,
                            depth: 4,
                            moves: board.getBestMoves(
                                    side: PIECE_COLOR.BLACK));

      for(var move in filteredMoves){
          expect(
          bestPosition.any((e) =>
              e.row == move.newPosition.row && e.col == move.newPosition.col),
          true);
      }
    }
  );
}

testBestMoveCaptureQueen() {
  test('best move for capture queen', () {
    List<List<String>> matrixStringBoard =
      [[' ''r''h'' ''b''b''q''q''k''k''b''b''h''h''r''r'
        ' '' '' '' '' '' ''q''q''k''k''b''b''h''h''r''r'
        ' '' '' '' '' '' ''p''p''p''p''p''p''p''p''p''p'
        ' '' '' '' '' '' '' ''Q'' '' ''p'' ''p''p''p''p'
        ' '' '' '' '' '' '' '' ''p'' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' ''p'' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' ''q'' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        'P''P''P''P''P''P''P''P''P''P''P''P''P''P''P''P'
        'P''P''P''P''P''P''P''P''P''P''P''P''P''P''P''P'
        'R''R''H''H''B''B''Q''Q''K''K''B''B''H''H''R''R'
        'R''R''H''H''B''B'' ''Q''K''K''B''B''H''H''R''R'
    ]];

    var bestPosition = [
      Coordinate(row: 3, col: 7),
    ];

    Board board = Board(
        stringBoard:
            matrixStringBoard.toString().replaceAll(RegExp(r'[^\w\s]+'), ''));

    AI ai = AI(board: board,side: PIECE_COLOR.BLACK);

    var bestMove = ai.makeBestMove();

      print('bestMove ${bestMove.newPosition.row} ${bestMove.newPosition.col} ${bestMove.piece.stringRep} ${bestMove.piece.side} ${bestMove.previousPosition.row} ${bestMove.previousPosition.col}');
      expect(
          bestPosition.any((e) =>
              e.row == bestMove.newPosition.row && e.col == bestMove.newPosition.col),
          true);
    }
    );
}

testBestMoveCapturePawn() {
    test('best move for capture pawn', () {
    List<List<String>> matrixStringBoard =
      [['r''r''h''h''b''b'' ''q''k''k''b''b''h''h''r''r'
        'r''r''h''h''b''b''q''q''k''k''b''b''h''h''r''r'
        'p''p''p''p''p''p''p''p''p''p''p''p''p''p''p''p'
        'p''p''p''p''p''p''p''p''p''p''p''p''p''p''p''p'
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' ''q'' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' ''P'' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        'P''P''P''P''P''P'' ''P''P''P''P''P''P''P''P''P'
        'P''P''P''P''P''P''P''P''P''P''P''P''P''P''P''P'
        'R''R''H''H''B''B''Q''Q''K''K''B''B''H''H''R''R'
        'R''R''H''H''B''B''Q''Q''K''K''B''B''H''H''R''R'
    ]];

    var bestPosition = [
      Coordinate(row: 9, col: 6),
    ];

    Board board = Board(
        stringBoard:
            matrixStringBoard.toString().replaceAll(RegExp(r'[^\w\s]+'), ''));

    AI ai = AI(board: board,side: PIECE_COLOR.BLACK);

    var bestMove = ai.makeBestMove();
      print('bestMove ${bestMove.newPosition.row} ${bestMove.newPosition.col}');
      expect(
          bestPosition.any((e) =>
              e.row == bestMove.newPosition.row && e.col == bestMove.newPosition.col),
          true);
    }
    );
}

testMultipleCapturesBestMove() {
    test('best move for multiple captures', () {
    List<List<String>> matrixStringBoard =
      [[' ''r''h'' ''b''b''q''q''k''k''b''b''h''h''r''r'
        ' '' '' '' ''Q'' ''q''q''k''k''b''b''h''h''r''r'
        ' '' '' '' '' '' ''p''p''q'' ''p''p''p''p''p''p'
        ' '' '' '' '' '' '' '' '' '' ''p'' ''p''p''p''p'
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' ''Q'' '' '' '' '' '' '' ''q'' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' ''q'' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' ''P'' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        'P''P''P''P''P''P''P''P'' '' ''P''P''P''P''P''P'
        'P''P''P''P''P''P''P''P'' '' ''P''P''P''P''P''P'
        'R''R''H''H''B''B''Q''Q'' ''K''B''B''H''H''R''R'
        'R''R''H''H''B''B'' ''Q''K''K''B''B''H''H''R''R'
    ]];

    var bestPosition = [
      Coordinate(row: 5, col: 1),
    ];

    Board board = Board(
        stringBoard:
            matrixStringBoard.toString().replaceAll(RegExp(r'[^\w\s]+'), ''));

    AI ai = AI(board: board,side: PIECE_COLOR.BLACK);

    for(var move in ai.filterCaptureMoves(moves: board.getBestMoves(side: PIECE_COLOR.BLACK))){
      print('move ${move.newPosition.row} ${move.newPosition.col}');
    }

    var bestMove = ai.makeBestMove();
      print('bestMove ${bestMove.piece.stringRep} ${bestMove.newPosition.row} ${bestMove.newPosition.col}');
      print('desde ${bestMove.previousPosition.row} ${bestMove.previousPosition.col}');
      expect(
          bestPosition.any((e) =>
              e.row == bestMove.newPosition.row && e.col == bestMove.newPosition.col),
          true);
    }
    );
}