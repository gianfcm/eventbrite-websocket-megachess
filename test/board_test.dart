
import '../src/classes/pieces/pawn.dart';
import '../src/classes/board.dart';
import '../src/classes/move.dart';
import 'package:test/test.dart';
import '../src/classes/coordinate.dart';
import '../src/shared/types/piece_color.dart';


testBoard(){
  testEvaluateBoard();
  //testMakeUnMakeMove();
  //testMakeUnMakeMoveOnPieceCapture();
}


testEvaluateBoard(){
  test('evaluate board', () {
      List<List<String>> matrixStringBoard =
      [['r''r''h''h''b''b''q''q''k''k''b''b''h''h''r''r'
        'r''r''h''h''b''b''q''q''k''k''b''b''h''h''r''r'
        ' ''p''p''p''p''p''p''p''p''p''p''p''p''p''p''p'
        ' ''p''p''p''p''p''p''p''p''p''p''p''p''p''p''p'
        'p'' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        'P''P''P''P''P''P''P''P''P''P''P''P''P''P''P''P'
        'P''P''P''P''P''P''P''P''P''P''P''P''P''P''P''P'
        'R''R''H''H''B''B''Q''Q''K''K''B''B''H''H''R''R'
        'R''R''H''H''B''B''Q''Q''K''K''B''B''H''H''R''R'
    ]];

    Board board = Board(
        stringBoard:
            matrixStringBoard.toString().replaceAll(RegExp(r'[^\w\s]+'), ''));

    var rating = board.evaluateBoard(side: PIECE_COLOR.BLACK);
    expect(rating == -10,true);
});
}

testMakeUnMakeMove(){
  test('make unmake move', () {
      List<List<String>> matrixStringBoard =
      [['r''r''h''h''b''b''q''q''k''k''b''b''h''h''r''r'
        'r''r''h''h''b''b''q''q''k''k''b''b''h''h''r''r'
        'p''p''p''p''p''p''p''p''p''p''p''p''p''p''p''p'
        'p''p''p''p''p''p''p''p''p''p''p''p''p''p''p''p'
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        'P''P''P''P''P''P''P''P''P''P''P''P''P''P''P''P'
        'P''P''P''P''P''P''P''P''P''P''P''P''P''P''P''P'
        'R''R''H''H''B''B''Q''Q''K''K''B''B''H''H''R''R'
        'R''R''H''H''B''B''Q''Q''K''K''B''B''H''H''R''R'
    ]];

    Board board = Board(
        stringBoard:
            matrixStringBoard.toString().replaceAll(RegExp(r'[^\w\s]+'), ''));

    Pawn pawn = board.pieceAtPosition(position: Coordinate(row: 12,col: 7));

    var move = Move(
      newPosition: Coordinate(row: 10,col: 7),
      piece: pawn,
      previousPosition: pawn.position,
    );
    board.makeMove(move: move);    
    board.showBoard(board: board.board);
    board.unMakeMove(move: move);
    board.showBoard(board: board.board);

  });

}

testMakeUnMakeMoveOnPieceCapture(){
  test('make unmake move', () {
      List<List<String>> matrixStringBoard =
      [['r''r''h''h''b''b''q''q''k''k''b''b''h''h''r''r'
        'r''r''h''h''b''b''q''q''k''k''b''b''h''h''r''r'
        'p''p''p''p''p''p''p''p''p''p''p''p''p''p''p''p'
        'p''p''p''p''p''p''p'' ''p''p''p''p''p''p''p''p'
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' ''p'' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' ''P'' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        'P''P''P''P''P''P'' ''P''P''P''P''P''P''P''P''P'
        'P''P''P''P''P''P''P''P''P''P''P''P''P''P''P''P'
        'R''R''H''H''B''B''Q''Q''K''K''B''B''H''H''R''R'
        'R''R''H''H''B''B''Q''Q''K''K''B''B''H''H''R''R'
    ]];

    Board board = Board(
        stringBoard:
            matrixStringBoard.toString().replaceAll(RegExp(r'[^\w\s]+'), ''));

    Pawn pawn = board.pieceAtPosition(position: Coordinate(row: 8,col: 6));
    Pawn pawn1 = board.pieceAtPosition(position: Coordinate(row: 7,col: 7));

    var move = Move(
      newPosition: pawn.position.sum(coordinate: Coordinate(row: -1,col: 1)),
      piece: pawn,
      pieceToCapture: pawn1,
      previousPosition: pawn.position,
    );
    board.makeMove(move: move);    
    board.showBoard(board: board.board);
    board.unMakeMove(move: move);
    board.showBoard(board: board.board);
  });}