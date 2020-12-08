import 'dart:convert';
import 'package:test/test.dart';
import 'package:web_socket_channel/io.dart';
import '../src/shared/constants/websocket_uri.dart';
import '../src/classes/pieces/queen.dart';
import '../src/classes/board.dart';
import '../src/classes/coordinate.dart';

void main() {
  print('testing move queen');
  testMoveQueen();
}

testSocketConnection() {
  var authToken = '';
  var channel = IOWebSocketChannel.connect(WS_BASE_URI + authToken);
  var message_json;
  test('Socket connection to ${WS_BASE_URI}$authToken', () {
    expect(channel.stream.listen((event) {
      message_json = event;
    }), json.decode(message_json) as Map);
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
    var moves = queen.getPossibleMoves();
    print('Verifying moves positions');
    for (var move in moves) {
      expect(
          correctPositions.any((e) =>
              e.row == move.newPosition.row && e.col == move.newPosition.col),
          true);
    }
  });
}
