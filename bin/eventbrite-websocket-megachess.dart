import '../src/classes/websocket/chess_socket.dart';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('please provide your auth_token');
    //exit(0); poner esto despues
  }
  //final authToken = arguments[0];
  //print('authToken: $authToken');
  ChessSocket(authToken: 'f98e6c31-012d-4a77-9436-719601cd8f1f');
}
