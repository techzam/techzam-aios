import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/gpt_service.dart';

class VoiceButton extends StatefulWidget {
  const VoiceButton({super.key});

  @override
  State<VoiceButton> createState() => _VoiceButtonState();
}

class _VoiceButtonState extends State<VoiceButton> {
  bool _isListening = false;

  void _simulateVoice(BuildContext context) async {
    setState(() => _isListening = true);
    await Future.delayed(const Duration(seconds: 2));

    final gpt = Provider.of<GPTService>(context, listen: false);
    gpt.sendMessage("Hello Zynix, what can you do?");

    setState(() => _isListening = false);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => _simulateVoice(context),
        child: CircleAvatar(
          radius: 35,
          backgroundColor: Colors.deepPurple,
          child: Icon(
            _isListening ? Icons.mic : Icons.mic_none,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
