import 'package:flutter/material.dart';

class GPTService with ChangeNotifier {
  final List<Map<String, String>> _messages = [];
  List<Map<String, String>> get messages => _messages.reversed.toList();

  Future<void> sendMessage(String message) async {
    _messages.add({"role": "user", "content": message});
    notifyListeners();

    const dummyReply = "Processing your command... (Zynix AI Mode)";
    await Future.delayed(const Duration(seconds: 1));

    _messages.add({"role": "assistant", "content": dummyReply});
    notifyListeners();
  }
}
