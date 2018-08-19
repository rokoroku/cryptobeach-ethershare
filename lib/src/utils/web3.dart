@JS()
library web3;

import 'dart:async';

import 'package:js/js.dart';

@JS()
external dynamic getWeb3Instance();

@JS()
external String getCoinbase();

@JS()
external String getAccount();

@JS()
external dynamic getContract();

@JS('donate')
external dynamic _donate(String to, double value, Function cb);

@JS('transfer')
external dynamic _transfer(String to, double value, Function cb);

Future<void> donate(String to, double value) {
  final completer = new Completer<void>();
  _donate(to, value, allowInterop(completer.complete));
  return completer.future;
}

Future<void> transfer(String to, double value) {
  final completer = new Completer<void>();
  _transfer(to, value, allowInterop(completer.complete));
  return completer.future;
}
