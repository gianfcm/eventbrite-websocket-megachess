import '../src/classes/pieces/queen.dart';
import '../src/classes/board.dart';
import '../src/classes/coordinate.dart';
import 'package:test/test.dart';
import '../src/shared/types/piece_color.dart';

testQueen(){
  print('testing queen');
  testMoveQueen(); 
  testMoves();
  testCanMove();
  testGetPossibleMoves();
  testStringRep();
}

testStringRep(){
    test('testStringRep Queen', () {

    Queen queen = Queen(side: PIECE_COLOR.WHITE);
    Queen queen2 = Queen(side: PIECE_COLOR.BLACK);

    expect(queen.stringRep == '♕',true);
    expect(queen2.stringRep == '♛', true);
});
}

testGetPossibleMoves(){
    test('testGetPossibleMoves Queen', () {
      List<List<String>> matrixStringBoard =
      [['r''r''h''h''b''b''q''q''k''k''b''b''h''h''r''r'
        'r''r''h''h''b''b''q''q''k''k''b''b''h''h''r''r'
        'p''p''p''p''p''p''p''p''p''p''p''p''p''p''p''p'
        'p''p''p''p''p''p''p''p''p''p''p''p''p''p''p''p'
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        'q'' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
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

    Queen queen = board.board[0][6];
    Queen queen2 = board.board[5][0];

    var possibleMoves = queen.getPossibleMoves();
    var possibleMoves2 = queen2.getPossibleMoves();

    expect(possibleMoves.length == 0,true);
    expect(possibleMoves2.length == 31, true);
});
}

testCanMove(){
  test('testCanMove Queen ', () {
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

    Queen queen = board.board[0][6];

    var canMove = queen.canMove();
    expect(canMove == false, true );
});
}

testMoves(){
    test('testMoves Queen ', () {
      List<List<String>> matrixStringBoard =
      [['r''r''h''h''b''b''q''q''k''k''b''b''h''h''r''r'
        'r''r''h''h''b''b''q''q''k''k''b''b''h''h''r''r'
        'p''p''p''p''p''p''p''p''p''p''p''p''p''p''p''p'
        'p''p''p''p''p''p''p''p''p''p''p''p''p''p''p''p'
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        'q'' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
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

    Queen queen = board.board[5][0];

    var movesUp = queen.movesUp();
    var movesDown = queen.movesDown();
    var movesLeft = queen.movesLeft();
    var movesRight = queen.movesRight();
    var movesNorthWest = queen.northWestMoves();
    var movesNorthEast = queen.northEastMoves();
    var movesSouthWest = queen.southWestMoves();
    var movesSouthEast = queen.southEastMoves();

    expect(movesUp.length == 1, true);
    expect(movesDown.length == 7, true);
    expect(movesLeft.length == 0, true);
    expect(movesRight.length == 15, true);
    expect(movesNorthWest.length == 0,true);
    expect(movesNorthEast.length == 1,true);
    expect(movesSouthWest.length == 0,true);
    expect(movesSouthEast.length == 7,true);
});
}

testMoveQueen() {
  test('queen moves during a position', () {
    List<List<String>> matrixStringBoard =
      [['r''r''h''h''b''b'' ''q''k''k''b''b''h''h''r''r'
        'r''r''h''h''b''b''q''q''k''k''b''b''h''h''r''r'
        'p''p''p''p''p''p''p''p''p''p''p''p''p''p''p''p'
        'p''p''p''p''p''p''p''p''p''p''p''p''p''p''p''p'
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' ''q'' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' ''p''p''p'' '
        ' '' '' '' '' '' '' '' '' '' '' '' ''p''q''p'' '
        ' '' '' '' '' '' '' '' '' '' '' '' ''p''p''p'' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        ' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '
        'P''P''P''P''P''P''P''P''P''P''P''P''P''P''P''P'
        'P''P''P''P''P''P''P''P''P''P''P''P''P''P''P''P'
        'R''R''H''H''B''B''Q''Q''K''K''B''B''H''H''R''R'
        'R''R''H''H''B''B''Q''Q''K''K''B''B''H''H''R''R'
    ]];

    var correctPositions = [
      //right moves
      Coordinate(row: 5, col: 7), Coordinate(row: 5, col: 8),
      Coordinate(row: 5, col: 9),
      Coordinate(row: 5, col: 10), Coordinate(row: 5, col: 11),
      Coordinate(row: 5, col: 12),
      Coordinate(row: 5, col: 13), Coordinate(row: 5, col: 14),
      Coordinate(row: 5, col: 15),
      //left moves
      Coordinate(row: 5, col: 5), Coordinate(row: 5, col: 4),
      Coordinate(row: 5, col: 3),
      Coordinate(row: 5, col: 2), Coordinate(row: 5, col: 1),
      Coordinate(row: 5, col: 0),
      //moves up
      Coordinate(row: 4, col: 6),
      //moves down
      Coordinate(row: 6, col: 6), Coordinate(row: 7, col: 6),
      Coordinate(row: 8, col: 6),
      Coordinate(row: 9, col: 6), Coordinate(row: 10, col: 6),
      Coordinate(row: 11, col: 6),
      Coordinate(row: 12, col: 6),
      //south east moves
      Coordinate(row: 6, col: 7), Coordinate(row: 7, col: 8),
      Coordinate(row: 9, col: 10),
      Coordinate(row: 8, col: 9), Coordinate(row: 10, col: 11),
      Coordinate(row: 11, col: 12),
      Coordinate(row: 12, col: 13),
      //south west moves
      Coordinate(row: 6, col: 5), Coordinate(row: 7, col: 4),
      Coordinate(row: 8, col: 3),
      Coordinate(row: 9, col: 2), Coordinate(row: 10, col: 1),
      Coordinate(row: 11, col: 0),
      //north east moves
      Coordinate(row: 4, col: 7),
      //north west moves
      Coordinate(row: 4, col: 5)
    ];

    Board board = Board(
        stringBoard:
            matrixStringBoard.toString().replaceAll(RegExp(r'[^\w\s]+'), ''));
    Queen queen = board.board[5][6];
    Queen queen2 = board.board[7][13];
    Queen queen3 = board.board[1][6];

    var moves = queen.getPossibleMoves();
    var moves2 = queen2.getPossibleMoves();
    var moves3 = queen3.getPossibleMoves();
    
    expect(moves.length==correctPositions.length, true);
    expect(moves2.length == 0, true);
    expect(moves3.length == 1, true );
    expect(moves3[0].newPosition.row == 0 && moves3[0].newPosition.col==6 ,true);    

    for (var move in moves) {
      expect(
          correctPositions.any((e) =>
              e.row == move.newPosition.row && e.col == move.newPosition.col),
          true);
    }
  });
}
