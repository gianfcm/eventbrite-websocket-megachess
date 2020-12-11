# Eventbrite Websocket Megachess

## Requeriments 

You need to have :
  - Dart SDK version: 2.10.3 (stable) or the latest stable version.

## Packages

This application uses the following packages : 
```
dependencies:
  web_socket_channel: ^1.1.0

dev_dependencies:
  test: ^1.15.6
```

For download the packages run the following command :
```
dart pub get
```

## How to start

For play you need to run the following command with your authToken :

```
dart run bin/eventbrite-websocket-megachess.dart 123456789-987654321f
```

## Results

When each game is over the result is saved on results.txt on /bin/results.txt

## Test

The test are in the test folder -> test/

For run the tests you need to run the following command :

```
dart run test/main.dart
```




