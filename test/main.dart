import 'dart:convert';
import 'package:test/test.dart';
import 'package:web_socket_channel/io.dart';
import '../src/shared/constants/websocket_uri.dart';
import 'ai_test.dart';
import 'board_test.dart';
import 'pawn_test.dart';
import 'queen_test.dart';


void main() {
  //testBoard();
  testQueen();
  //testPawnMoves();
  //testAI();
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


